module JudgeHelper
  def flew_out?(position, teams_count)
    position >= (teams_count / 2)
  end
end
