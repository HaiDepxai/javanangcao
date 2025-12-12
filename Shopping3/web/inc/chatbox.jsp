<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- CHATBOX UI + CSS -->
<style>
  :root { --pri:#0d6efd; --bg:#fff; --muted:#f5f6f8; }
  #chat-fab{
    position:fixed; bottom:20px; right:20px; width:52px; height:52px;
    border-radius:50%; border:none; background:var(--pri); color:#fff;
    font-size:22px; cursor:pointer; box-shadow:0 8px 24px rgba(0,0,0,.18); z-index:9999;
  }
  #chat-box{
    position:fixed; bottom:20px; right:20px; width:320px; height:420px;
    background:var(--bg); border-radius:14px; box-shadow:0 16px 40px rgba(0,0,0,.22);
    display:none; flex-direction:column; overflow:hidden; z-index:10000; border:1px solid #e6e8ec;
  }
  .cb-header{
    background:var(--pri); color:#fff; padding:10px 12px; display:flex;
    align-items:center; justify-content:space-between; font-weight:600;
  }
  .cb-close{ background:transparent; border:none; color:#fff; font-size:18px; cursor:pointer; }
  .cb-msgs{ flex:1; padding:12px; overflow-y:auto; background:var(--muted); }
  .bubble{ max-width:76%; padding:8px 10px; border-radius:10px; margin:8px 0; line-height:1.25; font-size:14px; }
  .user{ background:#d1f7c4; margin-left:auto; border-bottom-right-radius:4px; }
  .bot{ background:#fff; border:1px solid #e6e8ec; border-bottom-left-radius:4px; }
  .cb-input{ display:flex; gap:6px; padding:8px; background:#fff; border-top:1px solid #e6e8ec; }
  .cb-input input{ flex:1; border:1px solid #e1e4e8; border-radius:8px; padding:10px; font-size:14px; outline:none; }
  .cb-send{ background:var(--pri); color:#fff; border:none; padding:0 14px; border-radius:8px; cursor:pointer; }
  .cb-mic{ border:1px solid #e1e4e8; background:#fff; border-radius:8px; padding:0 10px; cursor:pointer; }
  .cb-mic.rec{ border-color:#ff4d4f; box-shadow:0 0 0 3px rgba(255,77,79,.15) inset; }
  .cb-hint{ font-size:12px; color:#6c757d; padding:0 12px 8px; }
</style>

<!-- Nút nổi mở chat -->
<button id="chat-fab" title="Chat với cửa hàng">💬</button>

<!-- Hộp chat -->
<div id="chat-box" aria-live="polite">
  <div class="cb-header">
    <span>Hỗ trợ khách hàng</span>
    <button class="cb-close" id="cbClose" aria-label="Đóng">✕</button>
  </div>
  <div class="cb-msgs" id="cbMsgs">
    <div class="bubble bot">Xin chào 👋 Bạn có thể bấm 🎙 để nói, mình sẽ trả lời và đọc lại cho bạn.</div>
  </div>
  <div class="cb-hint" id="cbHint">Mẹo: nói “giá”, “khuyến mãi”, “giao hàng”, “bảo hành”…</div>
  <div class="cb-input">
    <button class="cb-mic" id="cbMic" title="Giữ/nhấn để nói">🎙</button>
    <input id="cbText" type="text" placeholder="Nhập tin nhắn..." autocomplete="off">
    <button class="cb-send" id="cbSend">Gửi</button>
  </div>
</div>

<!-- JS: mở/đóng, gửi, nhận, Voice In/Out -->
<script>
(function(){
  const fab = document.getElementById('chat-fab');
  const box = document.getElementById('chat-box');
  const closeBtn = document.getElementById('cbClose');
  const msgs = document.getElementById('cbMsgs');
  const input = document.getElementById('cbText');
  const sendBtn = document.getElementById('cbSend');
  const micBtn = document.getElementById('cbMic');
  const hint = document.getElementById('cbHint');

  // Open/Close
  fab.onclick = () => { box.style.display='flex'; fab.style.display='none'; input.focus(); };
  closeBtn.onclick = () => { box.style.display='none'; fab.style.display='block'; };

  function addMsg(text, cls){
    const div = document.createElement('div');
    div.className = 'bubble ' + cls;
    div.textContent = text;
    msgs.appendChild(div);
    msgs.scrollTop = msgs.scrollHeight;
  }

  // Send text to servlet
  function sendMessage(text){
    if(!text || !text.trim()) return;
    addMsg(text, 'user');
    input.value = '';
    fetch('<%=request.getContextPath()%>/chatbox', {
      method:'POST',
      headers:{'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},
      body:'message=' + encodeURIComponent(text.trim())
    })
    .then(r => r.text())
    .then(reply => {
      addMsg(reply, 'bot');
      speak(reply);             // Đọc lại câu trả lời
    })
    .catch(() => addMsg('Lỗi kết nối máy chủ.', 'bot'));
  }

  sendBtn.onclick = () => sendMessage(input.value);
  input.addEventListener('keydown', e => { if(e.key==='Enter') sendMessage(input.value); });

  // ===== Voice input (SpeechRecognition) =====
  const SR = window.SpeechRecognition || window.webkitSpeechRecognition;
  let rec = null, listening = false;

  if(SR){
    rec = new SR();
    rec.lang = 'vi-VN';
    rec.interimResults = false;
    rec.maxAlternatives = 1;

    rec.onstart = () => { listening = true; micBtn.classList.add('rec'); hint.textContent = 'Đang nghe... nói đi nhé.'; };
    rec.onend   = () => { listening = false; micBtn.classList.remove('rec'); hint.textContent = 'Mẹo: nói “giá”, “khuyến mãi”, “giao hàng”…'; };
    rec.onerror = () => { listening = false; micBtn.classList.remove('rec'); addMsg('Không nhận được giọng nói. Thử lại nhé.', 'bot'); };

    rec.onresult = (e) => {
      const text = e.results[0][0].transcript;
      addMsg('🎙 ' + text, 'user');
      sendMessage(text);
    };

    micBtn.onclick = () => {
      if(!listening){ try{ rec.start(); }catch(_){} }
      else{ try{ rec.stop(); }catch(_){} }
    };
  } else {
    micBtn.disabled = true;
    micBtn.title = 'Trình duyệt của bạn chưa hỗ trợ nói chuyện';
    hint.textContent = 'Trình duyệt chưa hỗ trợ nhận giọng nói. Hãy gõ tin nhắn.';
  }

  // ===== Voice output (Speech Synthesis) =====
  function speak(text){
    if(!('speechSynthesis' in window)) return;
    const utter = new SpeechSynthesisUtterance(text);
    // Ưu tiên giọng Việt nếu có
    const vi = speechSynthesis.getVoices().find(v => v.lang.startsWith('vi'));
    if(vi) utter.voice = vi;
    utter.lang = (vi && vi.lang) || 'vi-VN';
    speechSynthesis.cancel();  // dừng giọng cũ nếu còn
    speechSynthesis.speak(utter);
  }
})();
</script>
