TacApp = angular.module "TacApp", []


TacApp.controller("TicTacToeCtrl", ["$scope", 
  ($scope)->
    status_indicators = $("#teams li")
    
    $scope.players = [
      {
       name:'Ernie' 
       marker:'X'
       img_url:'img/ernie.jpg'
       indicator: $(status_indicators[0])
      }
      ,
      {
       name:'Bert' 
       marker: 'O'
       img_url: 'img/bert.jpg'
       indicator: $(status_indicators[1])
      }
      ] 
    $scope.current_player = $scope.players[0]
    $scope.turns = 0
    $scope.win_combos = [
        [0,1,2], [3,4,5], [2,4,6], [6,7,8], [0,4,8], [1,4,7], [0,3,6], [2,5,8]
      ]
    $scope.tiles =[]

    i = 0

    while i < 9
      newTile = 
        {
        tileNumber: i
        tileStatus: false
        tileValue: ""
        }
      $scope.tiles.push newTile
      i++

    $scope.handle_click = (tile)->
      if $scope.tiles[tile].tileStatus isnt true
        $scope.tiles[tile].tileValue = $scope.current_player.marker
        $scope.tiles[tile].tileStatus = true
        # this can be better, use turn and indicator
        if $scope.current_player == $scope.players[0]
          $scope.current_player = $scope.players[1]
        else if $scope.current_player == $scope.players[1]
          $scope.current_player = $scope.players[0]
    return

    $scope.checkWin = ()->
    $scope.winning = true


])
