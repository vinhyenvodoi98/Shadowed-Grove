import { useComponentValue } from "@latticexyz/react";
import { SyncState } from "@latticexyz/network";
import { useMUD } from "./MUDContext";
import { GameBoard } from "./GameBoard";

export const App = () => {
  const {
    components: { LoadingState },
    network: { singletonEntity },
  } = useMUD();

  const loadingState = useComponentValue(LoadingState, singletonEntity, {
    state: SyncState.CONNECTING,
    msg: "Connecting",
    percentage: 0,
  });

  return (
    <div className="w-screen h-screen flex items-center justify-center bg-cover bg-center" style={{ backgroundImage: `url(https://cdn.cloud.scenario.com/assets/LitkRnIFSqyVhVm-Qpr3SA?p=100&Expires=1686182400&Key-Pair-Id=K36FIAB9LE2OLR&Signature=JCaSFV4oAk9mRcKdgWxomZGHCdZA~5Wg27rd07pMx0bguxvYrXeuCQi2c8kTGbQVWJQomsh98B640ObjE3od2CwpVTmonvcZVPfWTAo-HDEKLCYbbRsXCY2jBZby0qfufe4cbDXI6-pjVBUWWtfAQ1zUNBmMgokguS-cJrBEpNbuazmY4tjKb3PMQHmk90QpTa~Gtf~4KADQlyYTwu0VCuL16ARdhhn3Rl7dYz~a1BaSaYEH4xNTEoIhZHqU293Qa~HnxsYy0X8-gdibvzngiRa~2wIZ2Dwve~aGDFniU5vaPEgmiseJGn2E9N9qZOT-89vZQSqGLScwMUKJLZ59Fg__)`}} >
      {loadingState.state !== SyncState.LIVE ? (
        <div>
          {loadingState.msg} ({Math.floor(loadingState.percentage)}%)
        </div>
      ) : (
        <GameBoard />
      )}
    </div>
  );
};
