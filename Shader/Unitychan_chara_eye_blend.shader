Shader "UnityChan/Eye - Transparent"
{
	Properties
	{
		_Color ("Main Color", Color) = (1, 1, 1, 1)
		_ShadowColor ("Shadow Color", Color) = (0.8, 0.8, 1, 1)

		_MainTex ("Diffuse", 2D) = "white" {}
		_FalloffSampler ("Falloff Control", 2D) = "white" {}
		_RimLightSampler ("RimLight Control", 2D) = "white" {}
	}

	SubShader
	{
		Blend SrcAlpha OneMinusSrcAlpha, One One
		Tags
		{
			"RenderType"="Overlay"
			"Queue"="Geometry+1" // Transparent+1"
			"IgnoreProjector"="True"
//			"LightMode"="ForwardBase"
			"LightMode" = "UniversalForward"
		}

		Pass
		{
			Cull Back
			ZTest LEqual
CGPROGRAM
#pragma multi_compile __ TRI_COLOR_AMBIENT
#pragma multi_compile_fwdbase
#pragma target 3.0
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "CharaMain.cginc"
ENDCG
		}
	}

	FallBack "Transparent/Cutout/Diffuse"
}
