// Please don't judge my Javascript skills by this file.

var currentSlideNo = 1
var previousSlideNo = 0

function next() {
  if (currentSlideNo < 5) {
    previousSlideNo = currentSlideNo
    currentSlideNo = currentSlideNo + 1
  }
}

function previous() {
  if (currentSlideNo > 1) {
    previousSlideNo = currentSlideNo
    currentSlideNo = currentSlideNo - 1
  }
}

function goTo(slideNo) {
  previousSlideNo = currentSlideNo
  currentSlideNo = slideNo
}

function slideTextDiv(slideNumber) {
  return $(".slide-text-container.slide-" + slideNumber)
}

function nextSlideText(slideNumber) {
  return slideTextDiv(currentSlideNo)
}

function previousSlide() {
  return slideTextDiv(previousSlideNo)
}

function previousTitle() {
  return $(".slide-title.slide-" + previousSlideNo)
}

function nextTitle() {
  return $(".slide-title.slide-" + currentSlideNo)
}

function nextImage() {
  return $(".slide-image-container.slide-" + currentSlideNo)
}

function allImages() {
  return $("div.slide-image-container")
}

function repeatingImage() {
  return $(".slide-image-container.slide-" + currentSlideNo + "-replay")
}

function playGif() {
  const selector = "div.slide-image-container.current img.slide-image"
  const image = $(selector)
  const src = image.attr("src")
  image.attr('src', '')
  image.attr('src', src)
}

function showInitialGifForSlide() {
  allImages().hide()
  allImages().removeClass("current")

  nextImage().show()
  nextImage().addClass("current")
}

function showReplayGifForSlide() {
  allImages().hide()
  allImages().removeClass("current")

  repeatingImage().show()
  repeatingImage().addClass("current")
}

function replayGif() {
  showReplayGifForSlide()
  playGif()
}

function setHash() {
  window.location.hash = "slide-" + currentSlideNo;
}

function transition(useReplayImage) {
  setHash()

  if (previousSlideNo != currentSlideNo) {
    previousTitle().fadeOut('fast', function () {
      nextTitle().fadeIn('fast')
    })

    previousSlide().fadeOut('fast', function () {
      nextSlideText().fadeIn('fast')
      showInitialGifForSlide()
      if (useReplayImage) {
        replayGif()
      } else {
        playGif()
      }
    })
  }
}

function getSlideNumberFromHash() {
  const match = window.location.hash.substr(1).match(/slide\-(\d)/)
  if (match) {
    return parseInt(match[1], 10)
  } else {
    return null
  }
}

function getInitialSlideNumber() {
  return getSlideNumberFromHash() || 1
}
