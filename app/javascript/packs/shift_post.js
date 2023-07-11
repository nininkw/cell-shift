document.addEventListener("turbolinks:load", function() {
  let cells = document.querySelectorAll(".calendar-table td");
  for (let i = 0; i < cells.length; i++) {
    let selectedDates = [];
    cells[i].onclick = function(e) {
      let cell = e.target;
      let date = cell.innerText;
      if (cell.classList.contains("selected")) {
        cell.classList.remove("selected");
        let index = selectedDates.indexOf(date);
        if (index !== -1) {
          selectedDates.splice(index, 1);
        }
      } else {
        cell.classList.add("selected");
        selectedDates.push(date);
      }
    };
  }

  function getSelectedDates() {
    let selectedCells = document.querySelectorAll(".calendar-table td.selected");
    let selectedDates = [];
    selectedCells.forEach((cell) => {
      const year = cell.dataset.dateYear;
      const month = cell.dataset.dateMonth.padStart(2, "0");
      const date = cell.innerText.padStart(2, "0");
      const dateString = `${year}-${month}-${date}`;
      if (dateString.match(/^\d{4}-\d{2}-\d{2}$/)) {
        selectedDates.push(dateString); 
      }
    }); 
    return selectedDates;
  }

  let postBtn = document.querySelector("#post-btn");
  postBtn.addEventListener("click", function(e) {
    let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
    let selectedDates = getSelectedDates();
    fetch("/shift_posts", {
      method: "POST",
      credentials: 'same-origin',
      headers: {"Content-Type": "application/json", "X-CSRF-Token": csrfToken},
      body: JSON.stringify({
        shift_post: { selected_dates: selectedDates }
      })
    })
  });
});
