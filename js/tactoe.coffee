TacApp = angular.module("TacApp", [
  # "TacRouter", 
  "TacAppCtrl"
])

TacAppCtrl = angular.module("TacAppCtrl", [])

TacAppCtrl.controller("TicTacToeCtrl", ["$scope", "$interval",
  ($scope, $interval)->
    $scope.isWinner = ""
    $scope.players = [
       name:'Ernie' 
       marker:'X'
       img_url:'img/ernie.jpg'
       list: []
      ,
       name:'Bert' 
       marker: 'O'
       img_url: 'img/bert.jpg'
       list: []
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
        tileWin: false
        tileValue: ""
        }
      $scope.tiles.push newTile
      $scope.start = true
      i++

    $scope.handle_click = (tile)->
      if $scope.tiles[tile].tileStatus isnt true
        $scope.tiles[tile].tileValue = $scope.current_player.marker
        $scope.tiles[tile].tileStatus = true
        $scope.current_player.list.push($scope.tiles[tile].tileNumber)
        $scope.turns += 1
        if $scope.turns isnt 9
          if $scope.checkWin($scope.current_player) isnt true
            if $scope.turns % 2 == 0
              $scope.current_player = $scope.players[0]
            else
              $scope.current_player = $scope.players[1]
            return
        else 
          $scope.current_player = []
          $scope.isTie = true
          $interval (->
            $scope.isTieResult = true
            return
            ), 1500
          return

    $scope.checkWin = (current_player)->
      for k of $scope.win_combos
        matchWin = current_player.list.intersect($scope.win_combos[k])
        if matchWin.length is 3
          matchWin.forEach (index) ->
            $scope.tiles[index].tileWin = true
            $scope.current_player.marker = ""
            $scope.turns = ""
            return
          $interval (->
              $scope.isResults = true
              return
              ), 1500
          return true

    return

])
