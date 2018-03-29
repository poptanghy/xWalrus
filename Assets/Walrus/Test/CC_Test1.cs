using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class CC_Test1 : MonoBehaviour {

	// Use this for initialization
	void Start () {
        LuaEnv kLuaEnv = new LuaEnv();
        kLuaEnv.DoString("print('Hello World')");
        kLuaEnv.Dispose();
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
