/**
 * Update counter widget with number of characters remaining and en-/disable submit button accordingly
 * @param counterId id of counter element
 * @param textAreaId id of text area element
 * @param submitButtonId id of submit button element
 * @param minLength minimal character length
 * @param maxLength maximal character length
 */
function update_counter(counterId, textAreaId, submitButtonId, minLength, maxLength)
{
    var counterElem = document.getElementById(counterId);
    var textElem = document.getElementById(textAreaId);
	var submitElem = document.getElementById(submitButtonId);
	var len = textElem.value.length;
    var val = maxLength - textElem.value.length;
    
	// update counter
	counterElem.innerHTML = val; 
	
	// en-/disable submit button
	if (len < minLength || len > maxLength) {
		submitElem.disabled = true;
	} else {
		submitElem.disabled = false;
	}
}

