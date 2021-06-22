using UnityEngine;
using UnityEngine.TestTools;
using NUnit.Framework;
using System.Collections;

public class PlayModeTests {

    [Test]
    public void PlayModeTestsSimplePasses() {
        // Use the Assert class to test conditions.
        Assert.True(true);
        Debug.Log("Simple log message")
    }

    // A UnityTest behaves like a coroutine in PlayMode
    // and allows you to yield null to skip a frame in EditMode
    [UnityTest]
    public IEnumerator PlayModeTestsWithEnumeratorPasses() {
        // Use the Assert class to test conditions.
        // yield to skip a frame
        Assert.True(true);
        yield return null;
        Assert.True(true);
    }
}
