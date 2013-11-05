'use strict';

letsdineApp.controller('HomeController',
    function HomeController($scope,$location) {
        $scope.popularEvents = [
            {
                'id': 1,
                'name': 'Some awesome event',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone'
            },
            {
                'id': 2,
                'name': 'Some awesome event 2',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone'
            },
            {
                'id': 3,
                'name': 'Some awesome event 3',
                'host': 'A host name',
                'hostProfileURL': 'http://localhost:3000/hosts/someone'
            }
        ];

        // Slider code start
        $scope.slides = [
            {image: '/assets/sliderFillerImages/download.jpg', description: 'Image 00'},
            {image: 'assets/sliderFillerImages/download (2).jpg', description: 'Image 01'},
            {image: 'assets/sliderFillerImages/download (3).jpg', description: 'Image 02'},
            {image: 'assets/sliderFillerImages/download (2).jpg', description: 'Image 03'},
            {image: 'assets/sliderFillerImages/download.jpg', description: 'Image 04'}
        ];

        $scope.direction = 'left';
        $scope.currentIndex = 0;

        $scope.setCurrentSlideIndex = function (index) {
            $scope.direction = (index > $scope.currentIndex) ? 'left' : 'right';
            $scope.currentIndex = index;
        };

        $scope.isCurrentSlideIndex = function (index) {
            return $scope.currentIndex === index;
        };

        $scope.prevSlide = function () {
            $scope.direction = 'left';
            $scope.currentIndex = ($scope.currentIndex < $scope.slides.length - 1) ? ++$scope.currentIndex : 0;
        };

        $scope.nextSlide = function () {
            $scope.direction = 'right';
            $scope.currentIndex = ($scope.currentIndex > 0) ? --$scope.currentIndex : $scope.slides.length - 1;
        };
    })
    .animation('.slide-animation', function () {
        return {
            addClass: function (element, className, done) {
                var scope = element.scope();

                if (className == 'ng-hide') {
                    var finishPoint = element.parent().width();
                    if(scope.direction !== 'right') {
                        finishPoint = -finishPoint;
                    }
                    TweenMax.to(element, 0.5, {left: finishPoint, onComplete: done });
                }
                else {
                    done();
                }
            },
            removeClass: function (element, className, done) {
                var scope = element.scope();

                if (className == 'ng-hide') {
                    element.removeClass('ng-hide');

                    var startPoint = element.parent().width();
                    if(scope.direction === 'right') {
                        startPoint = -startPoint;
                    }

                    TweenMax.set(element, { left: startPoint });
                    TweenMax.to(element, 0.5, {left: 0, onComplete: done });
                }
                else {
                    done();
                }
            }
        };

        // Slider code start
    });