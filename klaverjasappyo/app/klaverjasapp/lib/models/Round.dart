import 'Teams.dart';
import 'RoemValue.dart';

class RoundScore {
  int _team1score = 0;
  int _team2score = 0;

  int _biddedScore = 0;
  Teams _playingTeam = Teams.noTeam;

  int get team1score => _team1score;
  int get team2score => _team2score;
  int get biddedScore => _biddedScore;
  Teams get playingTeam => _playingTeam;

  //returns the total score once roem added
  int addRoem(Teams team, RoemValue roem) {
    if (team == Teams.team1) {
      _team1score += roem.value;
      return team1score;
    } else {
      _team2score += roem.value;
      return team2score;
    }
  }

  //returns the total score once roem substracted
  int removeRoem(Teams team, RoemValue roem) {
    if (team == Teams.team1) {
      _team1score = (_team1score - roem.value).clamp(0, 9999);
      return team1score;
    } else {
      _team2score = (_team2score - roem.value).clamp(0, 9999);
      return team2score;
    }
  }

  //returns the total score once score added
  int addScore(Teams winningTeam, int score) {
    if (winningTeam == Teams.team1) {
      _team1score += score;
      return team1score;
    } else {
      _team2score += score;
      return team2score;
    }
  }

  //returns the bidded score
  int bidScore(int score, Teams playingTeam) {
    _biddedScore = score;
    _playingTeam = playingTeam;
    return biddedScore;
  }

  Result calculateAndSetFinalScores() {
    if (playingTeam == Teams.team1) {
      if (team1score <= biddedScore) {
        //NAT!
        _team2score += _team1score;
        _team1score = 0;
      }
    }
    if (playingTeam == Teams.team2) {
      if (team2score <= biddedScore) {
        //NAT!
        _team1score += _team2score;
        _team2score = 0;
      }
    }

    return Result(team1score, team2score);
  }
}

class Result {
  int team1score;
  int team2score;

  Result(this.team1score, this.team2score);
}
