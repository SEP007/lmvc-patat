/**
 * Update counter widget with number of characters remaining
 * @param string counter id of counter element
 * @param string text_elem id of textarea or input element
 * @param int    max_len maximum allowed character length
 * @return void
 */
function update_counter(counter, text_elem, max_len)
{
    var counterElem = document.getElementById(counter);
    var textElem = document.getElementById(text_elem);
    var len = textElem.value.length;
    var val = max_len - textElem.value.length;
    counterElem.innerHTML = val; 
}

