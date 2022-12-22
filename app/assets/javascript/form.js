function regclick(elem)
{
  document.querySelector('.form_wrapper').style='display: block'
  var top=0;
  elem.style='display: block'
 
  var timerId=setInterval(move, 1);
  function move()
{
  if (top > (document.documentElement.clientHeight-elem.clientHeight)/2){
    elem.style.top=top-2+"px";
  clearInterval(timerId);}
  else{
    top+=3;
    st=top+"px";
    elem.style.top=st;
  }
}
}
function showform(elem)
{
  document.getElementsByClassName('log_alert').style='display: grid'
  document.querySelector('.form_wrapper').style='display: block'
  elem.style='display: block'
  elem.style.top=(document.documentElement.clientHeight - elem.clientHeight)/2+"px"
  
}
function exit_click()
{
  bootbox.alert('This is the default alert!');
}