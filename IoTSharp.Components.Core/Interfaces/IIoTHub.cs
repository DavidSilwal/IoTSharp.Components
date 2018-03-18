﻿using System.Threading.Tasks;

namespace IoTSharp.Components
{
	public interface IIoTHub : IIoTComponentCollection
	{
		bool Loop { get; }
		int DelayTime { get; }
		void Start(int delayTime, bool loop);
		Task StartAsync(int delayTime, bool loop);
		void Stop();
	}
}
