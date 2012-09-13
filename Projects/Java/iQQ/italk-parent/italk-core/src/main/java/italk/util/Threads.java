package italk.util;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 
 * Thread Util
 * 
 * @author steven0lisa
 * @create-time Jul 27, 2012 11:32:40 PM
 */
public abstract class Threads {

	static final String THREAD_PREFIX = Threads.class.getCanonicalName() + '-';

	static ExecutorService threadPool;

	/**
	 * init the thread pool of Threads.
	 * 
	 * @param threadPoolSize
	 *            keep it low, pls
	 */
	public static void init(int threadPoolSize) {
		threadPool = Executors.newFixedThreadPool(threadPoolSize,
				new NamedThreadFactory(THREAD_PREFIX));
	}

	private static ExecutorService getExecutorService() {
		if (threadPool == null) {
			// keep the thread pool size as low as possible
			threadPool = Executors.newFixedThreadPool(Runtime.getRuntime()
					.availableProcessors() + 1, new NamedThreadFactory(
					THREAD_PREFIX));
		}
		return threadPool;
	}

	/**
	 * Submit a task
	 * 
	 * @param task
	 * @return Future of the task
	 */
	public static Future<?> submit(Runnable task) {
		Future<?> f = getExecutorService().submit(task);
		return f;
	}

	/**
	 * shutdown thread pool
	 */
	public static synchronized void shutdown() {
		if (threadPool != null) {
			threadPool.shutdown();
		}

	}
        
        /**
	 * shutdown thread pool
	 */
	public static synchronized void shutdownNow() {
		if (threadPool != null) {
			threadPool.shutdownNow();
		}

	}

	public static void sleep(long time) {
		try {
			Thread.sleep(time);
		} catch (Exception e) {
			// do nothing
		}
	}

	/**
	 * 
	 * A factory that can new a named thread.
	 * 
	 * @author steven0lisa
	 * @create-time Jul 27, 2012 11:27:42 PM
	 */
	static class NamedThreadFactory implements ThreadFactory {

		final ThreadGroup group;
		final AtomicInteger threadNumber = new AtomicInteger(1);
		final String namePrefix;

		NamedThreadFactory(String namePrefix) {
			SecurityManager s = System.getSecurityManager();
			group = (s != null) ? s.getThreadGroup() : Thread.currentThread()
					.getThreadGroup();
			this.namePrefix = namePrefix;
		}

		public Thread newThread(Runnable r) {
			Thread t = new Thread(group, r, namePrefix
					+ threadNumber.getAndIncrement(), 0);
			if (t.isDaemon())
				t.setDaemon(false);
			if (t.getPriority() != Thread.NORM_PRIORITY)
				t.setPriority(Thread.NORM_PRIORITY);
			return t;
		}

	}

}
