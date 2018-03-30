using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using XLua;
namespace CCS
{

    public class Main : MonoBehaviour
    {

        public static LuaEnv skLuaEnv = new LuaEnv();
        // Use this for initialization
        void Start()
        {
#if UNITY_EDITOR
            skLuaEnv.AddLoader((ref string filepath) =>
            {
                filepath = Application.dataPath + "/Walrus/Lua/" + filepath.Replace('.', '/') + ".lua";
                if (File.Exists(filepath))
                {
                    return File.ReadAllBytes(filepath);
                }
                else
                {
                    return null;
                }
            });
#else //为了让手机也能测试
            skLuaEnv.AddLoader((ref string filepath) =>
            {
                filepath = filepath.Replace('.', '/') + ".lua";
                TextAsset file = (TextAsset)Resources.Load(filepath);
                if (file != null)
                {
                    return file.bytes;
                }
                else
                {
                    return null;
                }
            });
#endif
            skLuaEnv.DoString("require 'main'");
        }

        // Update is called once per frame
        void Update()
        {
            if (skLuaEnv != null)
            {
                skLuaEnv.Tick();
            }
        }

        void OnDestroy()
        {
            skLuaEnv.Dispose();
        }
    }


};