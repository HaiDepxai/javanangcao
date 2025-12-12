<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Nút nổi mở chat -->
<button id="chat-fab" title="Chat với cửa hàng" aria-controls="chat-box" aria-expanded="false">💬</button>

<!-- Hộp chat -->
<div id="chat-box" aria-live="polite" role="dialog" aria-modal="false">
  <div class="cb-header">
    <span>Hỗ trợ khách hàng</span>
    <button class="cb-close" id="cbClose" aria-label="Đóng">✕</button>
  </div>
  <div class="cb-msgs" id="cbMsgs">
    <div class="bubble bot">Xin chào 👋 Bạn có thể bấm 🎙 để nói, mình sẽ trả lời và đọc lại cho bạn.</div>
  </div>
  <div class="cb-hint" id="cbHint">Mẹo: nói “giá”, “khuyến mãi”, “giao hàng”, “bảo hành”…</div>
  <div class="cb-input">
    <button class="cb-mic" id="cbMic" title="Giữ/nhấn để nói" aria-label="Ghi âm">🎙</button>
    <input id="cbText" type="text" placeholder="Nhập tin nhắn..." autocomplete="off" aria-label="Ô nhập tin nhắn">
    <button class="cb-send" id="cbSend" aria-label="Gửi tin">Gửi</button>
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
  fab.onclick = () => {
    box.style.display = 'flex';
    fab.style.display = 'none';
    fab.setAttribute('aria-expanded', 'true');
    input.focus();
  };
  closeBtn.onclick = () => {
    box.style.display = 'none';
    fab.style.display = 'block';
    fab.setAttribute('aria-expanded', 'false');
  };

  function addMsg(text, cls){
  const div = document.createElement('div');
  div.className = 'bubble ' + cls;
  div.innerHTML = text;   // ✅ render đúng HTML (ảnh, chữ in đậm, div...)
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
      speak(reply); // Đọc lại câu trả lời
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
    const vi = speechSynthesis.getVoices().find(v => v.lang && v.lang.startsWith('vi'));
    if(vi) utter.voice = vi;
    utter.lang = (vi && vi.lang) || 'vi-VN';
    speechSynthesis.cancel();  // dừng giọng cũ nếu còn
    speechSynthesis.speak(utter);
  }
})();
</script>
