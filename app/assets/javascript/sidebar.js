
function move(event){
  let btn=document.getElementById('sidebar_btn')
let sidebar=document.getElementById('sidebar_cont')
let title=document.getElementById('main_title')
let footer=document.getElementById('main-footer')
  moveAt(event.pageX);
  function moveAt(pageX) {
    if (((document.documentElement.clientWidth-pageX)*100)/document.documentElement.clientWidth<=20) {
    sidebar.style.width=document.documentElement.clientWidth-pageX+'px';
    title.style.width=window.innerWidth-(document.documentElement.clientWidth-pageX)+'px';
     footer.style.width=window.innerWidth-(document.documentElement.clientWidth-pageX)+'px';
  }
  }
  function onMouseMove(event) {
    moveAt(event.pageX);
  }

  // (3) перемещать по экрану
  document.addEventListener('mousemove', onMouseMove);
  document.onmouseup = function() {
    document.removeEventListener('mousemove', onMouseMove);
    sidebar.onmouseup = null;
  };
  btn.ondragstart = function() {
    return false;
  };
};
