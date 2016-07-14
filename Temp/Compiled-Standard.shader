// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 974.1KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0,1)) = 0.5
 _Glossiness ("Smoothness", Range(0,1)) = 0.5
[Gamma]  _Metallic ("Metallic", Range(0,1)) = 0
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
 _BumpScale ("Scale", Float) = 1
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005,0.08)) = 0.02
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0,1)) = 1
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0,0,0,1)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0
[HideInInspector]  _Mode ("__mode", Float) = 0
[HideInInspector]  _SrcBlend ("__src", Float) = 1
[HideInInspector]  _DstBlend ("__dst", Float) = 0
[HideInInspector]  _ZWrite ("__zw", Float) = 1
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //       metal : 46 avg math (30..63), 2 branch
 //      opengl : 179 avg math (179..180), 4 avg texture (4..5), 13 branch
 // Stats for Fragment shader:
 //       metal : 179 avg math (179..180), 4 avg texture (4..5), 13 branch
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 39223
Program "vp" {
SubProgram "opengl " {
// Stats: 179 math, 4 textures, 13 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec3 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_7 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_11;
  n_11 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec4 ambientOrLightmapUV_16;
  ambientOrLightmapUV_16 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_17;
  ambient_17 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_17 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_18;
  vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x1_18.x = dot (unity_SHBr, tmpvar_19);
  x1_18.y = dot (unity_SHBg, tmpvar_19);
  x1_18.z = dot (unity_SHBb, tmpvar_19);
  ambient_17 = (ambient_17 + (x1_18 + (unity_SHC.xyz * 
    ((tmpvar_15.x * tmpvar_15.x) - (tmpvar_15.y * tmpvar_15.y))
  )));
  ambientOrLightmapUV_16.xyz = ambient_17;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = n_11;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_16;
  xlv_TEXCOORD8 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD1);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_7 - (2.0 * (
    dot (tmpvar_6, tmpvar_7)
   * tmpvar_6)));
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_13;
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_6;
  vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  vec3 tmpvar_16;
  tmpvar_16 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15));
  ambient_13 = tmpvar_16;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_13 = max (((1.055 * 
      pow (max (tmpvar_16, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_12 = (ambient_13 * tmpvar_8);
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec3 specular_17;
  vec3 worldRefl_18;
  worldRefl_18 = tmpvar_10;
  vec3 worldPos_19;
  worldPos_19 = xlv_TEXCOORD8;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_20;
    tmpvar_20 = normalize(tmpvar_10);
    vec3 tmpvar_21;
    tmpvar_21 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_20);
    vec3 tmpvar_22;
    tmpvar_22 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_20);
    bvec3 tmpvar_23;
    tmpvar_23 = greaterThan (tmpvar_20, vec3(0.0, 0.0, 0.0));
    float tmpvar_24;
    if (tmpvar_23.x) {
      tmpvar_24 = tmpvar_21.x;
    } else {
      tmpvar_24 = tmpvar_22.x;
    };
    float tmpvar_25;
    if (tmpvar_23.y) {
      tmpvar_25 = tmpvar_21.y;
    } else {
      tmpvar_25 = tmpvar_22.y;
    };
    float tmpvar_26;
    if (tmpvar_23.z) {
      tmpvar_26 = tmpvar_21.z;
    } else {
      tmpvar_26 = tmpvar_22.z;
    };
    worldPos_19 = (xlv_TEXCOORD8 - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_18 = (worldPos_19 + (tmpvar_20 * min (
      min (tmpvar_24, tmpvar_25)
    , tmpvar_26)));
  };
  vec4 tmpvar_27;
  tmpvar_27.xyz = worldRefl_18;
  tmpvar_27.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_28;
  tmpvar_28 = textureCubeLod (unity_SpecCube0, worldRefl_18, tmpvar_27.w);
  vec3 tmpvar_29;
  tmpvar_29 = ((unity_SpecCube0_HDR.x * pow (tmpvar_28.w, unity_SpecCube0_HDR.y)) * tmpvar_28.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_30;
    worldRefl_30 = tmpvar_10;
    vec3 worldPos_31;
    worldPos_31 = xlv_TEXCOORD8;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_32;
      tmpvar_32 = normalize(tmpvar_10);
      vec3 tmpvar_33;
      tmpvar_33 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_32);
      vec3 tmpvar_34;
      tmpvar_34 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_32);
      bvec3 tmpvar_35;
      tmpvar_35 = greaterThan (tmpvar_32, vec3(0.0, 0.0, 0.0));
      float tmpvar_36;
      if (tmpvar_35.x) {
        tmpvar_36 = tmpvar_33.x;
      } else {
        tmpvar_36 = tmpvar_34.x;
      };
      float tmpvar_37;
      if (tmpvar_35.y) {
        tmpvar_37 = tmpvar_33.y;
      } else {
        tmpvar_37 = tmpvar_34.y;
      };
      float tmpvar_38;
      if (tmpvar_35.z) {
        tmpvar_38 = tmpvar_33.z;
      } else {
        tmpvar_38 = tmpvar_34.z;
      };
      worldPos_31 = (xlv_TEXCOORD8 - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_30 = (worldPos_31 + (tmpvar_32 * min (
        min (tmpvar_36, tmpvar_37)
      , tmpvar_38)));
    };
    vec4 tmpvar_39;
    tmpvar_39.xyz = worldRefl_30;
    tmpvar_39.w = ((tmpvar_9 * (1.7 - 
      (0.7 * tmpvar_9)
    )) * 6.0);
    vec4 tmpvar_40;
    tmpvar_40 = textureCubeLod (unity_SpecCube1, worldRefl_30, tmpvar_39.w);
    specular_17 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_40.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_40.xyz), tmpvar_29, unity_SpecCube0_BoxMin.www);
  } else {
    specular_17 = tmpvar_29;
  };
  tmpvar_11 = (specular_17 * tmpvar_8);
  vec3 viewDir_41;
  viewDir_41 = -(tmpvar_7);
  float surfaceReduction_42;
  float specularTerm_43;
  float tmpvar_44;
  tmpvar_44 = (1.0 - _Glossiness);
  vec3 tmpvar_45;
  vec3 inVec_46;
  inVec_46 = (_WorldSpaceLightPos0.xyz + viewDir_41);
  tmpvar_45 = (inVec_46 * inversesqrt(max (0.001, 
    dot (inVec_46, inVec_46)
  )));
  float tmpvar_47;
  tmpvar_47 = dot (tmpvar_6, viewDir_41);
  vec3 tmpvar_48;
  if ((tmpvar_47 < 0.0)) {
    tmpvar_48 = (tmpvar_6 + (viewDir_41 * (
      -(tmpvar_47)
     + 1e-05)));
  } else {
    tmpvar_48 = tmpvar_6;
  };
  float tmpvar_49;
  tmpvar_49 = max (0.0, dot (tmpvar_48, _WorldSpaceLightPos0.xyz));
  float tmpvar_50;
  tmpvar_50 = max (0.0, dot (tmpvar_48, tmpvar_45));
  float tmpvar_51;
  tmpvar_51 = max (0.0, dot (tmpvar_48, viewDir_41));
  float tmpvar_52;
  tmpvar_52 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_45));
  float tmpvar_53;
  tmpvar_53 = (tmpvar_44 * tmpvar_44);
  float tmpvar_54;
  tmpvar_54 = (tmpvar_44 * tmpvar_44);
  float tmpvar_55;
  tmpvar_55 = (tmpvar_54 * tmpvar_54);
  float tmpvar_56;
  tmpvar_56 = (((tmpvar_50 * tmpvar_50) * (tmpvar_55 - 1.0)) + 1.0);
  float x_57;
  x_57 = (1.0 - tmpvar_49);
  float x_58;
  x_58 = (1.0 - tmpvar_51);
  float tmpvar_59;
  tmpvar_59 = (0.5 + ((2.0 * tmpvar_52) * (tmpvar_52 * tmpvar_44)));
  float tmpvar_60;
  tmpvar_60 = ((1.0 + (
    (tmpvar_59 - 1.0)
   * 
    ((x_57 * x_57) * ((x_57 * x_57) * x_57))
  )) * (1.0 + (
    (tmpvar_59 - 1.0)
   * 
    ((x_58 * x_58) * ((x_58 * x_58) * x_58))
  )));
  float tmpvar_61;
  tmpvar_61 = (((2.0 / 
    (((tmpvar_49 * (
      (tmpvar_51 * (1.0 - tmpvar_53))
     + tmpvar_53)) + (tmpvar_51 * (
      (tmpvar_49 * (1.0 - tmpvar_53))
     + tmpvar_53))) + 1e-05)
  ) * (tmpvar_55 / 
    (((3.141593 * tmpvar_56) * tmpvar_56) + 1e-07)
  )) * 0.7853982);
  specularTerm_43 = tmpvar_61;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_43 = sqrt(max (0.0001, tmpvar_61));
  };
  float tmpvar_62;
  tmpvar_62 = max (0.0, (specularTerm_43 * tmpvar_49));
  specularTerm_43 = tmpvar_62;
  float tmpvar_63;
  tmpvar_63 = (tmpvar_60 * tmpvar_49);
  float tmpvar_64;
  tmpvar_64 = (tmpvar_44 * tmpvar_44);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    surfaceReduction_42 = (1.0 - ((0.28 * tmpvar_64) * tmpvar_44));
  } else {
    surfaceReduction_42 = (1.0/(((tmpvar_64 * tmpvar_64) + 1.0)));
  };
  float x_65;
  x_65 = (1.0 - tmpvar_52);
  float x_66;
  x_66 = (1.0 - tmpvar_51);
  vec3 tmpvar_67;
  tmpvar_67 = (((tmpvar_3 * 
    (tmpvar_12 + (_LightColor0.xyz * tmpvar_63))
  ) + (
    (tmpvar_62 * _LightColor0.xyz)
   * 
    (tmpvar_4 + ((1.0 - tmpvar_4) * ((x_65 * x_65) * (
      (x_65 * x_65)
     * x_65))))
  )) + ((surfaceReduction_42 * tmpvar_11) * mix (tmpvar_4, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)
  ), vec3(
    ((x_66 * x_66) * ((x_66 * x_66) * x_66))
  ))));
  vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = tmpvar_67;
  c_1.w = tmpvar_68.w;
  c_1.xyz = tmpvar_67;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_69;
  xlat_varoutput_69.xyz = c_1.xyz;
  xlat_varoutput_69.w = 1.0;
  gl_FragData[0] = xlat_varoutput_69;
}


#endif
"
}
SubProgram "metal " {
// Stats: 30 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 290
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
VectorHalf 240 [unity_ColorSpaceLuminance] 4
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  float3 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_10;
  texcoord_10.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_11;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_12;
  float3 n_13;
  n_13 = (tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_12 = half3(n_13);
  float3 norm_14;
  norm_14 = float3(tmpvar_1);
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].x;
  v_15.y = _mtl_u._World2Object[1].x;
  v_15.z = _mtl_u._World2Object[2].x;
  v_15.w = _mtl_u._World2Object[3].x;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].y;
  v_16.y = _mtl_u._World2Object[1].y;
  v_16.z = _mtl_u._World2Object[2].y;
  v_16.w = _mtl_u._World2Object[3].y;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].z;
  v_17.y = _mtl_u._World2Object[1].z;
  v_17.z = _mtl_u._World2Object[2].z;
  v_17.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_18);
  half3 normalWorld_19;
  normalWorld_19 = half3(tmpvar_18);
  half4 ambientOrLightmapUV_20;
  ambientOrLightmapUV_20 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 ambient_21;
  ambient_21 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_22;
  tmpvar_22 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_22) {
    ambient_21 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_23;
  half4 tmpvar_24;
  tmpvar_24 = (normalWorld_19.xyzz * normalWorld_19.yzzx);
  x1_23.x = dot (_mtl_u.unity_SHBr, tmpvar_24);
  x1_23.y = dot (_mtl_u.unity_SHBg, tmpvar_24);
  x1_23.z = dot (_mtl_u.unity_SHBb, tmpvar_24);
  ambient_21 = (ambient_21 + (x1_23 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_19.x * normalWorld_19.x) - (normalWorld_19.y * normalWorld_19.y))
  )));
  ambientOrLightmapUV_20.xyz = ambient_21;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_10;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_12;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_20;
  _mtl_o.xlv_TEXCOORD8 = tmpvar_8;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD8.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
vec3 u_xlat9;
bvec3 u_xlatb9;
vec3 u_xlat10;
bvec3 u_xlatb11;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump float u_xlat16_16;
float u_xlat26;
float u_xlat27;
float u_xlat36;
float u_xlat37;
bool u_xlatb38;
float u_xlat39;
float u_xlat41;
bool u_xlatb41;
float u_xlat42;
mediump float u_xlat16_42;
float u_xlat43;
bool u_xlatb43;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat36 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
    u_xlat37 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat2.xyz = vec3(u_xlat37) * vs_TEXCOORD4.xyz;
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat39 = (-_OcclusionStrength) + 1.0;
    u_xlat39 = u_xlat10_4.y * _OcclusionStrength + u_xlat39;
    u_xlat4 = (-_Glossiness) + 1.0;
    u_xlat16.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat16.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + u_xlat3.xyz;
    u_xlat2.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat2);
    u_xlat5.y = dot(unity_SHAg, u_xlat2);
    u_xlat5.z = dot(unity_SHAb, u_xlat2);
    u_xlat5.xyz = u_xlat5.xyz + vs_TEXCOORD5.xyz;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb38 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat6.xyz = log2(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = (bool(u_xlatb38)) ? u_xlat6.xyz : u_xlat5.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat16.xyz, u_xlat16.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat6.xyz = u_xlat16.xyz * vec3(u_xlat41);
        u_xlat7.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        u_xlat7.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
        u_xlat7.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
        u_xlat7.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
        u_xlat41 = min(u_xlat7.y, u_xlat7.x);
        u_xlat41 = min(u_xlat7.z, u_xlat41);
        u_xlat7.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat41) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat4) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat4 * u_xlat41;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat41);
    u_xlat16_42 = log2(u_xlat10_6.w);
    u_xlat42 = u_xlat16_42 * unity_SpecCube0_HDR.y;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat10_6.xyz * vec3(u_xlat42);
    u_xlatb43 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat16.xyz, u_xlat16.xyz);
            u_xlat43 = inversesqrt(u_xlat43);
            u_xlat8.xyz = u_xlat16.xyz * vec3(u_xlat43);
            u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            u_xlat9.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
            u_xlat9.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
            u_xlat9.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
            u_xlat43 = min(u_xlat9.y, u_xlat9.x);
            u_xlat43 = min(u_xlat9.z, u_xlat43);
            u_xlat9.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat43) + u_xlat9.xyz;
        //ENDIF
        }
        u_xlat10_8 = textureLod(unity_SpecCube1, u_xlat16.xyz, u_xlat41);
        u_xlat16_16 = log2(u_xlat10_8.w);
        u_xlat16.x = u_xlat16_16 * unity_SpecCube1_HDR.y;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat16.x = u_xlat16.x * unity_SpecCube1_HDR.x;
        u_xlat16.xyz = u_xlat10_8.xyz * u_xlat16.xxx;
        u_xlat6.xyz = vec3(u_xlat42) * u_xlat10_6.xyz + (-u_xlat16.xyz);
        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat16.xyz;
    //ENDIF
    }
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat7.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat37) + _WorldSpaceLightPos0.xyz;
    u_xlat37 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat37 = max(u_xlat37, 0.00100000005);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat6.xyz = vec3(u_xlat37) * u_xlat6.xyz;
    u_xlat37 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlatb41 = u_xlat37<0.0;
    u_xlat37 = (-u_xlat37) + 9.99999975e-06;
    u_xlat7.xyz = (-u_xlat3.xyz) * vec3(u_xlat37) + u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb41)) ? u_xlat7.xyz : u_xlat2.xyz;
    u_xlat37 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat41 = max(u_xlat41, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat26 = u_xlat4 * u_xlat4;
    u_xlat3.x = (-u_xlat4) * u_xlat4 + 1.0;
    u_xlat15.x = u_xlat2.x * u_xlat3.x + u_xlat26;
    u_xlat3.x = u_xlat37 * u_xlat3.x + u_xlat26;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat37 * u_xlat15.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat15.x = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat41 * u_xlat41;
    u_xlat6.xy = vec2(u_xlat26) * vec2(u_xlat26) + vec2(-1.0, 1.0);
    u_xlat27 = u_xlat27 * u_xlat6.x + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat27 * 3.14159274 + 1.00000001e-07;
    u_xlat15.x = u_xlat15.x / u_xlat27;
    u_xlat27 = (-u_xlat37) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat41 = u_xlat2.x * u_xlat2.x;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat2.x = u_xlat2.x * u_xlat41;
    u_xlat41 = u_xlat2.y * u_xlat2.y;
    u_xlat41 = dot(vec2(u_xlat41), vec2(u_xlat4));
    u_xlat41 = u_xlat41 + -0.5;
    u_xlat27 = u_xlat41 * u_xlat27 + 1.0;
    u_xlat41 = u_xlat41 * u_xlat2.x + 1.0;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat3.x = u_xlat15.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.785398185;
    u_xlat15.x = max(u_xlat3.x, 9.99999975e-05);
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat3.x = (u_xlatb38) ? u_xlat15.x : u_xlat3.x;
    u_xlat3.x = u_xlat37 * u_xlat3.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat37 = u_xlat37 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat4;
    u_xlat26 = (-u_xlat26) * 0.280000001 + 1.0;
    u_xlat15.x = float(1.0) / u_xlat6.y;
    u_xlat26 = (u_xlatb38) ? u_xlat26 : u_xlat15.x;
    u_xlat36 = (-u_xlat36) + _Glossiness;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat37) * _LightColor0.xyz;
    u_xlat15.xyz = u_xlat5.xyz * vec3(u_xlat39) + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat37 = (-u_xlat2.y) + 1.0;
    u_xlat14.x = u_xlat37 * u_xlat37;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat37 = u_xlat37 * u_xlat14.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat37) + u_xlat0.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat15.xyz + u_xlat5.xyz;
    u_xlat14.xyz = u_xlat16.xyz * vec3(u_xlat26);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat36);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat14.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 180 math, 5 textures, 13 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec3 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_7 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_11;
  n_11 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec4 o_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_3 * 0.5);
  vec2 tmpvar_18;
  tmpvar_18.x = tmpvar_17.x;
  tmpvar_18.y = (tmpvar_17.y * _ProjectionParams.x);
  o_16.xy = (tmpvar_18 + tmpvar_17.w);
  o_16.zw = tmpvar_3.zw;
  vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_20;
  ambient_20 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_20 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_21;
  vec4 tmpvar_22;
  tmpvar_22 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x1_21.x = dot (unity_SHBr, tmpvar_22);
  x1_21.y = dot (unity_SHBg, tmpvar_22);
  x1_21.z = dot (unity_SHBb, tmpvar_22);
  ambient_20 = (ambient_20 + (x1_21 + (unity_SHC.xyz * 
    ((tmpvar_15.x * tmpvar_15.x) - (tmpvar_15.y * tmpvar_15.y))
  )));
  ambientOrLightmapUV_19.xyz = ambient_20;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = n_11;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = o_16;
  xlv_TEXCOORD8 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD1);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_7 - (2.0 * (
    dot (tmpvar_6, tmpvar_7)
   * tmpvar_6)));
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  vec3 tmpvar_13;
  tmpvar_13 = vec3(0.0, 0.0, 0.0);
  tmpvar_12 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x);
  vec3 ambient_14;
  vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_6;
  vec3 x_16;
  x_16.x = dot (unity_SHAr, tmpvar_15);
  x_16.y = dot (unity_SHAg, tmpvar_15);
  x_16.z = dot (unity_SHAb, tmpvar_15);
  vec3 tmpvar_17;
  tmpvar_17 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_16));
  ambient_14 = tmpvar_17;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_14 = max (((1.055 * 
      pow (max (tmpvar_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_13 = (ambient_14 * tmpvar_8);
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec3 specular_18;
  vec3 worldRefl_19;
  worldRefl_19 = tmpvar_10;
  vec3 worldPos_20;
  worldPos_20 = xlv_TEXCOORD8;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_21;
    tmpvar_21 = normalize(tmpvar_10);
    vec3 tmpvar_22;
    tmpvar_22 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_21);
    vec3 tmpvar_23;
    tmpvar_23 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_21);
    bvec3 tmpvar_24;
    tmpvar_24 = greaterThan (tmpvar_21, vec3(0.0, 0.0, 0.0));
    float tmpvar_25;
    if (tmpvar_24.x) {
      tmpvar_25 = tmpvar_22.x;
    } else {
      tmpvar_25 = tmpvar_23.x;
    };
    float tmpvar_26;
    if (tmpvar_24.y) {
      tmpvar_26 = tmpvar_22.y;
    } else {
      tmpvar_26 = tmpvar_23.y;
    };
    float tmpvar_27;
    if (tmpvar_24.z) {
      tmpvar_27 = tmpvar_22.z;
    } else {
      tmpvar_27 = tmpvar_23.z;
    };
    worldPos_20 = (xlv_TEXCOORD8 - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_19 = (worldPos_20 + (tmpvar_21 * min (
      min (tmpvar_25, tmpvar_26)
    , tmpvar_27)));
  };
  vec4 tmpvar_28;
  tmpvar_28.xyz = worldRefl_19;
  tmpvar_28.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_29;
  tmpvar_29 = textureCubeLod (unity_SpecCube0, worldRefl_19, tmpvar_28.w);
  vec3 tmpvar_30;
  tmpvar_30 = ((unity_SpecCube0_HDR.x * pow (tmpvar_29.w, unity_SpecCube0_HDR.y)) * tmpvar_29.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_31;
    worldRefl_31 = tmpvar_10;
    vec3 worldPos_32;
    worldPos_32 = xlv_TEXCOORD8;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_33;
      tmpvar_33 = normalize(tmpvar_10);
      vec3 tmpvar_34;
      tmpvar_34 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_33);
      vec3 tmpvar_35;
      tmpvar_35 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_33);
      bvec3 tmpvar_36;
      tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
      float tmpvar_37;
      if (tmpvar_36.x) {
        tmpvar_37 = tmpvar_34.x;
      } else {
        tmpvar_37 = tmpvar_35.x;
      };
      float tmpvar_38;
      if (tmpvar_36.y) {
        tmpvar_38 = tmpvar_34.y;
      } else {
        tmpvar_38 = tmpvar_35.y;
      };
      float tmpvar_39;
      if (tmpvar_36.z) {
        tmpvar_39 = tmpvar_34.z;
      } else {
        tmpvar_39 = tmpvar_35.z;
      };
      worldPos_32 = (xlv_TEXCOORD8 - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
        min (tmpvar_37, tmpvar_38)
      , tmpvar_39)));
    };
    vec4 tmpvar_40;
    tmpvar_40.xyz = worldRefl_31;
    tmpvar_40.w = ((tmpvar_9 * (1.7 - 
      (0.7 * tmpvar_9)
    )) * 6.0);
    vec4 tmpvar_41;
    tmpvar_41 = textureCubeLod (unity_SpecCube1, worldRefl_31, tmpvar_40.w);
    specular_18 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_41.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_41.xyz), tmpvar_30, unity_SpecCube0_BoxMin.www);
  } else {
    specular_18 = tmpvar_30;
  };
  tmpvar_11 = (specular_18 * tmpvar_8);
  vec3 viewDir_42;
  viewDir_42 = -(tmpvar_7);
  float surfaceReduction_43;
  float specularTerm_44;
  float tmpvar_45;
  tmpvar_45 = (1.0 - _Glossiness);
  vec3 tmpvar_46;
  vec3 inVec_47;
  inVec_47 = (_WorldSpaceLightPos0.xyz + viewDir_42);
  tmpvar_46 = (inVec_47 * inversesqrt(max (0.001, 
    dot (inVec_47, inVec_47)
  )));
  float tmpvar_48;
  tmpvar_48 = dot (tmpvar_6, viewDir_42);
  vec3 tmpvar_49;
  if ((tmpvar_48 < 0.0)) {
    tmpvar_49 = (tmpvar_6 + (viewDir_42 * (
      -(tmpvar_48)
     + 1e-05)));
  } else {
    tmpvar_49 = tmpvar_6;
  };
  float tmpvar_50;
  tmpvar_50 = max (0.0, dot (tmpvar_49, _WorldSpaceLightPos0.xyz));
  float tmpvar_51;
  tmpvar_51 = max (0.0, dot (tmpvar_49, tmpvar_46));
  float tmpvar_52;
  tmpvar_52 = max (0.0, dot (tmpvar_49, viewDir_42));
  float tmpvar_53;
  tmpvar_53 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_46));
  float tmpvar_54;
  tmpvar_54 = (tmpvar_45 * tmpvar_45);
  float tmpvar_55;
  tmpvar_55 = (tmpvar_45 * tmpvar_45);
  float tmpvar_56;
  tmpvar_56 = (tmpvar_55 * tmpvar_55);
  float tmpvar_57;
  tmpvar_57 = (((tmpvar_51 * tmpvar_51) * (tmpvar_56 - 1.0)) + 1.0);
  float x_58;
  x_58 = (1.0 - tmpvar_50);
  float x_59;
  x_59 = (1.0 - tmpvar_52);
  float tmpvar_60;
  tmpvar_60 = (0.5 + ((2.0 * tmpvar_53) * (tmpvar_53 * tmpvar_45)));
  float tmpvar_61;
  tmpvar_61 = ((1.0 + (
    (tmpvar_60 - 1.0)
   * 
    ((x_58 * x_58) * ((x_58 * x_58) * x_58))
  )) * (1.0 + (
    (tmpvar_60 - 1.0)
   * 
    ((x_59 * x_59) * ((x_59 * x_59) * x_59))
  )));
  float tmpvar_62;
  tmpvar_62 = (((2.0 / 
    (((tmpvar_50 * (
      (tmpvar_52 * (1.0 - tmpvar_54))
     + tmpvar_54)) + (tmpvar_52 * (
      (tmpvar_50 * (1.0 - tmpvar_54))
     + tmpvar_54))) + 1e-05)
  ) * (tmpvar_56 / 
    (((3.141593 * tmpvar_57) * tmpvar_57) + 1e-07)
  )) * 0.7853982);
  specularTerm_44 = tmpvar_62;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_44 = sqrt(max (0.0001, tmpvar_62));
  };
  float tmpvar_63;
  tmpvar_63 = max (0.0, (specularTerm_44 * tmpvar_50));
  specularTerm_44 = tmpvar_63;
  float tmpvar_64;
  tmpvar_64 = (tmpvar_61 * tmpvar_50);
  float tmpvar_65;
  tmpvar_65 = (tmpvar_45 * tmpvar_45);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    surfaceReduction_43 = (1.0 - ((0.28 * tmpvar_65) * tmpvar_45));
  } else {
    surfaceReduction_43 = (1.0/(((tmpvar_65 * tmpvar_65) + 1.0)));
  };
  float x_66;
  x_66 = (1.0 - tmpvar_53);
  float x_67;
  x_67 = (1.0 - tmpvar_52);
  vec3 tmpvar_68;
  tmpvar_68 = (((tmpvar_3 * 
    (tmpvar_13 + (tmpvar_12 * tmpvar_64))
  ) + (
    (tmpvar_63 * tmpvar_12)
   * 
    (tmpvar_4 + ((1.0 - tmpvar_4) * ((x_66 * x_66) * (
      (x_66 * x_66)
     * x_66))))
  )) + ((surfaceReduction_43 * tmpvar_11) * mix (tmpvar_4, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)
  ), vec3(
    ((x_67 * x_67) * ((x_67 * x_67) * x_67))
  ))));
  vec4 tmpvar_69;
  tmpvar_69.w = 1.0;
  tmpvar_69.xyz = tmpvar_68;
  c_1.w = tmpvar_69.w;
  c_1.xyz = tmpvar_68;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_70;
  xlat_varoutput_70.xyz = c_1.xyz;
  xlat_varoutput_70.w = 1.0;
  gl_FragData[0] = xlat_varoutput_70;
}


#endif
"
}
SubProgram "metal " {
// Stats: 33 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 306
Matrix 64 [glstate_matrix_mvp]
Matrix 128 [_Object2World]
Matrix 192 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
VectorHalf 32 [unity_SHBr] 4
VectorHalf 40 [unity_SHBg] 4
VectorHalf 48 [unity_SHBb] 4
VectorHalf 56 [unity_SHC] 4
VectorHalf 256 [unity_ColorSpaceLuminance] 4
Vector 272 [_MainTex_ST]
Vector 288 [_DetailAlbedoMap_ST]
ScalarHalf 304 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  float3 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_10;
  texcoord_10.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_11;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_12;
  float3 n_13;
  n_13 = (tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_12 = half3(n_13);
  float3 norm_14;
  norm_14 = float3(tmpvar_1);
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].x;
  v_15.y = _mtl_u._World2Object[1].x;
  v_15.z = _mtl_u._World2Object[2].x;
  v_15.w = _mtl_u._World2Object[3].x;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].y;
  v_16.y = _mtl_u._World2Object[1].y;
  v_16.z = _mtl_u._World2Object[2].y;
  v_16.w = _mtl_u._World2Object[3].y;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].z;
  v_17.y = _mtl_u._World2Object[1].z;
  v_17.z = _mtl_u._World2Object[2].z;
  v_17.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_18);
  float4 o_19;
  float4 tmpvar_20;
  tmpvar_20 = (tmpvar_4 * 0.5);
  float2 tmpvar_21;
  tmpvar_21.x = tmpvar_20.x;
  tmpvar_21.y = (tmpvar_20.y * _mtl_u._ProjectionParams.x);
  o_19.xy = (tmpvar_21 + tmpvar_20.w);
  o_19.zw = tmpvar_4.zw;
  half3 normalWorld_22;
  normalWorld_22 = half3(tmpvar_18);
  half4 ambientOrLightmapUV_23;
  ambientOrLightmapUV_23 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 ambient_24;
  ambient_24 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_25;
  tmpvar_25 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_25) {
    ambient_24 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_26;
  half4 tmpvar_27;
  tmpvar_27 = (normalWorld_22.xyzz * normalWorld_22.yzzx);
  x1_26.x = dot (_mtl_u.unity_SHBr, tmpvar_27);
  x1_26.y = dot (_mtl_u.unity_SHBg, tmpvar_27);
  x1_26.z = dot (_mtl_u.unity_SHBb, tmpvar_27);
  ambient_24 = (ambient_24 + (x1_26 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_22.x * normalWorld_22.x) - (normalWorld_22.y * normalWorld_22.y))
  )));
  ambientOrLightmapUV_23.xyz = ambient_24;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_10;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_12;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_23;
  _mtl_o.xlv_TEXCOORD6 = o_19;
  _mtl_o.xlv_TEXCOORD8 = tmpvar_8;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD8.xyz = u_xlat1.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
vec3 u_xlat16;
float u_xlat17;
float u_xlat28;
float u_xlat29;
float u_xlat30;
float u_xlat39;
float u_xlat40;
bool u_xlatb41;
float u_xlat42;
float u_xlat44;
mediump float u_xlat16_44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
float u_xlat46;
bool u_xlatb46;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat39 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat17 = (-_Glossiness) + 1.0;
    u_xlat30 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat30)) + u_xlat3.xyz;
    u_xlat4.xzw = u_xlat10_4.xxx * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat6.x = dot(unity_SHAr, u_xlat2);
    u_xlat6.y = dot(unity_SHAg, u_xlat2);
    u_xlat6.z = dot(unity_SHAb, u_xlat2);
    u_xlat6.xyz = u_xlat6.xyz + vs_TEXCOORD5.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb41 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat7.xyz = log2(u_xlat6.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = (bool(u_xlatb41)) ? u_xlat7.xyz : u_xlat6.xyz;
    u_xlatb44 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb44){
        u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat7.xyz = vec3(u_xlat44) * u_xlat5.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat44 = min(u_xlat8.y, u_xlat8.x);
        u_xlat44 = min(u_xlat8.z, u_xlat44);
        u_xlat8.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat44) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat44 = (-u_xlat17) * 0.699999988 + 1.70000005;
    u_xlat44 = u_xlat17 * u_xlat44;
    u_xlat44 = u_xlat44 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat44);
    u_xlat16_45 = log2(u_xlat10_7.w);
    u_xlat45 = u_xlat16_45 * unity_SpecCube0_HDR.y;
    u_xlat45 = exp2(u_xlat45);
    u_xlat45 = u_xlat45 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat45);
    u_xlatb46 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb46){
        u_xlatb46 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb46){
            u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat46 = inversesqrt(u_xlat46);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat46);
            u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat46 = min(u_xlat10.y, u_xlat10.x);
            u_xlat46 = min(u_xlat10.z, u_xlat46);
            u_xlat10.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat46) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat44);
        u_xlat16_44 = log2(u_xlat10_5.w);
        u_xlat44 = u_xlat16_44 * unity_SpecCube1_HDR.y;
        u_xlat44 = exp2(u_xlat44);
        u_xlat44 = u_xlat44 * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * vec3(u_xlat44);
        u_xlat7.xyz = vec3(u_xlat45) * u_xlat10_7.xyz + (-u_xlat5.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlatb44 = u_xlat40<0.0;
    u_xlat40 = (-u_xlat40) + 9.99999975e-06;
    u_xlat8.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb44)) ? u_xlat8.xyz : u_xlat2.xyz;
    u_xlat40 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat44 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat7.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat28 = u_xlat17 * u_xlat17;
    u_xlat3.x = (-u_xlat17) * u_xlat17 + 1.0;
    u_xlat16.x = u_xlat2.x * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat40 * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat16.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat16.x = u_xlat28 * u_xlat28;
    u_xlat29 = u_xlat44 * u_xlat44;
    u_xlat7.xy = vec2(u_xlat28) * vec2(u_xlat28) + vec2(-1.0, 1.0);
    u_xlat29 = u_xlat29 * u_xlat7.x + 1.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat29 * 3.14159274 + 1.00000001e-07;
    u_xlat16.x = u_xlat16.x / u_xlat29;
    u_xlat29 = (-u_xlat40) + 1.0;
    u_xlat44 = u_xlat29 * u_xlat29;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat29 = u_xlat29 * u_xlat44;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat44 = u_xlat2.x * u_xlat2.x;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat2.x = u_xlat2.x * u_xlat44;
    u_xlat44 = u_xlat2.y * u_xlat2.y;
    u_xlat44 = dot(vec2(u_xlat44), vec2(u_xlat17));
    u_xlat44 = u_xlat44 + -0.5;
    u_xlat29 = u_xlat44 * u_xlat29 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * u_xlat44;
    u_xlat3.x = u_xlat16.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.785398185;
    u_xlat16.x = max(u_xlat3.x, 9.99999975e-05);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat3.x = (u_xlatb41) ? u_xlat16.x : u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat3.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat40 = u_xlat40 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat17;
    u_xlat28 = (-u_xlat28) * 0.280000001 + 1.0;
    u_xlat16.x = float(1.0) / u_xlat7.y;
    u_xlat28 = (u_xlatb41) ? u_xlat28 : u_xlat16.x;
    u_xlat39 = (-u_xlat39) + _Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat4.xzw;
    u_xlat16.xyz = u_xlat6.xyz * vec3(u_xlat42) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xzw * u_xlat3.xxx;
    u_xlat40 = (-u_xlat2.y) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16.xyz + u_xlat4.xyz;
    u_xlat15.xyz = u_xlat5.xyz * vec3(u_xlat28);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat15.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 179 math, 4 textures, 13 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec3 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_7 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_11;
  n_11 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec4 ambientOrLightmapUV_16;
  ambientOrLightmapUV_16.w = 0.0;
  vec3 col_17;
  vec4 ndotl_18;
  vec4 lengthSq_19;
  vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosX0 - tmpvar_8.x);
  vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosY0 - tmpvar_8.y);
  vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_19 = (tmpvar_20 * tmpvar_20);
  lengthSq_19 = (lengthSq_19 + (tmpvar_21 * tmpvar_21));
  lengthSq_19 = (lengthSq_19 + (tmpvar_22 * tmpvar_22));
  ndotl_18 = (tmpvar_20 * tmpvar_15.x);
  ndotl_18 = (ndotl_18 + (tmpvar_21 * tmpvar_15.y));
  ndotl_18 = (ndotl_18 + (tmpvar_22 * tmpvar_15.z));
  vec4 tmpvar_23;
  tmpvar_23 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_18 * inversesqrt(lengthSq_19)));
  ndotl_18 = tmpvar_23;
  vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_23 * (1.0/((1.0 + 
    (lengthSq_19 * unity_4LightAtten0)
  ))));
  col_17 = (unity_LightColor[0].xyz * tmpvar_24.x);
  col_17 = (col_17 + (unity_LightColor[1].xyz * tmpvar_24.y));
  col_17 = (col_17 + (unity_LightColor[2].xyz * tmpvar_24.z));
  col_17 = (col_17 + (unity_LightColor[3].xyz * tmpvar_24.w));
  ambientOrLightmapUV_16.xyz = col_17;
  vec3 ambient_25;
  ambient_25 = ambientOrLightmapUV_16.xyz;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_25 = (col_17 * ((col_17 * 
      ((col_17 * 0.305306) + 0.6821711)
    ) + 0.01252288));
  };
  vec3 x1_26;
  vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x1_26.x = dot (unity_SHBr, tmpvar_27);
  x1_26.y = dot (unity_SHBg, tmpvar_27);
  x1_26.z = dot (unity_SHBb, tmpvar_27);
  ambient_25 = (ambient_25 + (x1_26 + (unity_SHC.xyz * 
    ((tmpvar_15.x * tmpvar_15.x) - (tmpvar_15.y * tmpvar_15.y))
  )));
  ambientOrLightmapUV_16.xyz = ambient_25;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = n_11;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_16;
  xlv_TEXCOORD8 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD1);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_7 - (2.0 * (
    dot (tmpvar_6, tmpvar_7)
   * tmpvar_6)));
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_13;
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_6;
  vec3 x_15;
  x_15.x = dot (unity_SHAr, tmpvar_14);
  x_15.y = dot (unity_SHAg, tmpvar_14);
  x_15.z = dot (unity_SHAb, tmpvar_14);
  vec3 tmpvar_16;
  tmpvar_16 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_15));
  ambient_13 = tmpvar_16;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_13 = max (((1.055 * 
      pow (max (tmpvar_16, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_12 = (ambient_13 * tmpvar_8);
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec3 specular_17;
  vec3 worldRefl_18;
  worldRefl_18 = tmpvar_10;
  vec3 worldPos_19;
  worldPos_19 = xlv_TEXCOORD8;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_20;
    tmpvar_20 = normalize(tmpvar_10);
    vec3 tmpvar_21;
    tmpvar_21 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_20);
    vec3 tmpvar_22;
    tmpvar_22 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_20);
    bvec3 tmpvar_23;
    tmpvar_23 = greaterThan (tmpvar_20, vec3(0.0, 0.0, 0.0));
    float tmpvar_24;
    if (tmpvar_23.x) {
      tmpvar_24 = tmpvar_21.x;
    } else {
      tmpvar_24 = tmpvar_22.x;
    };
    float tmpvar_25;
    if (tmpvar_23.y) {
      tmpvar_25 = tmpvar_21.y;
    } else {
      tmpvar_25 = tmpvar_22.y;
    };
    float tmpvar_26;
    if (tmpvar_23.z) {
      tmpvar_26 = tmpvar_21.z;
    } else {
      tmpvar_26 = tmpvar_22.z;
    };
    worldPos_19 = (xlv_TEXCOORD8 - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_18 = (worldPos_19 + (tmpvar_20 * min (
      min (tmpvar_24, tmpvar_25)
    , tmpvar_26)));
  };
  vec4 tmpvar_27;
  tmpvar_27.xyz = worldRefl_18;
  tmpvar_27.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_28;
  tmpvar_28 = textureCubeLod (unity_SpecCube0, worldRefl_18, tmpvar_27.w);
  vec3 tmpvar_29;
  tmpvar_29 = ((unity_SpecCube0_HDR.x * pow (tmpvar_28.w, unity_SpecCube0_HDR.y)) * tmpvar_28.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_30;
    worldRefl_30 = tmpvar_10;
    vec3 worldPos_31;
    worldPos_31 = xlv_TEXCOORD8;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_32;
      tmpvar_32 = normalize(tmpvar_10);
      vec3 tmpvar_33;
      tmpvar_33 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_32);
      vec3 tmpvar_34;
      tmpvar_34 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_32);
      bvec3 tmpvar_35;
      tmpvar_35 = greaterThan (tmpvar_32, vec3(0.0, 0.0, 0.0));
      float tmpvar_36;
      if (tmpvar_35.x) {
        tmpvar_36 = tmpvar_33.x;
      } else {
        tmpvar_36 = tmpvar_34.x;
      };
      float tmpvar_37;
      if (tmpvar_35.y) {
        tmpvar_37 = tmpvar_33.y;
      } else {
        tmpvar_37 = tmpvar_34.y;
      };
      float tmpvar_38;
      if (tmpvar_35.z) {
        tmpvar_38 = tmpvar_33.z;
      } else {
        tmpvar_38 = tmpvar_34.z;
      };
      worldPos_31 = (xlv_TEXCOORD8 - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_30 = (worldPos_31 + (tmpvar_32 * min (
        min (tmpvar_36, tmpvar_37)
      , tmpvar_38)));
    };
    vec4 tmpvar_39;
    tmpvar_39.xyz = worldRefl_30;
    tmpvar_39.w = ((tmpvar_9 * (1.7 - 
      (0.7 * tmpvar_9)
    )) * 6.0);
    vec4 tmpvar_40;
    tmpvar_40 = textureCubeLod (unity_SpecCube1, worldRefl_30, tmpvar_39.w);
    specular_17 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_40.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_40.xyz), tmpvar_29, unity_SpecCube0_BoxMin.www);
  } else {
    specular_17 = tmpvar_29;
  };
  tmpvar_11 = (specular_17 * tmpvar_8);
  vec3 viewDir_41;
  viewDir_41 = -(tmpvar_7);
  float surfaceReduction_42;
  float specularTerm_43;
  float tmpvar_44;
  tmpvar_44 = (1.0 - _Glossiness);
  vec3 tmpvar_45;
  vec3 inVec_46;
  inVec_46 = (_WorldSpaceLightPos0.xyz + viewDir_41);
  tmpvar_45 = (inVec_46 * inversesqrt(max (0.001, 
    dot (inVec_46, inVec_46)
  )));
  float tmpvar_47;
  tmpvar_47 = dot (tmpvar_6, viewDir_41);
  vec3 tmpvar_48;
  if ((tmpvar_47 < 0.0)) {
    tmpvar_48 = (tmpvar_6 + (viewDir_41 * (
      -(tmpvar_47)
     + 1e-05)));
  } else {
    tmpvar_48 = tmpvar_6;
  };
  float tmpvar_49;
  tmpvar_49 = max (0.0, dot (tmpvar_48, _WorldSpaceLightPos0.xyz));
  float tmpvar_50;
  tmpvar_50 = max (0.0, dot (tmpvar_48, tmpvar_45));
  float tmpvar_51;
  tmpvar_51 = max (0.0, dot (tmpvar_48, viewDir_41));
  float tmpvar_52;
  tmpvar_52 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_45));
  float tmpvar_53;
  tmpvar_53 = (tmpvar_44 * tmpvar_44);
  float tmpvar_54;
  tmpvar_54 = (tmpvar_44 * tmpvar_44);
  float tmpvar_55;
  tmpvar_55 = (tmpvar_54 * tmpvar_54);
  float tmpvar_56;
  tmpvar_56 = (((tmpvar_50 * tmpvar_50) * (tmpvar_55 - 1.0)) + 1.0);
  float x_57;
  x_57 = (1.0 - tmpvar_49);
  float x_58;
  x_58 = (1.0 - tmpvar_51);
  float tmpvar_59;
  tmpvar_59 = (0.5 + ((2.0 * tmpvar_52) * (tmpvar_52 * tmpvar_44)));
  float tmpvar_60;
  tmpvar_60 = ((1.0 + (
    (tmpvar_59 - 1.0)
   * 
    ((x_57 * x_57) * ((x_57 * x_57) * x_57))
  )) * (1.0 + (
    (tmpvar_59 - 1.0)
   * 
    ((x_58 * x_58) * ((x_58 * x_58) * x_58))
  )));
  float tmpvar_61;
  tmpvar_61 = (((2.0 / 
    (((tmpvar_49 * (
      (tmpvar_51 * (1.0 - tmpvar_53))
     + tmpvar_53)) + (tmpvar_51 * (
      (tmpvar_49 * (1.0 - tmpvar_53))
     + tmpvar_53))) + 1e-05)
  ) * (tmpvar_55 / 
    (((3.141593 * tmpvar_56) * tmpvar_56) + 1e-07)
  )) * 0.7853982);
  specularTerm_43 = tmpvar_61;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_43 = sqrt(max (0.0001, tmpvar_61));
  };
  float tmpvar_62;
  tmpvar_62 = max (0.0, (specularTerm_43 * tmpvar_49));
  specularTerm_43 = tmpvar_62;
  float tmpvar_63;
  tmpvar_63 = (tmpvar_60 * tmpvar_49);
  float tmpvar_64;
  tmpvar_64 = (tmpvar_44 * tmpvar_44);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    surfaceReduction_42 = (1.0 - ((0.28 * tmpvar_64) * tmpvar_44));
  } else {
    surfaceReduction_42 = (1.0/(((tmpvar_64 * tmpvar_64) + 1.0)));
  };
  float x_65;
  x_65 = (1.0 - tmpvar_52);
  float x_66;
  x_66 = (1.0 - tmpvar_51);
  vec3 tmpvar_67;
  tmpvar_67 = (((tmpvar_3 * 
    (tmpvar_12 + (_LightColor0.xyz * tmpvar_63))
  ) + (
    (tmpvar_62 * _LightColor0.xyz)
   * 
    (tmpvar_4 + ((1.0 - tmpvar_4) * ((x_65 * x_65) * (
      (x_65 * x_65)
     * x_65))))
  )) + ((surfaceReduction_42 * tmpvar_11) * mix (tmpvar_4, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)
  ), vec3(
    ((x_66 * x_66) * ((x_66 * x_66) * x_66))
  ))));
  vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = tmpvar_67;
  c_1.w = tmpvar_68.w;
  c_1.xyz = tmpvar_67;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_69;
  xlat_varoutput_69.xyz = c_1.xyz;
  xlat_varoutput_69.w = 1.0;
  gl_FragData[0] = xlat_varoutput_69;
}


#endif
"
}
SubProgram "metal " {
// Stats: 60 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 418
Matrix 176 [glstate_matrix_mvp]
Matrix 240 [_Object2World]
Matrix 304 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [unity_4LightPosX0]
Vector 32 [unity_4LightPosY0]
Vector 48 [unity_4LightPosZ0]
VectorHalf 64 [unity_4LightAtten0] 4
VectorHalf 72 [unity_LightColor0] 4
VectorHalf 80 [unity_LightColor1] 4
VectorHalf 88 [unity_LightColor2] 4
VectorHalf 96 [unity_LightColor3] 4
VectorHalf 104 [unity_LightColor4] 4
VectorHalf 112 [unity_LightColor5] 4
VectorHalf 120 [unity_LightColor6] 4
VectorHalf 128 [unity_LightColor7] 4
VectorHalf 136 [unity_SHBr] 4
VectorHalf 144 [unity_SHBg] 4
VectorHalf 152 [unity_SHBb] 4
VectorHalf 160 [unity_SHC] 4
VectorHalf 368 [unity_ColorSpaceLuminance] 4
Vector 384 [_MainTex_ST]
Vector 400 [_DetailAlbedoMap_ST]
ScalarHalf 416 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 unity_4LightPosX0;
  float4 unity_4LightPosY0;
  float4 unity_4LightPosZ0;
  half4 unity_4LightAtten0;
  half4 unity_LightColor[8];
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  float3 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_10;
  texcoord_10.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_11;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_12;
  float3 n_13;
  n_13 = (tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_12 = half3(n_13);
  float3 norm_14;
  norm_14 = float3(tmpvar_1);
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].x;
  v_15.y = _mtl_u._World2Object[1].x;
  v_15.z = _mtl_u._World2Object[2].x;
  v_15.w = _mtl_u._World2Object[3].x;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].y;
  v_16.y = _mtl_u._World2Object[1].y;
  v_16.z = _mtl_u._World2Object[2].y;
  v_16.w = _mtl_u._World2Object[3].y;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].z;
  v_17.y = _mtl_u._World2Object[1].z;
  v_17.z = _mtl_u._World2Object[2].z;
  v_17.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_18);
  half3 normalWorld_19;
  normalWorld_19 = half3(tmpvar_18);
  half4 ambientOrLightmapUV_20;
  ambientOrLightmapUV_20.w = half(0.0);
  float3 lightColor0_21;
  lightColor0_21 = float3(_mtl_u.unity_LightColor[0].xyz);
  float3 lightColor1_22;
  lightColor1_22 = float3(_mtl_u.unity_LightColor[1].xyz);
  float3 lightColor2_23;
  lightColor2_23 = float3(_mtl_u.unity_LightColor[2].xyz);
  float3 lightColor3_24;
  lightColor3_24 = float3(_mtl_u.unity_LightColor[3].xyz);
  float4 lightAttenSq_25;
  lightAttenSq_25 = float4(_mtl_u.unity_4LightAtten0);
  float3 normal_26;
  normal_26 = float3(normalWorld_19);
  float3 col_27;
  float4 ndotl_28;
  float4 lengthSq_29;
  float4 tmpvar_30;
  tmpvar_30 = (_mtl_u.unity_4LightPosX0 - tmpvar_9.x);
  float4 tmpvar_31;
  tmpvar_31 = (_mtl_u.unity_4LightPosY0 - tmpvar_9.y);
  float4 tmpvar_32;
  tmpvar_32 = (_mtl_u.unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_29 = (tmpvar_30 * tmpvar_30);
  lengthSq_29 = (lengthSq_29 + (tmpvar_31 * tmpvar_31));
  lengthSq_29 = (lengthSq_29 + (tmpvar_32 * tmpvar_32));
  ndotl_28 = (tmpvar_30 * normal_26.x);
  ndotl_28 = (ndotl_28 + (tmpvar_31 * normal_26.y));
  ndotl_28 = (ndotl_28 + (tmpvar_32 * normal_26.z));
  float4 tmpvar_33;
  tmpvar_33 = max (float4(0.0, 0.0, 0.0, 0.0), (ndotl_28 * rsqrt(lengthSq_29)));
  ndotl_28 = tmpvar_33;
  float4 tmpvar_34;
  tmpvar_34 = (tmpvar_33 * (1.0/((1.0 + 
    (lengthSq_29 * lightAttenSq_25)
  ))));
  col_27 = (lightColor0_21 * tmpvar_34.x);
  col_27 = (col_27 + (lightColor1_22 * tmpvar_34.y));
  col_27 = (col_27 + (lightColor2_23 * tmpvar_34.z));
  col_27 = (col_27 + (lightColor3_24 * tmpvar_34.w));
  ambientOrLightmapUV_20.xyz = half3(col_27);
  half3 ambient_35;
  ambient_35 = ambientOrLightmapUV_20.xyz;
  bool tmpvar_36;
  tmpvar_36 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_36) {
    ambient_35 = (ambientOrLightmapUV_20.xyz * ((ambientOrLightmapUV_20.xyz * 
      ((ambientOrLightmapUV_20.xyz * (half)0.305306) + (half)0.6821711)
    ) + (half)0.01252288));
  };
  half3 x1_37;
  half4 tmpvar_38;
  tmpvar_38 = (normalWorld_19.xyzz * normalWorld_19.yzzx);
  x1_37.x = dot (_mtl_u.unity_SHBr, tmpvar_38);
  x1_37.y = dot (_mtl_u.unity_SHBg, tmpvar_38);
  x1_37.z = dot (_mtl_u.unity_SHBb, tmpvar_38);
  ambient_35 = (ambient_35 + (x1_37 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_19.x * normalWorld_19.x) - (normalWorld_19.y * normalWorld_19.y))
  )));
  ambientOrLightmapUV_20.xyz = ambient_35;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_10;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_12;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_20;
  _mtl_o.xlv_TEXCOORD8 = tmpvar_8;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat4 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    vs_TEXCOORD8.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat4 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat2 * u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlatb15 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat0.xyz = (bool(u_xlatb15)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
vec3 u_xlat9;
bvec3 u_xlatb9;
vec3 u_xlat10;
bvec3 u_xlatb11;
vec3 u_xlat14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump float u_xlat16_16;
float u_xlat26;
float u_xlat27;
float u_xlat36;
float u_xlat37;
bool u_xlatb38;
float u_xlat39;
float u_xlat41;
bool u_xlatb41;
float u_xlat42;
mediump float u_xlat16_42;
float u_xlat43;
bool u_xlatb43;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat36 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat1.xyz;
    u_xlat37 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat2.xyz = vec3(u_xlat37) * vs_TEXCOORD4.xyz;
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat39 = (-_OcclusionStrength) + 1.0;
    u_xlat39 = u_xlat10_4.y * _OcclusionStrength + u_xlat39;
    u_xlat4 = (-_Glossiness) + 1.0;
    u_xlat16.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat16.xyz = u_xlat2.xyz * (-u_xlat16.xxx) + u_xlat3.xyz;
    u_xlat2.w = 1.0;
    u_xlat5.x = dot(unity_SHAr, u_xlat2);
    u_xlat5.y = dot(unity_SHAg, u_xlat2);
    u_xlat5.z = dot(unity_SHAb, u_xlat2);
    u_xlat5.xyz = u_xlat5.xyz + vs_TEXCOORD5.xyz;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb38 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat6.xyz = log2(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = (bool(u_xlatb38)) ? u_xlat6.xyz : u_xlat5.xyz;
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat16.xyz, u_xlat16.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat6.xyz = u_xlat16.xyz * vec3(u_xlat41);
        u_xlat7.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        u_xlat7.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
        u_xlat7.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
        u_xlat7.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
        u_xlat41 = min(u_xlat7.y, u_xlat7.x);
        u_xlat41 = min(u_xlat7.z, u_xlat41);
        u_xlat7.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat41) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16.xyz;
    //ENDIF
    }
    u_xlat41 = (-u_xlat4) * 0.699999988 + 1.70000005;
    u_xlat41 = u_xlat4 * u_xlat41;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat10_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat41);
    u_xlat16_42 = log2(u_xlat10_6.w);
    u_xlat42 = u_xlat16_42 * unity_SpecCube0_HDR.y;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat10_6.xyz * vec3(u_xlat42);
    u_xlatb43 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat16.xyz, u_xlat16.xyz);
            u_xlat43 = inversesqrt(u_xlat43);
            u_xlat8.xyz = u_xlat16.xyz * vec3(u_xlat43);
            u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            u_xlat9.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
            u_xlat9.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
            u_xlat9.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
            u_xlat43 = min(u_xlat9.y, u_xlat9.x);
            u_xlat43 = min(u_xlat9.z, u_xlat43);
            u_xlat9.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat16.xyz = u_xlat8.xyz * vec3(u_xlat43) + u_xlat9.xyz;
        //ENDIF
        }
        u_xlat10_8 = textureLod(unity_SpecCube1, u_xlat16.xyz, u_xlat41);
        u_xlat16_16 = log2(u_xlat10_8.w);
        u_xlat16.x = u_xlat16_16 * unity_SpecCube1_HDR.y;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat16.x = u_xlat16.x * unity_SpecCube1_HDR.x;
        u_xlat16.xyz = u_xlat10_8.xyz * u_xlat16.xxx;
        u_xlat6.xyz = vec3(u_xlat42) * u_xlat10_6.xyz + (-u_xlat16.xyz);
        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat16.xyz;
    //ENDIF
    }
    u_xlat16.xyz = vec3(u_xlat39) * u_xlat7.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat37) + _WorldSpaceLightPos0.xyz;
    u_xlat37 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat37 = max(u_xlat37, 0.00100000005);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat6.xyz = vec3(u_xlat37) * u_xlat6.xyz;
    u_xlat37 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlatb41 = u_xlat37<0.0;
    u_xlat37 = (-u_xlat37) + 9.99999975e-06;
    u_xlat7.xyz = (-u_xlat3.xyz) * vec3(u_xlat37) + u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb41)) ? u_xlat7.xyz : u_xlat2.xyz;
    u_xlat37 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat41 = max(u_xlat41, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat26 = u_xlat4 * u_xlat4;
    u_xlat3.x = (-u_xlat4) * u_xlat4 + 1.0;
    u_xlat15.x = u_xlat2.x * u_xlat3.x + u_xlat26;
    u_xlat3.x = u_xlat37 * u_xlat3.x + u_xlat26;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat37 * u_xlat15.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat15.x = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat41 * u_xlat41;
    u_xlat6.xy = vec2(u_xlat26) * vec2(u_xlat26) + vec2(-1.0, 1.0);
    u_xlat27 = u_xlat27 * u_xlat6.x + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat27 * 3.14159274 + 1.00000001e-07;
    u_xlat15.x = u_xlat15.x / u_xlat27;
    u_xlat27 = (-u_xlat37) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat41 = u_xlat2.x * u_xlat2.x;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat2.x = u_xlat2.x * u_xlat41;
    u_xlat41 = u_xlat2.y * u_xlat2.y;
    u_xlat41 = dot(vec2(u_xlat41), vec2(u_xlat4));
    u_xlat41 = u_xlat41 + -0.5;
    u_xlat27 = u_xlat41 * u_xlat27 + 1.0;
    u_xlat41 = u_xlat41 * u_xlat2.x + 1.0;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat3.x = u_xlat15.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.785398185;
    u_xlat15.x = max(u_xlat3.x, 9.99999975e-05);
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat3.x = (u_xlatb38) ? u_xlat15.x : u_xlat3.x;
    u_xlat3.x = u_xlat37 * u_xlat3.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat37 = u_xlat37 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat4;
    u_xlat26 = (-u_xlat26) * 0.280000001 + 1.0;
    u_xlat15.x = float(1.0) / u_xlat6.y;
    u_xlat26 = (u_xlatb38) ? u_xlat26 : u_xlat15.x;
    u_xlat36 = (-u_xlat36) + _Glossiness;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat37) * _LightColor0.xyz;
    u_xlat15.xyz = u_xlat5.xyz * vec3(u_xlat39) + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat37 = (-u_xlat2.y) + 1.0;
    u_xlat14.x = u_xlat37 * u_xlat37;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat37 = u_xlat37 * u_xlat14.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat37) + u_xlat0.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat15.xyz + u_xlat5.xyz;
    u_xlat14.xyz = u_xlat16.xyz * vec3(u_xlat26);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat36);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat14.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 180 math, 5 textures, 13 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec3 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  tmpvar_7 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_9;
  texcoord_9.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_10;
  if ((_UVSec == 0.0)) {
    tmpvar_10 = tmpvar_1;
  } else {
    tmpvar_10 = tmpvar_2;
  };
  texcoord_9.zw = ((tmpvar_10 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_11;
  n_11 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_12;
  v_12.x = _World2Object[0].x;
  v_12.y = _World2Object[1].x;
  v_12.z = _World2Object[2].x;
  v_12.w = _World2Object[3].x;
  vec4 v_13;
  v_13.x = _World2Object[0].y;
  v_13.y = _World2Object[1].y;
  v_13.z = _World2Object[2].y;
  v_13.w = _World2Object[3].y;
  vec4 v_14;
  v_14.x = _World2Object[0].z;
  v_14.y = _World2Object[1].z;
  v_14.z = _World2Object[2].z;
  v_14.w = _World2Object[3].z;
  vec3 tmpvar_15;
  tmpvar_15 = normalize(((
    (v_12.xyz * gl_Normal.x)
   + 
    (v_13.xyz * gl_Normal.y)
  ) + (v_14.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_15;
  vec4 o_16;
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_3 * 0.5);
  vec2 tmpvar_18;
  tmpvar_18.x = tmpvar_17.x;
  tmpvar_18.y = (tmpvar_17.y * _ProjectionParams.x);
  o_16.xy = (tmpvar_18 + tmpvar_17.w);
  o_16.zw = tmpvar_3.zw;
  vec4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = 0.0;
  vec3 col_20;
  vec4 ndotl_21;
  vec4 lengthSq_22;
  vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_8.x);
  vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_8.y);
  vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_22 = (tmpvar_23 * tmpvar_23);
  lengthSq_22 = (lengthSq_22 + (tmpvar_24 * tmpvar_24));
  lengthSq_22 = (lengthSq_22 + (tmpvar_25 * tmpvar_25));
  ndotl_21 = (tmpvar_23 * tmpvar_15.x);
  ndotl_21 = (ndotl_21 + (tmpvar_24 * tmpvar_15.y));
  ndotl_21 = (ndotl_21 + (tmpvar_25 * tmpvar_15.z));
  vec4 tmpvar_26;
  tmpvar_26 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_21 * inversesqrt(lengthSq_22)));
  ndotl_21 = tmpvar_26;
  vec4 tmpvar_27;
  tmpvar_27 = (tmpvar_26 * (1.0/((1.0 + 
    (lengthSq_22 * unity_4LightAtten0)
  ))));
  col_20 = (unity_LightColor[0].xyz * tmpvar_27.x);
  col_20 = (col_20 + (unity_LightColor[1].xyz * tmpvar_27.y));
  col_20 = (col_20 + (unity_LightColor[2].xyz * tmpvar_27.z));
  col_20 = (col_20 + (unity_LightColor[3].xyz * tmpvar_27.w));
  ambientOrLightmapUV_19.xyz = col_20;
  vec3 ambient_28;
  ambient_28 = ambientOrLightmapUV_19.xyz;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_28 = (col_20 * ((col_20 * 
      ((col_20 * 0.305306) + 0.6821711)
    ) + 0.01252288));
  };
  vec3 x1_29;
  vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_15.xyzz * tmpvar_15.yzzx);
  x1_29.x = dot (unity_SHBr, tmpvar_30);
  x1_29.y = dot (unity_SHBg, tmpvar_30);
  x1_29.z = dot (unity_SHBb, tmpvar_30);
  ambient_28 = (ambient_28 + (x1_29 + (unity_SHC.xyz * 
    ((tmpvar_15.x * tmpvar_15.x) - (tmpvar_15.y * tmpvar_15.y))
  )));
  ambientOrLightmapUV_19.xyz = ambient_28;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_9;
  xlv_TEXCOORD1 = n_11;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  xlv_TEXCOORD6 = o_16;
  xlv_TEXCOORD8 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD8;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_7;
  tmpvar_7 = normalize(xlv_TEXCOORD1);
  float tmpvar_8;
  tmpvar_8 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_7 - (2.0 * (
    dot (tmpvar_6, tmpvar_7)
   * tmpvar_6)));
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  vec3 tmpvar_13;
  tmpvar_13 = vec3(0.0, 0.0, 0.0);
  tmpvar_12 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x);
  vec3 ambient_14;
  vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_6;
  vec3 x_16;
  x_16.x = dot (unity_SHAr, tmpvar_15);
  x_16.y = dot (unity_SHAg, tmpvar_15);
  x_16.z = dot (unity_SHAb, tmpvar_15);
  vec3 tmpvar_17;
  tmpvar_17 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_16));
  ambient_14 = tmpvar_17;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_14 = max (((1.055 * 
      pow (max (tmpvar_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_13 = (ambient_14 * tmpvar_8);
  tmpvar_11 = vec3(0.0, 0.0, 0.0);
  vec3 specular_18;
  vec3 worldRefl_19;
  worldRefl_19 = tmpvar_10;
  vec3 worldPos_20;
  worldPos_20 = xlv_TEXCOORD8;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_21;
    tmpvar_21 = normalize(tmpvar_10);
    vec3 tmpvar_22;
    tmpvar_22 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_21);
    vec3 tmpvar_23;
    tmpvar_23 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_21);
    bvec3 tmpvar_24;
    tmpvar_24 = greaterThan (tmpvar_21, vec3(0.0, 0.0, 0.0));
    float tmpvar_25;
    if (tmpvar_24.x) {
      tmpvar_25 = tmpvar_22.x;
    } else {
      tmpvar_25 = tmpvar_23.x;
    };
    float tmpvar_26;
    if (tmpvar_24.y) {
      tmpvar_26 = tmpvar_22.y;
    } else {
      tmpvar_26 = tmpvar_23.y;
    };
    float tmpvar_27;
    if (tmpvar_24.z) {
      tmpvar_27 = tmpvar_22.z;
    } else {
      tmpvar_27 = tmpvar_23.z;
    };
    worldPos_20 = (xlv_TEXCOORD8 - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_19 = (worldPos_20 + (tmpvar_21 * min (
      min (tmpvar_25, tmpvar_26)
    , tmpvar_27)));
  };
  vec4 tmpvar_28;
  tmpvar_28.xyz = worldRefl_19;
  tmpvar_28.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_29;
  tmpvar_29 = textureCubeLod (unity_SpecCube0, worldRefl_19, tmpvar_28.w);
  vec3 tmpvar_30;
  tmpvar_30 = ((unity_SpecCube0_HDR.x * pow (tmpvar_29.w, unity_SpecCube0_HDR.y)) * tmpvar_29.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_31;
    worldRefl_31 = tmpvar_10;
    vec3 worldPos_32;
    worldPos_32 = xlv_TEXCOORD8;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_33;
      tmpvar_33 = normalize(tmpvar_10);
      vec3 tmpvar_34;
      tmpvar_34 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD8) / tmpvar_33);
      vec3 tmpvar_35;
      tmpvar_35 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD8) / tmpvar_33);
      bvec3 tmpvar_36;
      tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
      float tmpvar_37;
      if (tmpvar_36.x) {
        tmpvar_37 = tmpvar_34.x;
      } else {
        tmpvar_37 = tmpvar_35.x;
      };
      float tmpvar_38;
      if (tmpvar_36.y) {
        tmpvar_38 = tmpvar_34.y;
      } else {
        tmpvar_38 = tmpvar_35.y;
      };
      float tmpvar_39;
      if (tmpvar_36.z) {
        tmpvar_39 = tmpvar_34.z;
      } else {
        tmpvar_39 = tmpvar_35.z;
      };
      worldPos_32 = (xlv_TEXCOORD8 - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
        min (tmpvar_37, tmpvar_38)
      , tmpvar_39)));
    };
    vec4 tmpvar_40;
    tmpvar_40.xyz = worldRefl_31;
    tmpvar_40.w = ((tmpvar_9 * (1.7 - 
      (0.7 * tmpvar_9)
    )) * 6.0);
    vec4 tmpvar_41;
    tmpvar_41 = textureCubeLod (unity_SpecCube1, worldRefl_31, tmpvar_40.w);
    specular_18 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_41.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_41.xyz), tmpvar_30, unity_SpecCube0_BoxMin.www);
  } else {
    specular_18 = tmpvar_30;
  };
  tmpvar_11 = (specular_18 * tmpvar_8);
  vec3 viewDir_42;
  viewDir_42 = -(tmpvar_7);
  float surfaceReduction_43;
  float specularTerm_44;
  float tmpvar_45;
  tmpvar_45 = (1.0 - _Glossiness);
  vec3 tmpvar_46;
  vec3 inVec_47;
  inVec_47 = (_WorldSpaceLightPos0.xyz + viewDir_42);
  tmpvar_46 = (inVec_47 * inversesqrt(max (0.001, 
    dot (inVec_47, inVec_47)
  )));
  float tmpvar_48;
  tmpvar_48 = dot (tmpvar_6, viewDir_42);
  vec3 tmpvar_49;
  if ((tmpvar_48 < 0.0)) {
    tmpvar_49 = (tmpvar_6 + (viewDir_42 * (
      -(tmpvar_48)
     + 1e-05)));
  } else {
    tmpvar_49 = tmpvar_6;
  };
  float tmpvar_50;
  tmpvar_50 = max (0.0, dot (tmpvar_49, _WorldSpaceLightPos0.xyz));
  float tmpvar_51;
  tmpvar_51 = max (0.0, dot (tmpvar_49, tmpvar_46));
  float tmpvar_52;
  tmpvar_52 = max (0.0, dot (tmpvar_49, viewDir_42));
  float tmpvar_53;
  tmpvar_53 = max (0.0, dot (_WorldSpaceLightPos0.xyz, tmpvar_46));
  float tmpvar_54;
  tmpvar_54 = (tmpvar_45 * tmpvar_45);
  float tmpvar_55;
  tmpvar_55 = (tmpvar_45 * tmpvar_45);
  float tmpvar_56;
  tmpvar_56 = (tmpvar_55 * tmpvar_55);
  float tmpvar_57;
  tmpvar_57 = (((tmpvar_51 * tmpvar_51) * (tmpvar_56 - 1.0)) + 1.0);
  float x_58;
  x_58 = (1.0 - tmpvar_50);
  float x_59;
  x_59 = (1.0 - tmpvar_52);
  float tmpvar_60;
  tmpvar_60 = (0.5 + ((2.0 * tmpvar_53) * (tmpvar_53 * tmpvar_45)));
  float tmpvar_61;
  tmpvar_61 = ((1.0 + (
    (tmpvar_60 - 1.0)
   * 
    ((x_58 * x_58) * ((x_58 * x_58) * x_58))
  )) * (1.0 + (
    (tmpvar_60 - 1.0)
   * 
    ((x_59 * x_59) * ((x_59 * x_59) * x_59))
  )));
  float tmpvar_62;
  tmpvar_62 = (((2.0 / 
    (((tmpvar_50 * (
      (tmpvar_52 * (1.0 - tmpvar_54))
     + tmpvar_54)) + (tmpvar_52 * (
      (tmpvar_50 * (1.0 - tmpvar_54))
     + tmpvar_54))) + 1e-05)
  ) * (tmpvar_56 / 
    (((3.141593 * tmpvar_57) * tmpvar_57) + 1e-07)
  )) * 0.7853982);
  specularTerm_44 = tmpvar_62;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_44 = sqrt(max (0.0001, tmpvar_62));
  };
  float tmpvar_63;
  tmpvar_63 = max (0.0, (specularTerm_44 * tmpvar_50));
  specularTerm_44 = tmpvar_63;
  float tmpvar_64;
  tmpvar_64 = (tmpvar_61 * tmpvar_50);
  float tmpvar_65;
  tmpvar_65 = (tmpvar_45 * tmpvar_45);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    surfaceReduction_43 = (1.0 - ((0.28 * tmpvar_65) * tmpvar_45));
  } else {
    surfaceReduction_43 = (1.0/(((tmpvar_65 * tmpvar_65) + 1.0)));
  };
  float x_66;
  x_66 = (1.0 - tmpvar_53);
  float x_67;
  x_67 = (1.0 - tmpvar_52);
  vec3 tmpvar_68;
  tmpvar_68 = (((tmpvar_3 * 
    (tmpvar_13 + (tmpvar_12 * tmpvar_64))
  ) + (
    (tmpvar_63 * tmpvar_12)
   * 
    (tmpvar_4 + ((1.0 - tmpvar_4) * ((x_66 * x_66) * (
      (x_66 * x_66)
     * x_66))))
  )) + ((surfaceReduction_43 * tmpvar_11) * mix (tmpvar_4, vec3(
    clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)
  ), vec3(
    ((x_67 * x_67) * ((x_67 * x_67) * x_67))
  ))));
  vec4 tmpvar_69;
  tmpvar_69.w = 1.0;
  tmpvar_69.xyz = tmpvar_68;
  c_1.w = tmpvar_69.w;
  c_1.xyz = tmpvar_68;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_70;
  xlat_varoutput_70.xyz = c_1.xyz;
  xlat_varoutput_70.w = 1.0;
  gl_FragData[0] = xlat_varoutput_70;
}


#endif
"
}
SubProgram "metal " {
// Stats: 63 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 434
Matrix 192 [glstate_matrix_mvp]
Matrix 256 [_Object2World]
Matrix 320 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
VectorHalf 80 [unity_4LightAtten0] 4
VectorHalf 88 [unity_LightColor0] 4
VectorHalf 96 [unity_LightColor1] 4
VectorHalf 104 [unity_LightColor2] 4
VectorHalf 112 [unity_LightColor3] 4
VectorHalf 120 [unity_LightColor4] 4
VectorHalf 128 [unity_LightColor5] 4
VectorHalf 136 [unity_LightColor6] 4
VectorHalf 144 [unity_LightColor7] 4
VectorHalf 152 [unity_SHBr] 4
VectorHalf 160 [unity_SHBg] 4
VectorHalf 168 [unity_SHBb] 4
VectorHalf 176 [unity_SHC] 4
VectorHalf 384 [unity_ColorSpaceLuminance] 4
Vector 400 [_MainTex_ST]
Vector 416 [_DetailAlbedoMap_ST]
ScalarHalf 432 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  float4 unity_4LightPosX0;
  float4 unity_4LightPosY0;
  float4 unity_4LightPosZ0;
  half4 unity_4LightAtten0;
  half4 unity_LightColor[8];
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  float3 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_8 = tmpvar_9.xyz;
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_10;
  texcoord_10.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_11;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_12;
  float3 n_13;
  n_13 = (tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_12 = half3(n_13);
  float3 norm_14;
  norm_14 = float3(tmpvar_1);
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].x;
  v_15.y = _mtl_u._World2Object[1].x;
  v_15.z = _mtl_u._World2Object[2].x;
  v_15.w = _mtl_u._World2Object[3].x;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].y;
  v_16.y = _mtl_u._World2Object[1].y;
  v_16.z = _mtl_u._World2Object[2].y;
  v_16.w = _mtl_u._World2Object[3].y;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].z;
  v_17.y = _mtl_u._World2Object[1].z;
  v_17.z = _mtl_u._World2Object[2].z;
  v_17.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_18);
  float4 o_19;
  float4 tmpvar_20;
  tmpvar_20 = (tmpvar_4 * 0.5);
  float2 tmpvar_21;
  tmpvar_21.x = tmpvar_20.x;
  tmpvar_21.y = (tmpvar_20.y * _mtl_u._ProjectionParams.x);
  o_19.xy = (tmpvar_21 + tmpvar_20.w);
  o_19.zw = tmpvar_4.zw;
  half3 normalWorld_22;
  normalWorld_22 = half3(tmpvar_18);
  half4 ambientOrLightmapUV_23;
  ambientOrLightmapUV_23.w = half(0.0);
  float3 lightColor0_24;
  lightColor0_24 = float3(_mtl_u.unity_LightColor[0].xyz);
  float3 lightColor1_25;
  lightColor1_25 = float3(_mtl_u.unity_LightColor[1].xyz);
  float3 lightColor2_26;
  lightColor2_26 = float3(_mtl_u.unity_LightColor[2].xyz);
  float3 lightColor3_27;
  lightColor3_27 = float3(_mtl_u.unity_LightColor[3].xyz);
  float4 lightAttenSq_28;
  lightAttenSq_28 = float4(_mtl_u.unity_4LightAtten0);
  float3 normal_29;
  normal_29 = float3(normalWorld_22);
  float3 col_30;
  float4 ndotl_31;
  float4 lengthSq_32;
  float4 tmpvar_33;
  tmpvar_33 = (_mtl_u.unity_4LightPosX0 - tmpvar_9.x);
  float4 tmpvar_34;
  tmpvar_34 = (_mtl_u.unity_4LightPosY0 - tmpvar_9.y);
  float4 tmpvar_35;
  tmpvar_35 = (_mtl_u.unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_32 = (tmpvar_33 * tmpvar_33);
  lengthSq_32 = (lengthSq_32 + (tmpvar_34 * tmpvar_34));
  lengthSq_32 = (lengthSq_32 + (tmpvar_35 * tmpvar_35));
  ndotl_31 = (tmpvar_33 * normal_29.x);
  ndotl_31 = (ndotl_31 + (tmpvar_34 * normal_29.y));
  ndotl_31 = (ndotl_31 + (tmpvar_35 * normal_29.z));
  float4 tmpvar_36;
  tmpvar_36 = max (float4(0.0, 0.0, 0.0, 0.0), (ndotl_31 * rsqrt(lengthSq_32)));
  ndotl_31 = tmpvar_36;
  float4 tmpvar_37;
  tmpvar_37 = (tmpvar_36 * (1.0/((1.0 + 
    (lengthSq_32 * lightAttenSq_28)
  ))));
  col_30 = (lightColor0_24 * tmpvar_37.x);
  col_30 = (col_30 + (lightColor1_25 * tmpvar_37.y));
  col_30 = (col_30 + (lightColor2_26 * tmpvar_37.z));
  col_30 = (col_30 + (lightColor3_27 * tmpvar_37.w));
  ambientOrLightmapUV_23.xyz = half3(col_30);
  half3 ambient_38;
  ambient_38 = ambientOrLightmapUV_23.xyz;
  bool tmpvar_39;
  tmpvar_39 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_39) {
    ambient_38 = (ambientOrLightmapUV_23.xyz * ((ambientOrLightmapUV_23.xyz * 
      ((ambientOrLightmapUV_23.xyz * (half)0.305306) + (half)0.6821711)
    ) + (half)0.01252288));
  };
  half3 x1_40;
  half4 tmpvar_41;
  tmpvar_41 = (normalWorld_22.xyzz * normalWorld_22.yzzx);
  x1_40.x = dot (_mtl_u.unity_SHBr, tmpvar_41);
  x1_40.y = dot (_mtl_u.unity_SHBg, tmpvar_41);
  x1_40.z = dot (_mtl_u.unity_SHBb, tmpvar_41);
  ambient_38 = (ambient_38 + (x1_40 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_22.x * normalWorld_22.x) - (normalWorld_22.y * normalWorld_22.y))
  )));
  ambientOrLightmapUV_23.xyz = ambient_38;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_10;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_12;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_23;
  _mtl_o.xlv_TEXCOORD6 = o_19;
  _mtl_o.xlv_TEXCOORD8 = tmpvar_8;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat5 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    vs_TEXCOORD8.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat5 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat4 = inversesqrt(u_xlat3);
    u_xlat3 = u_xlat3 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat3 * u_xlat1;
    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlatb19 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
vec3 u_xlat16;
float u_xlat17;
float u_xlat28;
float u_xlat29;
float u_xlat30;
float u_xlat39;
float u_xlat40;
bool u_xlatb41;
float u_xlat42;
float u_xlat44;
mediump float u_xlat16_44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
float u_xlat46;
bool u_xlatb46;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat39 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat42 = (-_OcclusionStrength) + 1.0;
    u_xlat42 = u_xlat10_5.y * _OcclusionStrength + u_xlat42;
    u_xlat17 = (-_Glossiness) + 1.0;
    u_xlat30 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat30)) + u_xlat3.xyz;
    u_xlat4.xzw = u_xlat10_4.xxx * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat6.x = dot(unity_SHAr, u_xlat2);
    u_xlat6.y = dot(unity_SHAg, u_xlat2);
    u_xlat6.z = dot(unity_SHAb, u_xlat2);
    u_xlat6.xyz = u_xlat6.xyz + vs_TEXCOORD5.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb41 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat7.xyz = log2(u_xlat6.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = (bool(u_xlatb41)) ? u_xlat7.xyz : u_xlat6.xyz;
    u_xlatb44 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb44){
        u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat7.xyz = vec3(u_xlat44) * u_xlat5.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat44 = min(u_xlat8.y, u_xlat8.x);
        u_xlat44 = min(u_xlat8.z, u_xlat44);
        u_xlat8.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat44) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat44 = (-u_xlat17) * 0.699999988 + 1.70000005;
    u_xlat44 = u_xlat17 * u_xlat44;
    u_xlat44 = u_xlat44 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat44);
    u_xlat16_45 = log2(u_xlat10_7.w);
    u_xlat45 = u_xlat16_45 * unity_SpecCube0_HDR.y;
    u_xlat45 = exp2(u_xlat45);
    u_xlat45 = u_xlat45 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat45);
    u_xlatb46 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb46){
        u_xlatb46 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb46){
            u_xlat46 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat46 = inversesqrt(u_xlat46);
            u_xlat9.xyz = u_xlat5.xyz * vec3(u_xlat46);
            u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat46 = min(u_xlat10.y, u_xlat10.x);
            u_xlat46 = min(u_xlat10.z, u_xlat46);
            u_xlat10.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat46) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat44);
        u_xlat16_44 = log2(u_xlat10_5.w);
        u_xlat44 = u_xlat16_44 * unity_SpecCube1_HDR.y;
        u_xlat44 = exp2(u_xlat44);
        u_xlat44 = u_xlat44 * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * vec3(u_xlat44);
        u_xlat7.xyz = vec3(u_xlat45) * u_xlat10_7.xyz + (-u_xlat5.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = vec3(u_xlat42) * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlatb44 = u_xlat40<0.0;
    u_xlat40 = (-u_xlat40) + 9.99999975e-06;
    u_xlat8.xyz = (-u_xlat3.xyz) * vec3(u_xlat40) + u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb44)) ? u_xlat8.xyz : u_xlat2.xyz;
    u_xlat40 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat44 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat44 = max(u_xlat44, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat7.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat28 = u_xlat17 * u_xlat17;
    u_xlat3.x = (-u_xlat17) * u_xlat17 + 1.0;
    u_xlat16.x = u_xlat2.x * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat40 * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat16.x + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat16.x = u_xlat28 * u_xlat28;
    u_xlat29 = u_xlat44 * u_xlat44;
    u_xlat7.xy = vec2(u_xlat28) * vec2(u_xlat28) + vec2(-1.0, 1.0);
    u_xlat29 = u_xlat29 * u_xlat7.x + 1.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat29 * 3.14159274 + 1.00000001e-07;
    u_xlat16.x = u_xlat16.x / u_xlat29;
    u_xlat29 = (-u_xlat40) + 1.0;
    u_xlat44 = u_xlat29 * u_xlat29;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat29 = u_xlat29 * u_xlat44;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat44 = u_xlat2.x * u_xlat2.x;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat2.x = u_xlat2.x * u_xlat44;
    u_xlat44 = u_xlat2.y * u_xlat2.y;
    u_xlat44 = dot(vec2(u_xlat44), vec2(u_xlat17));
    u_xlat44 = u_xlat44 + -0.5;
    u_xlat29 = u_xlat44 * u_xlat29 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat2.x + 1.0;
    u_xlat29 = u_xlat29 * u_xlat44;
    u_xlat3.x = u_xlat16.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.785398185;
    u_xlat16.x = max(u_xlat3.x, 9.99999975e-05);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat3.x = (u_xlatb41) ? u_xlat16.x : u_xlat3.x;
    u_xlat3.x = u_xlat40 * u_xlat3.x;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat40 = u_xlat40 * u_xlat29;
    u_xlat28 = u_xlat28 * u_xlat17;
    u_xlat28 = (-u_xlat28) * 0.280000001 + 1.0;
    u_xlat16.x = float(1.0) / u_xlat7.y;
    u_xlat28 = (u_xlatb41) ? u_xlat28 : u_xlat16.x;
    u_xlat39 = (-u_xlat39) + _Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat4.xzw;
    u_xlat16.xyz = u_xlat6.xyz * vec3(u_xlat42) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xzw * u_xlat3.xxx;
    u_xlat40 = (-u_xlat2.y) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16.xyz + u_xlat4.xyz;
    u_xlat15.xyz = u_xlat5.xyz * vec3(u_xlat28);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat15.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 179 math, 4 textures, 13 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [_OcclusionMap] 2D 3
ConstBuffer "$Globals" 190
VectorHalf 0 [_WorldSpaceLightPos0] 4
VectorHalf 8 [unity_SHAr] 4
VectorHalf 16 [unity_SHAg] 4
VectorHalf 24 [unity_SHAb] 4
Vector 32 [unity_SpecCube0_BoxMax]
Vector 48 [unity_SpecCube0_BoxMin]
Vector 64 [unity_SpecCube0_ProbePosition]
VectorHalf 80 [unity_SpecCube0_HDR] 4
Vector 96 [unity_SpecCube1_BoxMax]
Vector 112 [unity_SpecCube1_BoxMin]
Vector 128 [unity_SpecCube1_ProbePosition]
VectorHalf 144 [unity_SpecCube1_HDR] 4
VectorHalf 152 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 160 [unity_ColorSpaceLuminance] 4
VectorHalf 168 [_LightColor0] 4
VectorHalf 176 [_Color] 4
ScalarHalf 184 [_Metallic]
ScalarHalf 186 [_Glossiness]
ScalarHalf 188 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture2d<half> _MainTex [[texture(2)]], sampler _mtlsmp__MainTex [[sampler(2)]]
  ,   texture2d<half> _OcclusionMap [[texture(3)]], sampler _mtlsmp__OcclusionMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 i_posWorld_2;
  i_posWorld_2 = half3(_mtl_i.xlv_TEXCOORD8);
  half4 tmpvar_3;
  tmpvar_3 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_3.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  half tmpvar_7;
  tmpvar_7 = (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * tmpvar_7);
  half3 tmpvar_8;
  tmpvar_8 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_9;
  tmpvar_9 = normalize(_mtl_i.xlv_TEXCOORD1);
  half3 tmpvar_10;
  tmpvar_10 = _mtl_u._LightColor0.xyz;
  half occ_11;
  half tmpvar_12;
  tmpvar_12 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_11 = tmpvar_12;
  half tmpvar_13;
  tmpvar_13 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_11 * _mtl_u._OcclusionStrength));
  float3 tmpvar_14;
  float4 tmpvar_15;
  float4 tmpvar_16;
  tmpvar_14 = float3(i_posWorld_2);
  tmpvar_15 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_16 = float4(_mtl_u.unity_SpecCube1_HDR);
  half tmpvar_17;
  tmpvar_17 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_18;
  tmpvar_18 = (tmpvar_9 - ((half)2.0 * (
    dot (tmpvar_8, tmpvar_9)
   * tmpvar_8)));
  half3 tmpvar_19;
  half3 tmpvar_20;
  tmpvar_20 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_21;
  half4 tmpvar_22;
  tmpvar_22.w = half(1.0);
  tmpvar_22.xyz = tmpvar_8;
  half3 x_23;
  x_23.x = dot (_mtl_u.unity_SHAr, tmpvar_22);
  x_23.y = dot (_mtl_u.unity_SHAg, tmpvar_22);
  x_23.z = dot (_mtl_u.unity_SHAb, tmpvar_22);
  half3 tmpvar_24;
  tmpvar_24 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_23));
  ambient_21 = tmpvar_24;
  bool tmpvar_25;
  tmpvar_25 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_25) {
    ambient_21 = max ((((half)1.055 * 
      pow (max (tmpvar_24, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_20 = (ambient_21 * tmpvar_13);
  tmpvar_19 = half3(float3(0.0, 0.0, 0.0));
  half3 specular_26;
  half3 worldRefl_27;
  worldRefl_27 = tmpvar_18;
  float3 worldPos_28;
  worldPos_28 = tmpvar_14;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_29;
    half3 rbmax_30;
    half3 tmpvar_31;
    tmpvar_31 = normalize(tmpvar_18);
    float3 tmpvar_32;
    tmpvar_32 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - tmpvar_14) / (float3)tmpvar_31);
    rbmax_30 = half3(tmpvar_32);
    float3 tmpvar_33;
    tmpvar_33 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - tmpvar_14) / (float3)tmpvar_31);
    rbmin_29 = half3(tmpvar_33);
    bool3 tmpvar_34;
    tmpvar_34 = (tmpvar_31 > (half3)float3(0.0, 0.0, 0.0));
    half tmpvar_35;
    if (tmpvar_34.x) {
      tmpvar_35 = rbmax_30.x;
    } else {
      tmpvar_35 = rbmin_29.x;
    };
    half tmpvar_36;
    if (tmpvar_34.y) {
      tmpvar_36 = rbmax_30.y;
    } else {
      tmpvar_36 = rbmin_29.y;
    };
    half tmpvar_37;
    if (tmpvar_34.z) {
      tmpvar_37 = rbmax_30.z;
    } else {
      tmpvar_37 = rbmin_29.z;
    };
    worldPos_28 = (tmpvar_14 - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_27 = half3((worldPos_28 + (float3)(tmpvar_31 * min (
      min (tmpvar_35, tmpvar_36)
    , tmpvar_37))));
  };
  half4 hdr_38;
  hdr_38 = half4(tmpvar_15);
  half4 tmpvar_39;
  tmpvar_39.xyz = worldRefl_27;
  tmpvar_39.w = ((tmpvar_17 * ((half)1.7 - 
    ((half)0.7 * tmpvar_17)
  )) * (half)6.0);
  half4 tmpvar_40;
  tmpvar_40 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_27), level(tmpvar_39.w));
  half4 tmpvar_41;
  tmpvar_41 = tmpvar_40;
  half3 tmpvar_42;
  tmpvar_42 = ((hdr_38.x * pow (tmpvar_41.w, hdr_38.y)) * tmpvar_41.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_43;
    worldRefl_43 = tmpvar_18;
    float3 worldPos_44;
    worldPos_44 = tmpvar_14;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_45;
      half3 rbmax_46;
      half3 tmpvar_47;
      tmpvar_47 = normalize(tmpvar_18);
      float3 tmpvar_48;
      tmpvar_48 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - tmpvar_14) / (float3)tmpvar_47);
      rbmax_46 = half3(tmpvar_48);
      float3 tmpvar_49;
      tmpvar_49 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - tmpvar_14) / (float3)tmpvar_47);
      rbmin_45 = half3(tmpvar_49);
      bool3 tmpvar_50;
      tmpvar_50 = (tmpvar_47 > (half3)float3(0.0, 0.0, 0.0));
      half tmpvar_51;
      if (tmpvar_50.x) {
        tmpvar_51 = rbmax_46.x;
      } else {
        tmpvar_51 = rbmin_45.x;
      };
      half tmpvar_52;
      if (tmpvar_50.y) {
        tmpvar_52 = rbmax_46.y;
      } else {
        tmpvar_52 = rbmin_45.y;
      };
      half tmpvar_53;
      if (tmpvar_50.z) {
        tmpvar_53 = rbmax_46.z;
      } else {
        tmpvar_53 = rbmin_45.z;
      };
      worldPos_44 = (tmpvar_14 - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = half3((worldPos_44 + (float3)(tmpvar_47 * min (
        min (tmpvar_51, tmpvar_52)
      , tmpvar_53))));
    };
    half4 hdr_54;
    hdr_54 = half4(tmpvar_16);
    half4 tmpvar_55;
    tmpvar_55.xyz = worldRefl_43;
    tmpvar_55.w = ((tmpvar_17 * ((half)1.7 - 
      ((half)0.7 * tmpvar_17)
    )) * (half)6.0);
    half4 tmpvar_56;
    tmpvar_56 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_43), level(tmpvar_55.w));
    half4 tmpvar_57;
    tmpvar_57 = tmpvar_56;
    half3 tmpvar_58;
    tmpvar_58 = ((hdr_54.x * pow (tmpvar_57.w, hdr_54.y)) * tmpvar_57.xyz);
    float3 tmpvar_59;
    tmpvar_59 = mix ((float3)tmpvar_58, (float3)tmpvar_42, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_26 = half3(tmpvar_59);
  } else {
    specular_26 = tmpvar_42;
  };
  tmpvar_19 = (specular_26 * tmpvar_13);
  half3 viewDir_60;
  viewDir_60 = -(tmpvar_9);
  half surfaceReduction_61;
  half specularTerm_62;
  half tmpvar_63;
  tmpvar_63 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_64;
  half3 inVec_65;
  inVec_65 = (_mtl_u._WorldSpaceLightPos0.xyz + viewDir_60);
  tmpvar_64 = (inVec_65 * rsqrt(max ((half)0.001, 
    dot (inVec_65, inVec_65)
  )));
  half tmpvar_66;
  tmpvar_66 = dot (tmpvar_8, viewDir_60);
  half3 tmpvar_67;
  if ((tmpvar_66 < (half)0.0)) {
    tmpvar_67 = (tmpvar_8 + (viewDir_60 * (
      -(tmpvar_66)
     + (half)1e-05)));
  } else {
    tmpvar_67 = tmpvar_8;
  };
  half tmpvar_68;
  tmpvar_68 = max ((half)0.0, dot (tmpvar_67, _mtl_u._WorldSpaceLightPos0.xyz));
  half tmpvar_69;
  tmpvar_69 = max ((half)0.0, dot (tmpvar_67, tmpvar_64));
  half tmpvar_70;
  tmpvar_70 = max ((half)0.0, dot (tmpvar_67, viewDir_60));
  half tmpvar_71;
  tmpvar_71 = max ((half)0.0, dot (_mtl_u._WorldSpaceLightPos0.xyz, tmpvar_64));
  half tmpvar_72;
  tmpvar_72 = (tmpvar_63 * tmpvar_63);
  half tmpvar_73;
  tmpvar_73 = (tmpvar_63 * tmpvar_63);
  half tmpvar_74;
  tmpvar_74 = (tmpvar_73 * tmpvar_73);
  half tmpvar_75;
  tmpvar_75 = (((tmpvar_69 * tmpvar_69) * (tmpvar_74 - (half)1.0)) + (half)1.0);
  half x_76;
  x_76 = ((half)1.0 - tmpvar_68);
  half x_77;
  x_77 = ((half)1.0 - tmpvar_70);
  half tmpvar_78;
  tmpvar_78 = ((half)0.5 + (((half)2.0 * tmpvar_71) * (tmpvar_71 * tmpvar_63)));
  half tmpvar_79;
  tmpvar_79 = (((half)1.0 + (
    (tmpvar_78 - (half)1.0)
   * 
    ((x_76 * x_76) * ((x_76 * x_76) * x_76))
  )) * ((half)1.0 + (
    (tmpvar_78 - (half)1.0)
   * 
    ((x_77 * x_77) * ((x_77 * x_77) * x_77))
  )));
  half tmpvar_80;
  tmpvar_80 = ((((half)2.0 / 
    (((tmpvar_68 * (
      (tmpvar_70 * ((half)1.0 - tmpvar_72))
     + tmpvar_72)) + (tmpvar_70 * (
      (tmpvar_68 * ((half)1.0 - tmpvar_72))
     + tmpvar_72))) + (half)1e-05)
  ) * (tmpvar_74 / 
    ((((half)3.141593 * tmpvar_75) * tmpvar_75) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_62 = tmpvar_80;
  bool tmpvar_81;
  tmpvar_81 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_81) {
    specularTerm_62 = sqrt(max ((half)0.0001, tmpvar_80));
  };
  half tmpvar_82;
  tmpvar_82 = max ((half)0.0, (specularTerm_62 * tmpvar_68));
  specularTerm_62 = tmpvar_82;
  half tmpvar_83;
  tmpvar_83 = (tmpvar_79 * tmpvar_68);
  half tmpvar_84;
  tmpvar_84 = (tmpvar_63 * tmpvar_63);
  bool tmpvar_85;
  tmpvar_85 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_85) {
    surfaceReduction_61 = ((half)1.0 - (((half)0.28 * tmpvar_84) * tmpvar_63));
  } else {
    surfaceReduction_61 = ((half)1.0/(((tmpvar_84 * tmpvar_84) + (half)1.0)));
  };
  half x_86;
  x_86 = ((half)1.0 - tmpvar_71);
  half x_87;
  x_87 = ((half)1.0 - tmpvar_70);
  half3 tmpvar_88;
  tmpvar_88 = (((tmpvar_5 * 
    (tmpvar_20 + (tmpvar_10 * tmpvar_83))
  ) + (
    (tmpvar_82 * tmpvar_10)
   * 
    (tmpvar_6 + (((half)1.0 - tmpvar_6) * ((x_86 * x_86) * (
      (x_86 * x_86)
     * x_86))))
  )) + ((surfaceReduction_61 * tmpvar_19) * mix (tmpvar_6, half3(
    clamp ((_mtl_u._Glossiness + ((half)1.0 - tmpvar_7)), (half)0.0, (half)1.0)
  ), half3(
    ((x_87 * x_87) * ((x_87 * x_87) * x_87))
  ))));
  half4 tmpvar_89;
  tmpvar_89.w = half(1.0);
  tmpvar_89.xyz = tmpvar_88;
  c_1.w = tmpvar_89.w;
  c_1.xyz = tmpvar_88;
  c_1.xyz = c_1.xyz;
  half4 xlat_varoutput_90;
  xlat_varoutput_90.xyz = c_1.xyz;
  xlat_varoutput_90.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_90;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 180 math, 5 textures, 13 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [_OcclusionMap] 2D 3
SetTexture 4 [_ShadowMapTexture] 2D 4
ConstBuffer "$Globals" 190
VectorHalf 0 [_WorldSpaceLightPos0] 4
VectorHalf 8 [unity_SHAr] 4
VectorHalf 16 [unity_SHAg] 4
VectorHalf 24 [unity_SHAb] 4
Vector 32 [unity_SpecCube0_BoxMax]
Vector 48 [unity_SpecCube0_BoxMin]
Vector 64 [unity_SpecCube0_ProbePosition]
VectorHalf 80 [unity_SpecCube0_HDR] 4
Vector 96 [unity_SpecCube1_BoxMax]
Vector 112 [unity_SpecCube1_BoxMin]
Vector 128 [unity_SpecCube1_ProbePosition]
VectorHalf 144 [unity_SpecCube1_HDR] 4
VectorHalf 152 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 160 [unity_ColorSpaceLuminance] 4
VectorHalf 168 [_LightColor0] 4
VectorHalf 176 [_Color] 4
ScalarHalf 184 [_Metallic]
ScalarHalf 186 [_Glossiness]
ScalarHalf 188 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture2d<half> _MainTex [[texture(2)]], sampler _mtlsmp__MainTex [[sampler(2)]]
  ,   texture2d<half> _OcclusionMap [[texture(3)]], sampler _mtlsmp__OcclusionMap [[sampler(3)]]
  ,   texture2d<half> _ShadowMapTexture [[texture(4)]], sampler _mtlsmp__ShadowMapTexture [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half atten_2;
  half3 i_posWorld_3;
  i_posWorld_3 = half3(_mtl_i.xlv_TEXCOORD8);
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_5;
  tmpvar_5 = (_mtl_u._Color.xyz * tmpvar_4.xyz);
  half3 tmpvar_6;
  half3 tmpvar_7;
  tmpvar_7 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_5, half3(_mtl_u._Metallic));
  half tmpvar_8;
  tmpvar_8 = (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w));
  tmpvar_6 = (tmpvar_5 * tmpvar_8);
  half3 tmpvar_9;
  tmpvar_9 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_10;
  tmpvar_10 = normalize(_mtl_i.xlv_TEXCOORD1);
  half3 tmpvar_11;
  tmpvar_11 = _mtl_u._LightColor0.xyz;
  half tmpvar_12;
  tmpvar_12 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, ((float2)(_mtl_i.xlv_TEXCOORD6).xy / (float)(_mtl_i.xlv_TEXCOORD6).w)).x;
  atten_2 = tmpvar_12;
  half occ_13;
  half tmpvar_14;
  tmpvar_14 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_13 = tmpvar_14;
  half tmpvar_15;
  tmpvar_15 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_13 * _mtl_u._OcclusionStrength));
  float3 tmpvar_16;
  float4 tmpvar_17;
  float4 tmpvar_18;
  tmpvar_16 = float3(i_posWorld_3);
  tmpvar_17 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_18 = float4(_mtl_u.unity_SpecCube1_HDR);
  half tmpvar_19;
  tmpvar_19 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_20;
  tmpvar_20 = (tmpvar_10 - ((half)2.0 * (
    dot (tmpvar_9, tmpvar_10)
   * tmpvar_9)));
  half3 tmpvar_21;
  half3 tmpvar_22;
  half3 tmpvar_23;
  tmpvar_23 = half3(float3(0.0, 0.0, 0.0));
  tmpvar_22 = (tmpvar_11 * atten_2);
  half3 ambient_24;
  half4 tmpvar_25;
  tmpvar_25.w = half(1.0);
  tmpvar_25.xyz = tmpvar_9;
  half3 x_26;
  x_26.x = dot (_mtl_u.unity_SHAr, tmpvar_25);
  x_26.y = dot (_mtl_u.unity_SHAg, tmpvar_25);
  x_26.z = dot (_mtl_u.unity_SHAb, tmpvar_25);
  half3 tmpvar_27;
  tmpvar_27 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_26));
  ambient_24 = tmpvar_27;
  bool tmpvar_28;
  tmpvar_28 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_28) {
    ambient_24 = max ((((half)1.055 * 
      pow (max (tmpvar_27, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_23 = (ambient_24 * tmpvar_15);
  tmpvar_21 = half3(float3(0.0, 0.0, 0.0));
  half3 specular_29;
  half3 worldRefl_30;
  worldRefl_30 = tmpvar_20;
  float3 worldPos_31;
  worldPos_31 = tmpvar_16;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_32;
    half3 rbmax_33;
    half3 tmpvar_34;
    tmpvar_34 = normalize(tmpvar_20);
    float3 tmpvar_35;
    tmpvar_35 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - tmpvar_16) / (float3)tmpvar_34);
    rbmax_33 = half3(tmpvar_35);
    float3 tmpvar_36;
    tmpvar_36 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - tmpvar_16) / (float3)tmpvar_34);
    rbmin_32 = half3(tmpvar_36);
    bool3 tmpvar_37;
    tmpvar_37 = (tmpvar_34 > (half3)float3(0.0, 0.0, 0.0));
    half tmpvar_38;
    if (tmpvar_37.x) {
      tmpvar_38 = rbmax_33.x;
    } else {
      tmpvar_38 = rbmin_32.x;
    };
    half tmpvar_39;
    if (tmpvar_37.y) {
      tmpvar_39 = rbmax_33.y;
    } else {
      tmpvar_39 = rbmin_32.y;
    };
    half tmpvar_40;
    if (tmpvar_37.z) {
      tmpvar_40 = rbmax_33.z;
    } else {
      tmpvar_40 = rbmin_32.z;
    };
    worldPos_31 = (tmpvar_16 - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_30 = half3((worldPos_31 + (float3)(tmpvar_34 * min (
      min (tmpvar_38, tmpvar_39)
    , tmpvar_40))));
  };
  half4 hdr_41;
  hdr_41 = half4(tmpvar_17);
  half4 tmpvar_42;
  tmpvar_42.xyz = worldRefl_30;
  tmpvar_42.w = ((tmpvar_19 * ((half)1.7 - 
    ((half)0.7 * tmpvar_19)
  )) * (half)6.0);
  half4 tmpvar_43;
  tmpvar_43 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_30), level(tmpvar_42.w));
  half4 tmpvar_44;
  tmpvar_44 = tmpvar_43;
  half3 tmpvar_45;
  tmpvar_45 = ((hdr_41.x * pow (tmpvar_44.w, hdr_41.y)) * tmpvar_44.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_46;
    worldRefl_46 = tmpvar_20;
    float3 worldPos_47;
    worldPos_47 = tmpvar_16;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_48;
      half3 rbmax_49;
      half3 tmpvar_50;
      tmpvar_50 = normalize(tmpvar_20);
      float3 tmpvar_51;
      tmpvar_51 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - tmpvar_16) / (float3)tmpvar_50);
      rbmax_49 = half3(tmpvar_51);
      float3 tmpvar_52;
      tmpvar_52 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - tmpvar_16) / (float3)tmpvar_50);
      rbmin_48 = half3(tmpvar_52);
      bool3 tmpvar_53;
      tmpvar_53 = (tmpvar_50 > (half3)float3(0.0, 0.0, 0.0));
      half tmpvar_54;
      if (tmpvar_53.x) {
        tmpvar_54 = rbmax_49.x;
      } else {
        tmpvar_54 = rbmin_48.x;
      };
      half tmpvar_55;
      if (tmpvar_53.y) {
        tmpvar_55 = rbmax_49.y;
      } else {
        tmpvar_55 = rbmin_48.y;
      };
      half tmpvar_56;
      if (tmpvar_53.z) {
        tmpvar_56 = rbmax_49.z;
      } else {
        tmpvar_56 = rbmin_48.z;
      };
      worldPos_47 = (tmpvar_16 - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_46 = half3((worldPos_47 + (float3)(tmpvar_50 * min (
        min (tmpvar_54, tmpvar_55)
      , tmpvar_56))));
    };
    half4 hdr_57;
    hdr_57 = half4(tmpvar_18);
    half4 tmpvar_58;
    tmpvar_58.xyz = worldRefl_46;
    tmpvar_58.w = ((tmpvar_19 * ((half)1.7 - 
      ((half)0.7 * tmpvar_19)
    )) * (half)6.0);
    half4 tmpvar_59;
    tmpvar_59 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_46), level(tmpvar_58.w));
    half4 tmpvar_60;
    tmpvar_60 = tmpvar_59;
    half3 tmpvar_61;
    tmpvar_61 = ((hdr_57.x * pow (tmpvar_60.w, hdr_57.y)) * tmpvar_60.xyz);
    float3 tmpvar_62;
    tmpvar_62 = mix ((float3)tmpvar_61, (float3)tmpvar_45, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_29 = half3(tmpvar_62);
  } else {
    specular_29 = tmpvar_45;
  };
  tmpvar_21 = (specular_29 * tmpvar_15);
  half3 viewDir_63;
  viewDir_63 = -(tmpvar_10);
  half surfaceReduction_64;
  half specularTerm_65;
  half tmpvar_66;
  tmpvar_66 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_67;
  half3 inVec_68;
  inVec_68 = (_mtl_u._WorldSpaceLightPos0.xyz + viewDir_63);
  tmpvar_67 = (inVec_68 * rsqrt(max ((half)0.001, 
    dot (inVec_68, inVec_68)
  )));
  half tmpvar_69;
  tmpvar_69 = dot (tmpvar_9, viewDir_63);
  half3 tmpvar_70;
  if ((tmpvar_69 < (half)0.0)) {
    tmpvar_70 = (tmpvar_9 + (viewDir_63 * (
      -(tmpvar_69)
     + (half)1e-05)));
  } else {
    tmpvar_70 = tmpvar_9;
  };
  half tmpvar_71;
  tmpvar_71 = max ((half)0.0, dot (tmpvar_70, _mtl_u._WorldSpaceLightPos0.xyz));
  half tmpvar_72;
  tmpvar_72 = max ((half)0.0, dot (tmpvar_70, tmpvar_67));
  half tmpvar_73;
  tmpvar_73 = max ((half)0.0, dot (tmpvar_70, viewDir_63));
  half tmpvar_74;
  tmpvar_74 = max ((half)0.0, dot (_mtl_u._WorldSpaceLightPos0.xyz, tmpvar_67));
  half tmpvar_75;
  tmpvar_75 = (tmpvar_66 * tmpvar_66);
  half tmpvar_76;
  tmpvar_76 = (tmpvar_66 * tmpvar_66);
  half tmpvar_77;
  tmpvar_77 = (tmpvar_76 * tmpvar_76);
  half tmpvar_78;
  tmpvar_78 = (((tmpvar_72 * tmpvar_72) * (tmpvar_77 - (half)1.0)) + (half)1.0);
  half x_79;
  x_79 = ((half)1.0 - tmpvar_71);
  half x_80;
  x_80 = ((half)1.0 - tmpvar_73);
  half tmpvar_81;
  tmpvar_81 = ((half)0.5 + (((half)2.0 * tmpvar_74) * (tmpvar_74 * tmpvar_66)));
  half tmpvar_82;
  tmpvar_82 = (((half)1.0 + (
    (tmpvar_81 - (half)1.0)
   * 
    ((x_79 * x_79) * ((x_79 * x_79) * x_79))
  )) * ((half)1.0 + (
    (tmpvar_81 - (half)1.0)
   * 
    ((x_80 * x_80) * ((x_80 * x_80) * x_80))
  )));
  half tmpvar_83;
  tmpvar_83 = ((((half)2.0 / 
    (((tmpvar_71 * (
      (tmpvar_73 * ((half)1.0 - tmpvar_75))
     + tmpvar_75)) + (tmpvar_73 * (
      (tmpvar_71 * ((half)1.0 - tmpvar_75))
     + tmpvar_75))) + (half)1e-05)
  ) * (tmpvar_77 / 
    ((((half)3.141593 * tmpvar_78) * tmpvar_78) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_65 = tmpvar_83;
  bool tmpvar_84;
  tmpvar_84 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_84) {
    specularTerm_65 = sqrt(max ((half)0.0001, tmpvar_83));
  };
  half tmpvar_85;
  tmpvar_85 = max ((half)0.0, (specularTerm_65 * tmpvar_71));
  specularTerm_65 = tmpvar_85;
  half tmpvar_86;
  tmpvar_86 = (tmpvar_82 * tmpvar_71);
  half tmpvar_87;
  tmpvar_87 = (tmpvar_66 * tmpvar_66);
  bool tmpvar_88;
  tmpvar_88 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_88) {
    surfaceReduction_64 = ((half)1.0 - (((half)0.28 * tmpvar_87) * tmpvar_66));
  } else {
    surfaceReduction_64 = ((half)1.0/(((tmpvar_87 * tmpvar_87) + (half)1.0)));
  };
  half x_89;
  x_89 = ((half)1.0 - tmpvar_74);
  half x_90;
  x_90 = ((half)1.0 - tmpvar_73);
  half3 tmpvar_91;
  tmpvar_91 = (((tmpvar_6 * 
    (tmpvar_23 + (tmpvar_22 * tmpvar_86))
  ) + (
    (tmpvar_85 * tmpvar_22)
   * 
    (tmpvar_7 + (((half)1.0 - tmpvar_7) * ((x_89 * x_89) * (
      (x_89 * x_89)
     * x_89))))
  )) + ((surfaceReduction_64 * tmpvar_21) * mix (tmpvar_7, half3(
    clamp ((_mtl_u._Glossiness + ((half)1.0 - tmpvar_8)), (half)0.0, (half)1.0)
  ), half3(
    ((x_90 * x_90) * ((x_90 * x_90) * x_90))
  ))));
  half4 tmpvar_92;
  tmpvar_92.w = half(1.0);
  tmpvar_92.xyz = tmpvar_91;
  c_1.w = tmpvar_92.w;
  c_1.xyz = tmpvar_91;
  c_1.xyz = c_1.xyz;
  half4 xlat_varoutput_93;
  xlat_varoutput_93.xyz = c_1.xyz;
  xlat_varoutput_93.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_93;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
}
 }


 // Stats for Vertex shader:
 //       metal : 25 avg math (23..28), 1 branch
 //      opengl : 102 avg math (94..113), 3 avg texture (1..7), 2 avg branch (2..6)
 // Stats for Fragment shader:
 //       metal : 102 avg math (94..113), 3 avg texture (1..7), 2 avg branch (2..6)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 129312
Program "vp" {
SubProgram "opengl " {
// Stats: 97 math, 2 textures, 2 branches
Keywords { "POINT" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(tmpvar_5);
  tmpvar_6 = (_LightColor0.xyz * texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5))).w);
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_9;
  float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  vec3 tmpvar_11;
  vec3 inVec_12;
  inVec_12 = (tmpvar_7 + viewDir_8);
  tmpvar_11 = (inVec_12 * inversesqrt(max (0.001, 
    dot (inVec_12, inVec_12)
  )));
  float tmpvar_13;
  tmpvar_13 = dot (tmpvar_4, viewDir_8);
  vec3 tmpvar_14;
  if ((tmpvar_13 < 0.0)) {
    tmpvar_14 = (tmpvar_4 + (viewDir_8 * (
      -(tmpvar_13)
     + 1e-05)));
  } else {
    tmpvar_14 = tmpvar_4;
  };
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_14, tmpvar_7));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_14, tmpvar_11));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_14, viewDir_8));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_11));
  float tmpvar_19;
  tmpvar_19 = (tmpvar_10 * tmpvar_10);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_10 * tmpvar_10);
  float tmpvar_21;
  tmpvar_21 = (tmpvar_20 * tmpvar_20);
  float tmpvar_22;
  tmpvar_22 = (((tmpvar_16 * tmpvar_16) * (tmpvar_21 - 1.0)) + 1.0);
  float x_23;
  x_23 = (1.0 - tmpvar_15);
  float x_24;
  x_24 = (1.0 - tmpvar_17);
  float tmpvar_25;
  tmpvar_25 = (0.5 + ((2.0 * tmpvar_18) * (tmpvar_18 * tmpvar_10)));
  float tmpvar_26;
  tmpvar_26 = ((1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )) * (1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_24 * x_24) * ((x_24 * x_24) * x_24))
  )));
  float tmpvar_27;
  tmpvar_27 = (((2.0 / 
    (((tmpvar_15 * (
      (tmpvar_17 * (1.0 - tmpvar_19))
     + tmpvar_19)) + (tmpvar_17 * (
      (tmpvar_15 * (1.0 - tmpvar_19))
     + tmpvar_19))) + 1e-05)
  ) * (tmpvar_21 / 
    (((3.141593 * tmpvar_22) * tmpvar_22) + 1e-07)
  )) * 0.7853982);
  specularTerm_9 = tmpvar_27;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_9 = sqrt(max (0.0001, tmpvar_27));
  };
  float tmpvar_28;
  tmpvar_28 = max (0.0, (specularTerm_9 * tmpvar_15));
  specularTerm_9 = tmpvar_28;
  float x_29;
  x_29 = (1.0 - tmpvar_18);
  vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_26 * tmpvar_15)
  )) + ((tmpvar_28 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_29 * x_29) * ((x_29 * x_29) * x_29)))
  )));
  vec4 xlat_varoutput_31;
  xlat_varoutput_31.xyz = tmpvar_30.xyz;
  xlat_varoutput_31.w = 1.0;
  gl_FragData[0] = xlat_varoutput_31;
}


#endif
"
}
SubProgram "metal " {
// Stats: 25 math, 1 branches
Keywords { "POINT" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 352
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Matrix 288 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * (_mtl_u._Object2World * _mtl_i._glesVertex)).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.y = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat7.xx);
    u_xlat7.xyz = u_xlat10_2.www * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 94 math, 1 textures, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_6;
  viewDir_6 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_7;
  float tmpvar_8;
  tmpvar_8 = (1.0 - _Glossiness);
  vec3 tmpvar_9;
  vec3 inVec_10;
  inVec_10 = (tmpvar_5 + viewDir_6);
  tmpvar_9 = (inVec_10 * inversesqrt(max (0.001, 
    dot (inVec_10, inVec_10)
  )));
  float tmpvar_11;
  tmpvar_11 = dot (tmpvar_4, viewDir_6);
  vec3 tmpvar_12;
  if ((tmpvar_11 < 0.0)) {
    tmpvar_12 = (tmpvar_4 + (viewDir_6 * (
      -(tmpvar_11)
     + 1e-05)));
  } else {
    tmpvar_12 = tmpvar_4;
  };
  float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_12, tmpvar_5));
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_12, tmpvar_9));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_12, viewDir_6));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_5, tmpvar_9));
  float tmpvar_17;
  tmpvar_17 = (tmpvar_8 * tmpvar_8);
  float tmpvar_18;
  tmpvar_18 = (tmpvar_8 * tmpvar_8);
  float tmpvar_19;
  tmpvar_19 = (tmpvar_18 * tmpvar_18);
  float tmpvar_20;
  tmpvar_20 = (((tmpvar_14 * tmpvar_14) * (tmpvar_19 - 1.0)) + 1.0);
  float x_21;
  x_21 = (1.0 - tmpvar_13);
  float x_22;
  x_22 = (1.0 - tmpvar_15);
  float tmpvar_23;
  tmpvar_23 = (0.5 + ((2.0 * tmpvar_16) * (tmpvar_16 * tmpvar_8)));
  float tmpvar_24;
  tmpvar_24 = ((1.0 + (
    (tmpvar_23 - 1.0)
   * 
    ((x_21 * x_21) * ((x_21 * x_21) * x_21))
  )) * (1.0 + (
    (tmpvar_23 - 1.0)
   * 
    ((x_22 * x_22) * ((x_22 * x_22) * x_22))
  )));
  float tmpvar_25;
  tmpvar_25 = (((2.0 / 
    (((tmpvar_13 * (
      (tmpvar_15 * (1.0 - tmpvar_17))
     + tmpvar_17)) + (tmpvar_15 * (
      (tmpvar_13 * (1.0 - tmpvar_17))
     + tmpvar_17))) + 1e-05)
  ) * (tmpvar_19 / 
    (((3.141593 * tmpvar_20) * tmpvar_20) + 1e-07)
  )) * 0.7853982);
  specularTerm_7 = tmpvar_25;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_7 = sqrt(max (0.0001, tmpvar_25));
  };
  float tmpvar_26;
  tmpvar_26 = max (0.0, (specularTerm_7 * tmpvar_13));
  specularTerm_7 = tmpvar_26;
  float x_27;
  x_27 = (1.0 - tmpvar_16);
  vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((tmpvar_2 * (_LightColor0.xyz * 
    (tmpvar_24 * tmpvar_13)
  )) + ((tmpvar_26 * _LightColor0.xyz) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_27 * x_27) * ((x_27 * x_27) * x_27)))
  )));
  vec4 xlat_varoutput_29;
  xlat_varoutput_29.xyz = tmpvar_28.xyz;
  xlat_varoutput_29.w = 1.0;
  gl_FragData[0] = xlat_varoutput_29;
}


#endif
"
}
SubProgram "metal " {
// Stats: 23 math, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 274
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  float4 tmpvar_10;
  tmpvar_10 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 n_14;
  n_14 = (tmpvar_10.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_13 = half3(n_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  float3 dir_20;
  dir_20 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_21;
  tmpvar_21[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_21[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_21[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = float(tmpvar_4.w);
  half3 normal_23;
  normal_23 = half3(tmpvar_19);
  half3 tangent_24;
  tangent_24 = half3(tmpvar_22.xyz);
  half tangentSign_25;
  tangentSign_25 = half(tmpvar_22.w);
  half xlat_varsign_26;
  float tmpvar_27;
  tmpvar_27 = ((float)tangentSign_25 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_26 = half(tmpvar_27);
  half3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * xlat_varsign_26);
  half3x3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_29);
  float3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_32);
  float3 tmpvar_33;
  tmpvar_33 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_33.x);
  tmpvar_8.w = half(tmpvar_33.y);
  tmpvar_9.w = half(tmpvar_33.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat15 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * vs_TEXCOORD1.xyz;
    u_xlat16 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat2.x = (-u_xlat16) + 9.99999975e-06;
    u_xlatb16 = u_xlat16<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat15) + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat6.xyz = vec3(u_xlat15) * u_xlat6.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat10 = u_xlat0.z * u_xlat0.z;
    u_xlat15 = (-_Glossiness) + 1.0;
    u_xlat6.x = u_xlat15 * u_xlat15;
    u_xlat11 = u_xlat6.x * u_xlat6.x + -1.0;
    u_xlat10 = u_xlat10 * u_xlat11 + 1.0;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat10 = u_xlat10 * 3.14159274 + 1.00000001e-07;
    u_xlat11 = u_xlat6.x * u_xlat6.x;
    u_xlat10 = u_xlat11 / u_xlat10;
    u_xlat11 = (-u_xlat15) * u_xlat15 + 1.0;
    u_xlat16 = u_xlat1.x * u_xlat11 + u_xlat6.x;
    u_xlat6.x = u_xlat0.x * u_xlat11 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat16 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
    u_xlat6.x = 2.0 / u_xlat6.x;
    u_xlat10 = u_xlat10 * u_xlat6.x;
    u_xlat10 = u_xlat10 * 0.785398185;
    u_xlat6.x = max(u_xlat10, 9.99999975e-05);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlatb11 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat10 = (u_xlatb11) ? u_xlat6.x : u_xlat10;
    u_xlat10 = u_xlat0.x * u_xlat10;
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat6.xyz = vec3(u_xlat10) * _LightColor0.xyz;
    u_xlat10 = (-u_xlat0.y) + 1.0;
    u_xlat5 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat5 = u_xlat5 * u_xlat15 + -0.5;
    u_xlat15 = u_xlat10 * u_xlat10;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10 = u_xlat10 * u_xlat15;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat3.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat3.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat4.xyz = (-u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat3.xyz;
    u_xlat10 = u_xlat1.x * u_xlat1.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat10 = u_xlat1.x * u_xlat10;
    u_xlat10 = u_xlat5 * u_xlat10 + 1.0;
    u_xlat15 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat15;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat5 = u_xlat5 * u_xlat15 + 1.0;
    u_xlat5 = u_xlat10 * u_xlat5;
    u_xlat0.x = u_xlat0.x * u_xlat5;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat15 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat6.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 103 math, 3 textures, 2 branches
Keywords { "SPOT" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex));
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(tmpvar_5);
  tmpvar_6 = (_LightColor0.xyz * ((
    float((xlv_TEXCOORD5.z > 0.0))
   * texture2D (_LightTexture0, 
    ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)
  ).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz))).w));
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_9;
  float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  vec3 tmpvar_11;
  vec3 inVec_12;
  inVec_12 = (tmpvar_7 + viewDir_8);
  tmpvar_11 = (inVec_12 * inversesqrt(max (0.001, 
    dot (inVec_12, inVec_12)
  )));
  float tmpvar_13;
  tmpvar_13 = dot (tmpvar_4, viewDir_8);
  vec3 tmpvar_14;
  if ((tmpvar_13 < 0.0)) {
    tmpvar_14 = (tmpvar_4 + (viewDir_8 * (
      -(tmpvar_13)
     + 1e-05)));
  } else {
    tmpvar_14 = tmpvar_4;
  };
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_14, tmpvar_7));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_14, tmpvar_11));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_14, viewDir_8));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_11));
  float tmpvar_19;
  tmpvar_19 = (tmpvar_10 * tmpvar_10);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_10 * tmpvar_10);
  float tmpvar_21;
  tmpvar_21 = (tmpvar_20 * tmpvar_20);
  float tmpvar_22;
  tmpvar_22 = (((tmpvar_16 * tmpvar_16) * (tmpvar_21 - 1.0)) + 1.0);
  float x_23;
  x_23 = (1.0 - tmpvar_15);
  float x_24;
  x_24 = (1.0 - tmpvar_17);
  float tmpvar_25;
  tmpvar_25 = (0.5 + ((2.0 * tmpvar_18) * (tmpvar_18 * tmpvar_10)));
  float tmpvar_26;
  tmpvar_26 = ((1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )) * (1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_24 * x_24) * ((x_24 * x_24) * x_24))
  )));
  float tmpvar_27;
  tmpvar_27 = (((2.0 / 
    (((tmpvar_15 * (
      (tmpvar_17 * (1.0 - tmpvar_19))
     + tmpvar_19)) + (tmpvar_17 * (
      (tmpvar_15 * (1.0 - tmpvar_19))
     + tmpvar_19))) + 1e-05)
  ) * (tmpvar_21 / 
    (((3.141593 * tmpvar_22) * tmpvar_22) + 1e-07)
  )) * 0.7853982);
  specularTerm_9 = tmpvar_27;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_9 = sqrt(max (0.0001, tmpvar_27));
  };
  float tmpvar_28;
  tmpvar_28 = max (0.0, (specularTerm_9 * tmpvar_15));
  specularTerm_9 = tmpvar_28;
  float x_29;
  x_29 = (1.0 - tmpvar_18);
  vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_26 * tmpvar_15)
  )) + ((tmpvar_28 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_29 * x_29) * ((x_29 * x_29) * x_29)))
  )));
  vec4 xlat_varoutput_31;
  xlat_varoutput_31.xyz = tmpvar_30.xyz;
  xlat_varoutput_31.w = 1.0;
  gl_FragData[0] = xlat_varoutput_31;
}


#endif
"
}
SubProgram "metal " {
// Stats: 25 math, 1 branches
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 352
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Matrix 288 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * (_mtl_u._Object2World * _mtl_i._glesVertex));
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.y = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat7.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_2 = texture(_LightTexture0, u_xlat7.xy);
    u_xlatb7 = 0.0<vs_TEXCOORD5.z;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat10_2.w * u_xlat7.x;
    u_xlat13 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat13));
    u_xlat7.x = u_xlat7.x * u_xlat10_2.w;
    u_xlat7.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 98 math, 3 textures, 2 branches
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(tmpvar_5);
  tmpvar_6 = (_LightColor0.xyz * (texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5))).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w));
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_9;
  float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  vec3 tmpvar_11;
  vec3 inVec_12;
  inVec_12 = (tmpvar_7 + viewDir_8);
  tmpvar_11 = (inVec_12 * inversesqrt(max (0.001, 
    dot (inVec_12, inVec_12)
  )));
  float tmpvar_13;
  tmpvar_13 = dot (tmpvar_4, viewDir_8);
  vec3 tmpvar_14;
  if ((tmpvar_13 < 0.0)) {
    tmpvar_14 = (tmpvar_4 + (viewDir_8 * (
      -(tmpvar_13)
     + 1e-05)));
  } else {
    tmpvar_14 = tmpvar_4;
  };
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_14, tmpvar_7));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_14, tmpvar_11));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_14, viewDir_8));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_11));
  float tmpvar_19;
  tmpvar_19 = (tmpvar_10 * tmpvar_10);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_10 * tmpvar_10);
  float tmpvar_21;
  tmpvar_21 = (tmpvar_20 * tmpvar_20);
  float tmpvar_22;
  tmpvar_22 = (((tmpvar_16 * tmpvar_16) * (tmpvar_21 - 1.0)) + 1.0);
  float x_23;
  x_23 = (1.0 - tmpvar_15);
  float x_24;
  x_24 = (1.0 - tmpvar_17);
  float tmpvar_25;
  tmpvar_25 = (0.5 + ((2.0 * tmpvar_18) * (tmpvar_18 * tmpvar_10)));
  float tmpvar_26;
  tmpvar_26 = ((1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )) * (1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_24 * x_24) * ((x_24 * x_24) * x_24))
  )));
  float tmpvar_27;
  tmpvar_27 = (((2.0 / 
    (((tmpvar_15 * (
      (tmpvar_17 * (1.0 - tmpvar_19))
     + tmpvar_19)) + (tmpvar_17 * (
      (tmpvar_15 * (1.0 - tmpvar_19))
     + tmpvar_19))) + 1e-05)
  ) * (tmpvar_21 / 
    (((3.141593 * tmpvar_22) * tmpvar_22) + 1e-07)
  )) * 0.7853982);
  specularTerm_9 = tmpvar_27;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_9 = sqrt(max (0.0001, tmpvar_27));
  };
  float tmpvar_28;
  tmpvar_28 = max (0.0, (specularTerm_9 * tmpvar_15));
  specularTerm_9 = tmpvar_28;
  float x_29;
  x_29 = (1.0 - tmpvar_18);
  vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_26 * tmpvar_15)
  )) + ((tmpvar_28 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_29 * x_29) * ((x_29 * x_29) * x_29)))
  )));
  vec4 xlat_varoutput_31;
  xlat_varoutput_31.xyz = tmpvar_30.xyz;
  xlat_varoutput_31.w = 1.0;
  gl_FragData[0] = xlat_varoutput_31;
}


#endif
"
}
SubProgram "metal " {
// Stats: 25 math, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 352
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Matrix 288 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * (_mtl_u._Object2World * _mtl_i._glesVertex)).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.y = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat7.xx);
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_7 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat7.xyz = vec3(u_xlat16_7) * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 95 math, 2 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  tmpvar_6 = (_LightColor0.xyz * texture2D (_LightTexture0, xlv_TEXCOORD5).w);
  vec3 viewDir_7;
  viewDir_7 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_5 + viewDir_7);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = dot (tmpvar_4, viewDir_7);
  vec3 tmpvar_13;
  if ((tmpvar_12 < 0.0)) {
    tmpvar_13 = (tmpvar_4 + (viewDir_7 * (
      -(tmpvar_12)
     + 1e-05)));
  } else {
    tmpvar_13 = tmpvar_4;
  };
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_13, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_13, tmpvar_10));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_13, viewDir_7));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_10));
  float tmpvar_18;
  tmpvar_18 = (tmpvar_9 * tmpvar_9);
  float tmpvar_19;
  tmpvar_19 = (tmpvar_9 * tmpvar_9);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_19 * tmpvar_19);
  float tmpvar_21;
  tmpvar_21 = (((tmpvar_15 * tmpvar_15) * (tmpvar_20 - 1.0)) + 1.0);
  float x_22;
  x_22 = (1.0 - tmpvar_14);
  float x_23;
  x_23 = (1.0 - tmpvar_16);
  float tmpvar_24;
  tmpvar_24 = (0.5 + ((2.0 * tmpvar_17) * (tmpvar_17 * tmpvar_9)));
  float tmpvar_25;
  tmpvar_25 = ((1.0 + (
    (tmpvar_24 - 1.0)
   * 
    ((x_22 * x_22) * ((x_22 * x_22) * x_22))
  )) * (1.0 + (
    (tmpvar_24 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )));
  float tmpvar_26;
  tmpvar_26 = (((2.0 / 
    (((tmpvar_14 * (
      (tmpvar_16 * (1.0 - tmpvar_18))
     + tmpvar_18)) + (tmpvar_16 * (
      (tmpvar_14 * (1.0 - tmpvar_18))
     + tmpvar_18))) + 1e-05)
  ) * (tmpvar_20 / 
    (((3.141593 * tmpvar_21) * tmpvar_21) + 1e-07)
  )) * 0.7853982);
  specularTerm_8 = tmpvar_26;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_8 = sqrt(max (0.0001, tmpvar_26));
  };
  float tmpvar_27;
  tmpvar_27 = max (0.0, (specularTerm_8 * tmpvar_14));
  specularTerm_8 = tmpvar_27;
  float x_28;
  x_28 = (1.0 - tmpvar_17);
  vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_25 * tmpvar_14)
  )) + ((tmpvar_27 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_28 * x_28) * ((x_28 * x_28) * x_28)))
  )));
  vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif
"
}
SubProgram "metal " {
// Stats: 25 math, 1 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 352
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Matrix 288 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  float4 tmpvar_10;
  tmpvar_10 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 n_14;
  n_14 = (tmpvar_10.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_13 = half3(n_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  float3 dir_20;
  dir_20 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_21;
  tmpvar_21[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_21[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_21[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = float(tmpvar_4.w);
  half3 normal_23;
  normal_23 = half3(tmpvar_19);
  half3 tangent_24;
  tangent_24 = half3(tmpvar_22.xyz);
  half tangentSign_25;
  tangentSign_25 = half(tmpvar_22.w);
  half xlat_varsign_26;
  float tmpvar_27;
  tmpvar_27 = ((float)tangentSign_25 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_26 = half(tmpvar_27);
  half3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * xlat_varsign_26);
  half3x3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_29);
  float3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_32);
  float3 tmpvar_33;
  tmpvar_33 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_33.x);
  tmpvar_8.w = half(tmpvar_33.y);
  tmpvar_9.w = half(tmpvar_33.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * (_mtl_u._Object2World * _mtl_i._glesVertex)).xy;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * _LightMatrix0[1].xy;
    u_xlat0.xy = _LightMatrix0[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = _LightMatrix0[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat0.ww + u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat19 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat2.x = (-u_xlat19) + 9.99999975e-06;
    u_xlatb19 = u_xlat19<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb19)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat7.xyz = u_xlat10_2.www * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 107 math, 4 textures, 2 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25);
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * tmpvar_25);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(tmpvar_5);
  tmpvar_6 = (_LightColor0.xyz * ((
    (float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w)
   * texture2D (_LightTextureB0, vec2(
    dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz)
  )).w) * (_LightShadowData.x + 
    (shadow2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x * (1.0 - _LightShadowData.x))
  )));
  vec3 viewDir_8;
  viewDir_8 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_9;
  float tmpvar_10;
  tmpvar_10 = (1.0 - _Glossiness);
  vec3 tmpvar_11;
  vec3 inVec_12;
  inVec_12 = (tmpvar_7 + viewDir_8);
  tmpvar_11 = (inVec_12 * inversesqrt(max (0.001, 
    dot (inVec_12, inVec_12)
  )));
  float tmpvar_13;
  tmpvar_13 = dot (tmpvar_4, viewDir_8);
  vec3 tmpvar_14;
  if ((tmpvar_13 < 0.0)) {
    tmpvar_14 = (tmpvar_4 + (viewDir_8 * (
      -(tmpvar_13)
     + 1e-05)));
  } else {
    tmpvar_14 = tmpvar_4;
  };
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_14, tmpvar_7));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_14, tmpvar_11));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_14, viewDir_8));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_7, tmpvar_11));
  float tmpvar_19;
  tmpvar_19 = (tmpvar_10 * tmpvar_10);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_10 * tmpvar_10);
  float tmpvar_21;
  tmpvar_21 = (tmpvar_20 * tmpvar_20);
  float tmpvar_22;
  tmpvar_22 = (((tmpvar_16 * tmpvar_16) * (tmpvar_21 - 1.0)) + 1.0);
  float x_23;
  x_23 = (1.0 - tmpvar_15);
  float x_24;
  x_24 = (1.0 - tmpvar_17);
  float tmpvar_25;
  tmpvar_25 = (0.5 + ((2.0 * tmpvar_18) * (tmpvar_18 * tmpvar_10)));
  float tmpvar_26;
  tmpvar_26 = ((1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )) * (1.0 + (
    (tmpvar_25 - 1.0)
   * 
    ((x_24 * x_24) * ((x_24 * x_24) * x_24))
  )));
  float tmpvar_27;
  tmpvar_27 = (((2.0 / 
    (((tmpvar_15 * (
      (tmpvar_17 * (1.0 - tmpvar_19))
     + tmpvar_19)) + (tmpvar_17 * (
      (tmpvar_15 * (1.0 - tmpvar_19))
     + tmpvar_19))) + 1e-05)
  ) * (tmpvar_21 / 
    (((3.141593 * tmpvar_22) * tmpvar_22) + 1e-07)
  )) * 0.7853982);
  specularTerm_9 = tmpvar_27;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_9 = sqrt(max (0.0001, tmpvar_27));
  };
  float tmpvar_28;
  tmpvar_28 = max (0.0, (specularTerm_9 * tmpvar_15));
  specularTerm_9 = tmpvar_28;
  float x_29;
  x_29 = (1.0 - tmpvar_18);
  vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_26 * tmpvar_15)
  )) + ((tmpvar_28 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_29 * x_29) * ((x_29 * x_29) * x_29)))
  )));
  vec4 xlat_varoutput_31;
  xlat_varoutput_31.xyz = tmpvar_30.xyz;
  xlat_varoutput_31.w = 1.0;
  gl_FragData[0] = xlat_varoutput_31;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 608
Matrix 32 [unity_World2Shadow0]
Matrix 96 [unity_World2Shadow1]
Matrix 160 [unity_World2Shadow2]
Matrix 224 [unity_World2Shadow3]
Matrix 288 [glstate_matrix_mvp]
Matrix 352 [_Object2World]
Matrix 416 [_World2Object]
Matrix 544 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 480 [unity_WorldTransformParams]
Vector 496 [_MainTex_ST]
Vector 512 [_DetailAlbedoMap_ST]
ScalarHalf 528 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * tmpvar_36);
  _mtl_o.xlv_TEXCOORD6 = (_mtl_u.unity_World2Shadow[0] * tmpvar_36);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 unity_World2Shadow[4];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * unity_World2Shadow[0][1];
    u_xlat1 = unity_World2Shadow[0][0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_World2Shadow[0][2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = unity_World2Shadow[0][3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
float u_xlat13;
float u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xy);
    u_xlatb0 = 0.0<vs_TEXCOORD5.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat10_0.w * u_xlat0.x;
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat6.xx);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat6.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
    vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat12 = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = u_xlat10_6 * u_xlat12 + _LightShadowData.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat3.xyz = (-u_xlat2.xyz) * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat3.x = vs_TEXCOORD2.w;
    u_xlat3.y = vs_TEXCOORD3.w;
    u_xlat3.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat18) + (-u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat1.xyw = max(u_xlat1.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat13 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat13 * u_xlat13;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat13) * u_xlat13 + 1.0;
    u_xlat14 = u_xlat1.w * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat19 = (-u_xlat1.w) + 1.0;
    u_xlat2.x = u_xlat1.x * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.y) + 1.0;
    u_xlat7 = dot(u_xlat1.yy, u_xlat1.yy);
    u_xlat7 = u_xlat7 * u_xlat13 + -0.5;
    u_xlat13 = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat18 = u_xlat18 * u_xlat13;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat19 * u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18 + 1.0;
    u_xlat13 = (-u_xlat1.x) + 1.0;
    u_xlat19 = u_xlat13 * u_xlat13;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat13 = u_xlat13 * u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat7;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 95 math, 2 textures, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  tmpvar_6 = (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x);
  vec3 viewDir_7;
  viewDir_7 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_5 + viewDir_7);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = dot (tmpvar_4, viewDir_7);
  vec3 tmpvar_13;
  if ((tmpvar_12 < 0.0)) {
    tmpvar_13 = (tmpvar_4 + (viewDir_7 * (
      -(tmpvar_12)
     + 1e-05)));
  } else {
    tmpvar_13 = tmpvar_4;
  };
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_13, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_13, tmpvar_10));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_13, viewDir_7));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_10));
  float tmpvar_18;
  tmpvar_18 = (tmpvar_9 * tmpvar_9);
  float tmpvar_19;
  tmpvar_19 = (tmpvar_9 * tmpvar_9);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_19 * tmpvar_19);
  float tmpvar_21;
  tmpvar_21 = (((tmpvar_15 * tmpvar_15) * (tmpvar_20 - 1.0)) + 1.0);
  float x_22;
  x_22 = (1.0 - tmpvar_14);
  float x_23;
  x_23 = (1.0 - tmpvar_16);
  float tmpvar_24;
  tmpvar_24 = (0.5 + ((2.0 * tmpvar_17) * (tmpvar_17 * tmpvar_9)));
  float tmpvar_25;
  tmpvar_25 = ((1.0 + (
    (tmpvar_24 - 1.0)
   * 
    ((x_22 * x_22) * ((x_22 * x_22) * x_22))
  )) * (1.0 + (
    (tmpvar_24 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )));
  float tmpvar_26;
  tmpvar_26 = (((2.0 / 
    (((tmpvar_14 * (
      (tmpvar_16 * (1.0 - tmpvar_18))
     + tmpvar_18)) + (tmpvar_16 * (
      (tmpvar_14 * (1.0 - tmpvar_18))
     + tmpvar_18))) + 1e-05)
  ) * (tmpvar_20 / 
    (((3.141593 * tmpvar_21) * tmpvar_21) + 1e-07)
  )) * 0.7853982);
  specularTerm_8 = tmpvar_26;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_8 = sqrt(max (0.0001, tmpvar_26));
  };
  float tmpvar_27;
  tmpvar_27 = max (0.0, (specularTerm_8 * tmpvar_14));
  specularTerm_8 = tmpvar_27;
  float x_28;
  x_28 = (1.0 - tmpvar_17);
  vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_25 * tmpvar_14)
  )) + ((tmpvar_27 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_28 * x_28) * ((x_28 * x_28) * x_28)))
  )));
  vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 290
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
VectorHalf 32 [_WorldSpaceLightPos0] 4
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  float4 tmpvar_10;
  tmpvar_10 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 n_14;
  n_14 = (tmpvar_10.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_13 = half3(n_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  float3 dir_20;
  dir_20 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_21;
  tmpvar_21[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_21[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_21[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = float(tmpvar_4.w);
  half3 normal_23;
  normal_23 = half3(tmpvar_19);
  half3 tangent_24;
  tangent_24 = half3(tmpvar_22.xyz);
  half tangentSign_25;
  tangentSign_25 = half(tmpvar_22.w);
  half xlat_varsign_26;
  float tmpvar_27;
  tmpvar_27 = ((float)tangentSign_25 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_26 = half(tmpvar_27);
  half3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * xlat_varsign_26);
  half3x3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_29);
  float3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_32);
  float4 o_33;
  float4 tmpvar_34;
  tmpvar_34 = (tmpvar_6 * 0.5);
  float2 tmpvar_35;
  tmpvar_35.x = tmpvar_34.x;
  tmpvar_35.y = (tmpvar_34.y * _mtl_u._ProjectionParams.x);
  o_33.xy = (tmpvar_35 + tmpvar_34.w);
  o_33.zw = tmpvar_6.zw;
  float3 tmpvar_36;
  tmpvar_36 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_36.x);
  tmpvar_8.w = half(tmpvar_36.y);
  tmpvar_9.w = half(tmpvar_36.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = o_33;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat19 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat2.x = (-u_xlat19) + 9.99999975e-06;
    u_xlatb19 = u_xlat19<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb19)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 96 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
  xlv_TEXCOORD6 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec3 tmpvar_6;
  tmpvar_6 = (_LightColor0.xyz * (texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x));
  vec3 viewDir_7;
  viewDir_7 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  vec3 tmpvar_10;
  vec3 inVec_11;
  inVec_11 = (tmpvar_5 + viewDir_7);
  tmpvar_10 = (inVec_11 * inversesqrt(max (0.001, 
    dot (inVec_11, inVec_11)
  )));
  float tmpvar_12;
  tmpvar_12 = dot (tmpvar_4, viewDir_7);
  vec3 tmpvar_13;
  if ((tmpvar_12 < 0.0)) {
    tmpvar_13 = (tmpvar_4 + (viewDir_7 * (
      -(tmpvar_12)
     + 1e-05)));
  } else {
    tmpvar_13 = tmpvar_4;
  };
  float tmpvar_14;
  tmpvar_14 = max (0.0, dot (tmpvar_13, tmpvar_5));
  float tmpvar_15;
  tmpvar_15 = max (0.0, dot (tmpvar_13, tmpvar_10));
  float tmpvar_16;
  tmpvar_16 = max (0.0, dot (tmpvar_13, viewDir_7));
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_5, tmpvar_10));
  float tmpvar_18;
  tmpvar_18 = (tmpvar_9 * tmpvar_9);
  float tmpvar_19;
  tmpvar_19 = (tmpvar_9 * tmpvar_9);
  float tmpvar_20;
  tmpvar_20 = (tmpvar_19 * tmpvar_19);
  float tmpvar_21;
  tmpvar_21 = (((tmpvar_15 * tmpvar_15) * (tmpvar_20 - 1.0)) + 1.0);
  float x_22;
  x_22 = (1.0 - tmpvar_14);
  float x_23;
  x_23 = (1.0 - tmpvar_16);
  float tmpvar_24;
  tmpvar_24 = (0.5 + ((2.0 * tmpvar_17) * (tmpvar_17 * tmpvar_9)));
  float tmpvar_25;
  tmpvar_25 = ((1.0 + (
    (tmpvar_24 - 1.0)
   * 
    ((x_22 * x_22) * ((x_22 * x_22) * x_22))
  )) * (1.0 + (
    (tmpvar_24 - 1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )));
  float tmpvar_26;
  tmpvar_26 = (((2.0 / 
    (((tmpvar_14 * (
      (tmpvar_16 * (1.0 - tmpvar_18))
     + tmpvar_18)) + (tmpvar_16 * (
      (tmpvar_14 * (1.0 - tmpvar_18))
     + tmpvar_18))) + 1e-05)
  ) * (tmpvar_20 / 
    (((3.141593 * tmpvar_21) * tmpvar_21) + 1e-07)
  )) * 0.7853982);
  specularTerm_8 = tmpvar_26;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_8 = sqrt(max (0.0001, tmpvar_26));
  };
  float tmpvar_27;
  tmpvar_27 = max (0.0, (specularTerm_8 * tmpvar_14));
  specularTerm_8 = tmpvar_27;
  float x_28;
  x_28 = (1.0 - tmpvar_17);
  vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = ((tmpvar_2 * (tmpvar_6 * 
    (tmpvar_25 * tmpvar_14)
  )) + ((tmpvar_27 * tmpvar_6) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_28 * x_28) * ((x_28 * x_28) * x_28)))
  )));
  vec4 xlat_varoutput_30;
  xlat_varoutput_30.xyz = tmpvar_29.xyz;
  xlat_varoutput_30.w = 1.0;
  gl_FragData[0] = xlat_varoutput_30;
}


#endif
"
}
SubProgram "metal " {
// Stats: 28 math, 1 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 368
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Matrix 304 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
VectorHalf 32 [_WorldSpaceLightPos0] 4
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  float4 tmpvar_10;
  tmpvar_10 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 n_14;
  n_14 = (tmpvar_10.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_13 = half3(n_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  float3 dir_20;
  dir_20 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_21;
  tmpvar_21[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_21[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_21[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = float(tmpvar_4.w);
  half3 normal_23;
  normal_23 = half3(tmpvar_19);
  half3 tangent_24;
  tangent_24 = half3(tmpvar_22.xyz);
  half tangentSign_25;
  tangentSign_25 = half(tmpvar_22.w);
  half xlat_varsign_26;
  float tmpvar_27;
  tmpvar_27 = ((float)tangentSign_25 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_26 = half(tmpvar_27);
  half3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * xlat_varsign_26);
  half3x3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_29);
  float3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_32);
  float4 o_33;
  float4 tmpvar_34;
  tmpvar_34 = (tmpvar_6 * 0.5);
  float2 tmpvar_35;
  tmpvar_35.x = tmpvar_34.x;
  tmpvar_35.y = (tmpvar_34.y * _mtl_u._ProjectionParams.x);
  o_33.xy = (tmpvar_35 + tmpvar_34.w);
  o_33.zw = tmpvar_6.zw;
  float3 tmpvar_36;
  tmpvar_36 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_36.x);
  tmpvar_8.w = half(tmpvar_36.y);
  tmpvar_9.w = half(tmpvar_36.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * (_mtl_u._Object2World * _mtl_i._glesVertex)).xy;
  _mtl_o.xlv_TEXCOORD6 = o_33;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat1 = _Object2World[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = _Object2World[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = _Object2World[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xy = u_xlat1.yy * _LightMatrix0[1].xy;
    u_xlat1.xy = _LightMatrix0[0].xy * u_xlat1.xx + u_xlat2.xy;
    u_xlat1.xy = _LightMatrix0[2].xy * u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat1.ww + u_xlat1.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat19 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat2.x = (-u_xlat19) + 9.99999975e-06;
    u_xlatb19 = u_xlat19<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb19)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat18) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat16_7 = u_xlat10_2.x * u_xlat10_3.w;
    u_xlat7.xyz = vec3(u_xlat16_7) * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 104 math, 3 textures, 3 branches
Keywords { "POINT" "SHADOWS_CUBE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  float mydist_8;
  mydist_8 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_9;
  tmpvar_9 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_10;
  if ((tmpvar_9.x < mydist_8)) {
    tmpvar_10 = _LightShadowData.x;
  } else {
    tmpvar_10 = 1.0;
  };
  vec3 tmpvar_11;
  vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_6);
  tmpvar_11 = (_LightColor0.xyz * (tmpvar_7.w * tmpvar_10));
  vec3 viewDir_13;
  viewDir_13 = -(tmpvar_5);
  float specularTerm_14;
  float tmpvar_15;
  tmpvar_15 = (1.0 - _Glossiness);
  vec3 tmpvar_16;
  vec3 inVec_17;
  inVec_17 = (tmpvar_12 + viewDir_13);
  tmpvar_16 = (inVec_17 * inversesqrt(max (0.001, 
    dot (inVec_17, inVec_17)
  )));
  float tmpvar_18;
  tmpvar_18 = dot (tmpvar_4, viewDir_13);
  vec3 tmpvar_19;
  if ((tmpvar_18 < 0.0)) {
    tmpvar_19 = (tmpvar_4 + (viewDir_13 * (
      -(tmpvar_18)
     + 1e-05)));
  } else {
    tmpvar_19 = tmpvar_4;
  };
  float tmpvar_20;
  tmpvar_20 = max (0.0, dot (tmpvar_19, tmpvar_12));
  float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_19, tmpvar_16));
  float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_19, viewDir_13));
  float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_12, tmpvar_16));
  float tmpvar_24;
  tmpvar_24 = (tmpvar_15 * tmpvar_15);
  float tmpvar_25;
  tmpvar_25 = (tmpvar_15 * tmpvar_15);
  float tmpvar_26;
  tmpvar_26 = (tmpvar_25 * tmpvar_25);
  float tmpvar_27;
  tmpvar_27 = (((tmpvar_21 * tmpvar_21) * (tmpvar_26 - 1.0)) + 1.0);
  float x_28;
  x_28 = (1.0 - tmpvar_20);
  float x_29;
  x_29 = (1.0 - tmpvar_22);
  float tmpvar_30;
  tmpvar_30 = (0.5 + ((2.0 * tmpvar_23) * (tmpvar_23 * tmpvar_15)));
  float tmpvar_31;
  tmpvar_31 = ((1.0 + (
    (tmpvar_30 - 1.0)
   * 
    ((x_28 * x_28) * ((x_28 * x_28) * x_28))
  )) * (1.0 + (
    (tmpvar_30 - 1.0)
   * 
    ((x_29 * x_29) * ((x_29 * x_29) * x_29))
  )));
  float tmpvar_32;
  tmpvar_32 = (((2.0 / 
    (((tmpvar_20 * (
      (tmpvar_22 * (1.0 - tmpvar_24))
     + tmpvar_24)) + (tmpvar_22 * (
      (tmpvar_20 * (1.0 - tmpvar_24))
     + tmpvar_24))) + 1e-05)
  ) * (tmpvar_26 / 
    (((3.141593 * tmpvar_27) * tmpvar_27) + 1e-07)
  )) * 0.7853982);
  specularTerm_14 = tmpvar_32;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_14 = sqrt(max (0.0001, tmpvar_32));
  };
  float tmpvar_33;
  tmpvar_33 = max (0.0, (specularTerm_14 * tmpvar_20));
  specularTerm_14 = tmpvar_33;
  float x_34;
  x_34 = (1.0 - tmpvar_23);
  vec4 tmpvar_35;
  tmpvar_35.w = 1.0;
  tmpvar_35.xyz = ((tmpvar_2 * (tmpvar_11 * 
    (tmpvar_31 * tmpvar_20)
  )) + ((tmpvar_33 * tmpvar_11) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_34 * x_34) * ((x_34 * x_34) * x_34)))
  )));
  vec4 xlat_varoutput_36;
  xlat_varoutput_36.xyz = tmpvar_35.xyz;
  xlat_varoutput_36.w = 1.0;
  gl_FragData[0] = xlat_varoutput_36;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 368
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Matrix 304 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 32 [_LightPositionRange]
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * tmpvar_36).xyz;
  _mtl_o.xlv_TEXCOORD6 = (tmpvar_36.xyz - _mtl_u._LightPositionRange.xyz);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.y = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb7 = u_xlat10_2.x<u_xlat7.x;
    u_xlat7.x = (u_xlatb7) ? _LightShadowData.x : 1.0;
    u_xlat13 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTexture0, vec2(u_xlat13));
    u_xlat7.x = u_xlat7.x * u_xlat10_2.w;
    u_xlat7.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 105 math, 4 textures, 3 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 tmpvar_8;
  tmpvar_8 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  float mydist_9;
  mydist_9 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_10;
  tmpvar_10 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_11;
  if ((tmpvar_10.x < mydist_9)) {
    tmpvar_11 = _LightShadowData.x;
  } else {
    tmpvar_11 = 1.0;
  };
  vec3 tmpvar_12;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_6);
  tmpvar_12 = (_LightColor0.xyz * ((tmpvar_7.w * tmpvar_8.w) * tmpvar_11));
  vec3 viewDir_14;
  viewDir_14 = -(tmpvar_5);
  float specularTerm_15;
  float tmpvar_16;
  tmpvar_16 = (1.0 - _Glossiness);
  vec3 tmpvar_17;
  vec3 inVec_18;
  inVec_18 = (tmpvar_13 + viewDir_14);
  tmpvar_17 = (inVec_18 * inversesqrt(max (0.001, 
    dot (inVec_18, inVec_18)
  )));
  float tmpvar_19;
  tmpvar_19 = dot (tmpvar_4, viewDir_14);
  vec3 tmpvar_20;
  if ((tmpvar_19 < 0.0)) {
    tmpvar_20 = (tmpvar_4 + (viewDir_14 * (
      -(tmpvar_19)
     + 1e-05)));
  } else {
    tmpvar_20 = tmpvar_4;
  };
  float tmpvar_21;
  tmpvar_21 = max (0.0, dot (tmpvar_20, tmpvar_13));
  float tmpvar_22;
  tmpvar_22 = max (0.0, dot (tmpvar_20, tmpvar_17));
  float tmpvar_23;
  tmpvar_23 = max (0.0, dot (tmpvar_20, viewDir_14));
  float tmpvar_24;
  tmpvar_24 = max (0.0, dot (tmpvar_13, tmpvar_17));
  float tmpvar_25;
  tmpvar_25 = (tmpvar_16 * tmpvar_16);
  float tmpvar_26;
  tmpvar_26 = (tmpvar_16 * tmpvar_16);
  float tmpvar_27;
  tmpvar_27 = (tmpvar_26 * tmpvar_26);
  float tmpvar_28;
  tmpvar_28 = (((tmpvar_22 * tmpvar_22) * (tmpvar_27 - 1.0)) + 1.0);
  float x_29;
  x_29 = (1.0 - tmpvar_21);
  float x_30;
  x_30 = (1.0 - tmpvar_23);
  float tmpvar_31;
  tmpvar_31 = (0.5 + ((2.0 * tmpvar_24) * (tmpvar_24 * tmpvar_16)));
  float tmpvar_32;
  tmpvar_32 = ((1.0 + (
    (tmpvar_31 - 1.0)
   * 
    ((x_29 * x_29) * ((x_29 * x_29) * x_29))
  )) * (1.0 + (
    (tmpvar_31 - 1.0)
   * 
    ((x_30 * x_30) * ((x_30 * x_30) * x_30))
  )));
  float tmpvar_33;
  tmpvar_33 = (((2.0 / 
    (((tmpvar_21 * (
      (tmpvar_23 * (1.0 - tmpvar_25))
     + tmpvar_25)) + (tmpvar_23 * (
      (tmpvar_21 * (1.0 - tmpvar_25))
     + tmpvar_25))) + 1e-05)
  ) * (tmpvar_27 / 
    (((3.141593 * tmpvar_28) * tmpvar_28) + 1e-07)
  )) * 0.7853982);
  specularTerm_15 = tmpvar_33;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_15 = sqrt(max (0.0001, tmpvar_33));
  };
  float tmpvar_34;
  tmpvar_34 = max (0.0, (specularTerm_15 * tmpvar_21));
  specularTerm_15 = tmpvar_34;
  float x_35;
  x_35 = (1.0 - tmpvar_24);
  vec4 tmpvar_36;
  tmpvar_36.w = 1.0;
  tmpvar_36.xyz = ((tmpvar_2 * (tmpvar_12 * 
    (tmpvar_32 * tmpvar_21)
  )) + ((tmpvar_34 * tmpvar_12) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_35 * x_35) * ((x_35 * x_35) * x_35)))
  )));
  vec4 xlat_varoutput_37;
  xlat_varoutput_37.xyz = tmpvar_36.xyz;
  xlat_varoutput_37.w = 1.0;
  gl_FragData[0] = xlat_varoutput_37;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 368
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Matrix 304 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 32 [_LightPositionRange]
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * tmpvar_36).xyz;
  _mtl_o.xlv_TEXCOORD6 = (tmpvar_36.xyz - _mtl_u._LightPositionRange.xyz);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, (-u_xlat1.xyz));
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat0.y = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat0.xyz = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat18 = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12 = u_xlat12 * u_xlat13 + 1.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12 = u_xlat13 / u_xlat12;
    u_xlat13 = (-u_xlat18) * u_xlat18 + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlat12 = u_xlat12 * 0.785398185;
    u_xlat7.x = max(u_xlat12, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12 = (u_xlatb13) ? u_xlat7.x : u_xlat12;
    u_xlat12 = u_xlat0.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb7 = u_xlat10_2.x<u_xlat7.x;
    u_xlat7.x = (u_xlatb7) ? _LightShadowData.x : 1.0;
    u_xlat13 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat13));
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_13 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat7.x = u_xlat7.x * u_xlat16_13;
    u_xlat7.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat7.xyz;
    u_xlat12 = (-u_xlat0.y) + 1.0;
    u_xlat6 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat6 = u_xlat6 * u_xlat18 + -0.5;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat12) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat12 = u_xlat6 * u_xlat12 + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 113 math, 7 textures, 2 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25);
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * tmpvar_25);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2DShadow _ShadowMapTexture;
uniform vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec4 shadows_6;
  vec3 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  shadows_6.x = shadow2D (_ShadowMapTexture, (tmpvar_7 + _ShadowOffsets[0].xyz)).x;
  shadows_6.y = shadow2D (_ShadowMapTexture, (tmpvar_7 + _ShadowOffsets[1].xyz)).x;
  shadows_6.z = shadow2D (_ShadowMapTexture, (tmpvar_7 + _ShadowOffsets[2].xyz)).x;
  shadows_6.w = shadow2D (_ShadowMapTexture, (tmpvar_7 + _ShadowOffsets[3].xyz)).x;
  shadows_6 = (_LightShadowData.xxxx + (shadows_6 * (1.0 - _LightShadowData.xxxx)));
  vec3 tmpvar_8;
  vec3 tmpvar_9;
  tmpvar_9 = normalize(tmpvar_5);
  tmpvar_8 = (_LightColor0.xyz * ((
    (float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w)
   * texture2D (_LightTextureB0, vec2(
    dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz)
  )).w) * dot (shadows_6, vec4(0.25, 0.25, 0.25, 0.25))));
  vec3 viewDir_10;
  viewDir_10 = -(normalize(xlv_TEXCOORD1));
  float specularTerm_11;
  float tmpvar_12;
  tmpvar_12 = (1.0 - _Glossiness);
  vec3 tmpvar_13;
  vec3 inVec_14;
  inVec_14 = (tmpvar_9 + viewDir_10);
  tmpvar_13 = (inVec_14 * inversesqrt(max (0.001, 
    dot (inVec_14, inVec_14)
  )));
  float tmpvar_15;
  tmpvar_15 = dot (tmpvar_4, viewDir_10);
  vec3 tmpvar_16;
  if ((tmpvar_15 < 0.0)) {
    tmpvar_16 = (tmpvar_4 + (viewDir_10 * (
      -(tmpvar_15)
     + 1e-05)));
  } else {
    tmpvar_16 = tmpvar_4;
  };
  float tmpvar_17;
  tmpvar_17 = max (0.0, dot (tmpvar_16, tmpvar_9));
  float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_16, tmpvar_13));
  float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_16, viewDir_10));
  float tmpvar_20;
  tmpvar_20 = max (0.0, dot (tmpvar_9, tmpvar_13));
  float tmpvar_21;
  tmpvar_21 = (tmpvar_12 * tmpvar_12);
  float tmpvar_22;
  tmpvar_22 = (tmpvar_12 * tmpvar_12);
  float tmpvar_23;
  tmpvar_23 = (tmpvar_22 * tmpvar_22);
  float tmpvar_24;
  tmpvar_24 = (((tmpvar_18 * tmpvar_18) * (tmpvar_23 - 1.0)) + 1.0);
  float x_25;
  x_25 = (1.0 - tmpvar_17);
  float x_26;
  x_26 = (1.0 - tmpvar_19);
  float tmpvar_27;
  tmpvar_27 = (0.5 + ((2.0 * tmpvar_20) * (tmpvar_20 * tmpvar_12)));
  float tmpvar_28;
  tmpvar_28 = ((1.0 + (
    (tmpvar_27 - 1.0)
   * 
    ((x_25 * x_25) * ((x_25 * x_25) * x_25))
  )) * (1.0 + (
    (tmpvar_27 - 1.0)
   * 
    ((x_26 * x_26) * ((x_26 * x_26) * x_26))
  )));
  float tmpvar_29;
  tmpvar_29 = (((2.0 / 
    (((tmpvar_17 * (
      (tmpvar_19 * (1.0 - tmpvar_21))
     + tmpvar_21)) + (tmpvar_19 * (
      (tmpvar_17 * (1.0 - tmpvar_21))
     + tmpvar_21))) + 1e-05)
  ) * (tmpvar_23 / 
    (((3.141593 * tmpvar_24) * tmpvar_24) + 1e-07)
  )) * 0.7853982);
  specularTerm_11 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_11 = sqrt(max (0.0001, tmpvar_29));
  };
  float tmpvar_30;
  tmpvar_30 = max (0.0, (specularTerm_11 * tmpvar_17));
  specularTerm_11 = tmpvar_30;
  float x_31;
  x_31 = (1.0 - tmpvar_20);
  vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = ((tmpvar_2 * (tmpvar_8 * 
    (tmpvar_28 * tmpvar_17)
  )) + ((tmpvar_30 * tmpvar_8) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_31 * x_31) * ((x_31 * x_31) * x_31)))
  )));
  vec4 xlat_varoutput_33;
  xlat_varoutput_33.xyz = tmpvar_32.xyz;
  xlat_varoutput_33.w = 1.0;
  gl_FragData[0] = xlat_varoutput_33;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 608
Matrix 32 [unity_World2Shadow0]
Matrix 96 [unity_World2Shadow1]
Matrix 160 [unity_World2Shadow2]
Matrix 224 [unity_World2Shadow3]
Matrix 288 [glstate_matrix_mvp]
Matrix 352 [_Object2World]
Matrix 416 [_World2Object]
Matrix 544 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 480 [unity_WorldTransformParams]
Vector 496 [_MainTex_ST]
Vector 512 [_DetailAlbedoMap_ST]
ScalarHalf 528 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * tmpvar_36);
  _mtl_o.xlv_TEXCOORD6 = (_mtl_u.unity_World2Shadow[0] * tmpvar_36);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 unity_World2Shadow[4];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * unity_World2Shadow[0][1];
    u_xlat1 = unity_World2Shadow[0][0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_World2Shadow[0][2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = unity_World2Shadow[0][3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 _ShadowOffsets[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
float u_xlat13;
float u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-_LightShadowData.x) + 1.0;
    u_xlat6.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
    u_xlat1.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
    u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0 = u_xlat1 * u_xlat0.xxxx + _LightShadowData.xxxx;
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat6.xy);
    u_xlatb6 = 0.0<vs_TEXCOORD5.z;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat6.x = u_xlat10_1.w * u_xlat6.x;
    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat12));
    u_xlat6.x = u_xlat6.x * u_xlat10_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat3.xyz = (-u_xlat2.xyz) * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat3.x = vs_TEXCOORD2.w;
    u_xlat3.y = vs_TEXCOORD3.w;
    u_xlat3.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat18) + (-u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat1.xyw = max(u_xlat1.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat13 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat13 * u_xlat13;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat13) * u_xlat13 + 1.0;
    u_xlat14 = u_xlat1.w * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat19 = (-u_xlat1.w) + 1.0;
    u_xlat2.x = u_xlat1.x * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.y) + 1.0;
    u_xlat7 = u_xlat1.y * u_xlat1.y;
    u_xlat7 = dot(vec2(u_xlat7), vec2(u_xlat13));
    u_xlat7 = u_xlat7 + -0.5;
    u_xlat13 = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat18 = u_xlat18 * u_xlat13;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat19 * u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18 + 1.0;
    u_xlat13 = (-u_xlat1.x) + 1.0;
    u_xlat19 = u_xlat13 * u_xlat13;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat13 = u_xlat13 * u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat7;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 112 math, 6 textures, 6 branches
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 shadowVals_8;
  shadowVals_8.x = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125))).x;
  shadowVals_8.y = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125))).x;
  shadowVals_8.z = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125))).x;
  shadowVals_8.w = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125))).x;
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (shadowVals_8, vec4(((
    sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6))
   * _LightPositionRange.w) * 0.97)));
  vec4 tmpvar_10;
  tmpvar_10 = _LightShadowData.xxxx;
  float tmpvar_11;
  if (tmpvar_9.x) {
    tmpvar_11 = tmpvar_10.x;
  } else {
    tmpvar_11 = 1.0;
  };
  float tmpvar_12;
  if (tmpvar_9.y) {
    tmpvar_12 = tmpvar_10.y;
  } else {
    tmpvar_12 = 1.0;
  };
  float tmpvar_13;
  if (tmpvar_9.z) {
    tmpvar_13 = tmpvar_10.z;
  } else {
    tmpvar_13 = 1.0;
  };
  float tmpvar_14;
  if (tmpvar_9.w) {
    tmpvar_14 = tmpvar_10.w;
  } else {
    tmpvar_14 = 1.0;
  };
  vec4 tmpvar_15;
  tmpvar_15.x = tmpvar_11;
  tmpvar_15.y = tmpvar_12;
  tmpvar_15.z = tmpvar_13;
  tmpvar_15.w = tmpvar_14;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_17 = normalize(tmpvar_6);
  tmpvar_16 = (_LightColor0.xyz * (tmpvar_7.w * dot (tmpvar_15, vec4(0.25, 0.25, 0.25, 0.25))));
  vec3 viewDir_18;
  viewDir_18 = -(tmpvar_5);
  float specularTerm_19;
  float tmpvar_20;
  tmpvar_20 = (1.0 - _Glossiness);
  vec3 tmpvar_21;
  vec3 inVec_22;
  inVec_22 = (tmpvar_17 + viewDir_18);
  tmpvar_21 = (inVec_22 * inversesqrt(max (0.001, 
    dot (inVec_22, inVec_22)
  )));
  float tmpvar_23;
  tmpvar_23 = dot (tmpvar_4, viewDir_18);
  vec3 tmpvar_24;
  if ((tmpvar_23 < 0.0)) {
    tmpvar_24 = (tmpvar_4 + (viewDir_18 * (
      -(tmpvar_23)
     + 1e-05)));
  } else {
    tmpvar_24 = tmpvar_4;
  };
  float tmpvar_25;
  tmpvar_25 = max (0.0, dot (tmpvar_24, tmpvar_17));
  float tmpvar_26;
  tmpvar_26 = max (0.0, dot (tmpvar_24, tmpvar_21));
  float tmpvar_27;
  tmpvar_27 = max (0.0, dot (tmpvar_24, viewDir_18));
  float tmpvar_28;
  tmpvar_28 = max (0.0, dot (tmpvar_17, tmpvar_21));
  float tmpvar_29;
  tmpvar_29 = (tmpvar_20 * tmpvar_20);
  float tmpvar_30;
  tmpvar_30 = (tmpvar_20 * tmpvar_20);
  float tmpvar_31;
  tmpvar_31 = (tmpvar_30 * tmpvar_30);
  float tmpvar_32;
  tmpvar_32 = (((tmpvar_26 * tmpvar_26) * (tmpvar_31 - 1.0)) + 1.0);
  float x_33;
  x_33 = (1.0 - tmpvar_25);
  float x_34;
  x_34 = (1.0 - tmpvar_27);
  float tmpvar_35;
  tmpvar_35 = (0.5 + ((2.0 * tmpvar_28) * (tmpvar_28 * tmpvar_20)));
  float tmpvar_36;
  tmpvar_36 = ((1.0 + (
    (tmpvar_35 - 1.0)
   * 
    ((x_33 * x_33) * ((x_33 * x_33) * x_33))
  )) * (1.0 + (
    (tmpvar_35 - 1.0)
   * 
    ((x_34 * x_34) * ((x_34 * x_34) * x_34))
  )));
  float tmpvar_37;
  tmpvar_37 = (((2.0 / 
    (((tmpvar_25 * (
      (tmpvar_27 * (1.0 - tmpvar_29))
     + tmpvar_29)) + (tmpvar_27 * (
      (tmpvar_25 * (1.0 - tmpvar_29))
     + tmpvar_29))) + 1e-05)
  ) * (tmpvar_31 / 
    (((3.141593 * tmpvar_32) * tmpvar_32) + 1e-07)
  )) * 0.7853982);
  specularTerm_19 = tmpvar_37;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_19 = sqrt(max (0.0001, tmpvar_37));
  };
  float tmpvar_38;
  tmpvar_38 = max (0.0, (specularTerm_19 * tmpvar_25));
  specularTerm_19 = tmpvar_38;
  float x_39;
  x_39 = (1.0 - tmpvar_28);
  vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = ((tmpvar_2 * (tmpvar_16 * 
    (tmpvar_36 * tmpvar_25)
  )) + ((tmpvar_38 * tmpvar_16) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_39 * x_39) * ((x_39 * x_39) * x_39)))
  )));
  vec4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = 1.0;
  gl_FragData[0] = xlat_varoutput_41;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 368
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Matrix 304 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 32 [_LightPositionRange]
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * tmpvar_36).xyz;
  _mtl_o.xlv_TEXCOORD6 = (tmpvar_36.xyz - _mtl_u._LightPositionRange.xyz);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat13;
float u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * 0.970000029;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat1 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.y = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.z = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.w = u_xlat10_2.x;
    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat6.xx);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat3.xyz = (-u_xlat2.xyz) * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat3.x = vs_TEXCOORD2.w;
    u_xlat3.y = vs_TEXCOORD3.w;
    u_xlat3.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat18) + (-u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat1.xyw = max(u_xlat1.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat13 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat13 * u_xlat13;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat13) * u_xlat13 + 1.0;
    u_xlat14 = u_xlat1.w * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat19 = (-u_xlat1.w) + 1.0;
    u_xlat2.x = u_xlat1.x * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.y) + 1.0;
    u_xlat7 = u_xlat1.y * u_xlat1.y;
    u_xlat7 = dot(vec2(u_xlat7), vec2(u_xlat13));
    u_xlat7 = u_xlat7 + -0.5;
    u_xlat13 = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat18 = u_xlat18 * u_xlat13;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat19 * u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18 + 1.0;
    u_xlat13 = (-u_xlat1.x) + 1.0;
    u_xlat19 = u_xlat13 * u_xlat13;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat13 = u_xlat13 * u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat7;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 113 math, 7 textures, 6 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = (tmpvar_7.xyz - _WorldSpaceCameraPos);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD1);
  vec3 tmpvar_6;
  tmpvar_6.x = xlv_TEXCOORD2.w;
  tmpvar_6.y = xlv_TEXCOORD2_1.w;
  tmpvar_6.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_7;
  tmpvar_7 = texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 tmpvar_8;
  tmpvar_8 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  vec4 shadowVals_9;
  shadowVals_9.x = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125))).x;
  shadowVals_9.y = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125))).x;
  shadowVals_9.z = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125))).x;
  shadowVals_9.w = textureCube (_ShadowMapTexture, (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125))).x;
  bvec4 tmpvar_10;
  tmpvar_10 = lessThan (shadowVals_9, vec4(((
    sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6))
   * _LightPositionRange.w) * 0.97)));
  vec4 tmpvar_11;
  tmpvar_11 = _LightShadowData.xxxx;
  float tmpvar_12;
  if (tmpvar_10.x) {
    tmpvar_12 = tmpvar_11.x;
  } else {
    tmpvar_12 = 1.0;
  };
  float tmpvar_13;
  if (tmpvar_10.y) {
    tmpvar_13 = tmpvar_11.y;
  } else {
    tmpvar_13 = 1.0;
  };
  float tmpvar_14;
  if (tmpvar_10.z) {
    tmpvar_14 = tmpvar_11.z;
  } else {
    tmpvar_14 = 1.0;
  };
  float tmpvar_15;
  if (tmpvar_10.w) {
    tmpvar_15 = tmpvar_11.w;
  } else {
    tmpvar_15 = 1.0;
  };
  vec4 tmpvar_16;
  tmpvar_16.x = tmpvar_12;
  tmpvar_16.y = tmpvar_13;
  tmpvar_16.z = tmpvar_14;
  tmpvar_16.w = tmpvar_15;
  vec3 tmpvar_17;
  vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_6);
  tmpvar_17 = (_LightColor0.xyz * ((tmpvar_7.w * tmpvar_8.w) * dot (tmpvar_16, vec4(0.25, 0.25, 0.25, 0.25))));
  vec3 viewDir_19;
  viewDir_19 = -(tmpvar_5);
  float specularTerm_20;
  float tmpvar_21;
  tmpvar_21 = (1.0 - _Glossiness);
  vec3 tmpvar_22;
  vec3 inVec_23;
  inVec_23 = (tmpvar_18 + viewDir_19);
  tmpvar_22 = (inVec_23 * inversesqrt(max (0.001, 
    dot (inVec_23, inVec_23)
  )));
  float tmpvar_24;
  tmpvar_24 = dot (tmpvar_4, viewDir_19);
  vec3 tmpvar_25;
  if ((tmpvar_24 < 0.0)) {
    tmpvar_25 = (tmpvar_4 + (viewDir_19 * (
      -(tmpvar_24)
     + 1e-05)));
  } else {
    tmpvar_25 = tmpvar_4;
  };
  float tmpvar_26;
  tmpvar_26 = max (0.0, dot (tmpvar_25, tmpvar_18));
  float tmpvar_27;
  tmpvar_27 = max (0.0, dot (tmpvar_25, tmpvar_22));
  float tmpvar_28;
  tmpvar_28 = max (0.0, dot (tmpvar_25, viewDir_19));
  float tmpvar_29;
  tmpvar_29 = max (0.0, dot (tmpvar_18, tmpvar_22));
  float tmpvar_30;
  tmpvar_30 = (tmpvar_21 * tmpvar_21);
  float tmpvar_31;
  tmpvar_31 = (tmpvar_21 * tmpvar_21);
  float tmpvar_32;
  tmpvar_32 = (tmpvar_31 * tmpvar_31);
  float tmpvar_33;
  tmpvar_33 = (((tmpvar_27 * tmpvar_27) * (tmpvar_32 - 1.0)) + 1.0);
  float x_34;
  x_34 = (1.0 - tmpvar_26);
  float x_35;
  x_35 = (1.0 - tmpvar_28);
  float tmpvar_36;
  tmpvar_36 = (0.5 + ((2.0 * tmpvar_29) * (tmpvar_29 * tmpvar_21)));
  float tmpvar_37;
  tmpvar_37 = ((1.0 + (
    (tmpvar_36 - 1.0)
   * 
    ((x_34 * x_34) * ((x_34 * x_34) * x_34))
  )) * (1.0 + (
    (tmpvar_36 - 1.0)
   * 
    ((x_35 * x_35) * ((x_35 * x_35) * x_35))
  )));
  float tmpvar_38;
  tmpvar_38 = (((2.0 / 
    (((tmpvar_26 * (
      (tmpvar_28 * (1.0 - tmpvar_30))
     + tmpvar_30)) + (tmpvar_28 * (
      (tmpvar_26 * (1.0 - tmpvar_30))
     + tmpvar_30))) + 1e-05)
  ) * (tmpvar_32 / 
    (((3.141593 * tmpvar_33) * tmpvar_33) + 1e-07)
  )) * 0.7853982);
  specularTerm_20 = tmpvar_38;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    specularTerm_20 = sqrt(max (0.0001, tmpvar_38));
  };
  float tmpvar_39;
  tmpvar_39 = max (0.0, (specularTerm_20 * tmpvar_26));
  specularTerm_20 = tmpvar_39;
  float x_40;
  x_40 = (1.0 - tmpvar_29);
  vec4 tmpvar_41;
  tmpvar_41.w = 1.0;
  tmpvar_41.xyz = ((tmpvar_2 * (tmpvar_17 * 
    (tmpvar_37 * tmpvar_26)
  )) + ((tmpvar_39 * tmpvar_17) * (tmpvar_3 + 
    ((1.0 - tmpvar_3) * ((x_40 * x_40) * ((x_40 * x_40) * x_40)))
  )));
  vec4 xlat_varoutput_42;
  xlat_varoutput_42.xyz = tmpvar_41.xyz;
  xlat_varoutput_42.w = 1.0;
  gl_FragData[0] = xlat_varoutput_42;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 368
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Matrix 304 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 32 [_LightPositionRange]
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 n_15;
  n_15 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_14 = half3(n_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  float3 tmpvar_34;
  tmpvar_34 = (_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w));
  half3 tmpvar_35;
  tmpvar_35 = half3(tmpvar_34);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = (_mtl_u._LightMatrix0 * tmpvar_36).xyz;
  _mtl_o.xlv_TEXCOORD6 = (tmpvar_36.xyz - _mtl_u._LightPositionRange.xyz);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat13;
float u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * 0.970000029;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat1 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.y = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.z = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.w = u_xlat10_2.x;
    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat6.xx);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_6 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_6;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat19 = (-u_xlat18) + 9.99999975e-06;
    u_xlatb18 = u_xlat18<0.0;
    u_xlat3.xyz = (-u_xlat2.xyz) * vec3(u_xlat19) + u_xlat1.xyz;
    u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat3.x = vs_TEXCOORD2.w;
    u_xlat3.y = vs_TEXCOORD3.w;
    u_xlat3.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat18) + (-u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, (-u_xlat2.xyz));
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat1.xyw = max(u_xlat1.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat13 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat13 * u_xlat13;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat13) * u_xlat13 + 1.0;
    u_xlat14 = u_xlat1.w * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat19 = (-u_xlat1.w) + 1.0;
    u_xlat2.x = u_xlat1.x * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.y) + 1.0;
    u_xlat7 = u_xlat1.y * u_xlat1.y;
    u_xlat7 = dot(vec2(u_xlat7), vec2(u_xlat13));
    u_xlat7 = u_xlat7 + -0.5;
    u_xlat13 = u_xlat18 * u_xlat18;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat18 = u_xlat18 * u_xlat13;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat19 * u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18 + 1.0;
    u_xlat13 = (-u_xlat1.x) + 1.0;
    u_xlat19 = u_xlat13 * u_xlat13;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat13 = u_xlat13 * u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat7;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 97 math, 2 textures, 2 branches
Keywords { "POINT" "SHADOWS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(1)]], sampler _mtlsmp__LightTexture0 [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_7;
  tmpvar_7 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_8;
  tmpvar_8 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_7)));
  half atten_9;
  atten_9 = tmpvar_8.w;
  half3 tmpvar_10;
  tmpvar_10 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_11;
  tmpvar_11 = normalize(tmpvar_6);
  tmpvar_10 = (tmpvar_10 * atten_9);
  half3 viewDir_12;
  viewDir_12 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_13;
  half tmpvar_14;
  tmpvar_14 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_15;
  half3 inVec_16;
  inVec_16 = (tmpvar_11 + viewDir_12);
  tmpvar_15 = (inVec_16 * rsqrt(max ((half)0.001, 
    dot (inVec_16, inVec_16)
  )));
  half tmpvar_17;
  tmpvar_17 = dot (tmpvar_5, viewDir_12);
  half3 tmpvar_18;
  if ((tmpvar_17 < (half)0.0)) {
    tmpvar_18 = (tmpvar_5 + (viewDir_12 * (
      -(tmpvar_17)
     + (half)1e-05)));
  } else {
    tmpvar_18 = tmpvar_5;
  };
  half tmpvar_19;
  tmpvar_19 = max ((half)0.0, dot (tmpvar_18, tmpvar_11));
  half tmpvar_20;
  tmpvar_20 = max ((half)0.0, dot (tmpvar_18, tmpvar_15));
  half tmpvar_21;
  tmpvar_21 = max ((half)0.0, dot (tmpvar_18, viewDir_12));
  half tmpvar_22;
  tmpvar_22 = max ((half)0.0, dot (tmpvar_11, tmpvar_15));
  half tmpvar_23;
  tmpvar_23 = (tmpvar_14 * tmpvar_14);
  half tmpvar_24;
  tmpvar_24 = (tmpvar_14 * tmpvar_14);
  half tmpvar_25;
  tmpvar_25 = (tmpvar_24 * tmpvar_24);
  half tmpvar_26;
  tmpvar_26 = (((tmpvar_20 * tmpvar_20) * (tmpvar_25 - (half)1.0)) + (half)1.0);
  half x_27;
  x_27 = ((half)1.0 - tmpvar_19);
  half x_28;
  x_28 = ((half)1.0 - tmpvar_21);
  half tmpvar_29;
  tmpvar_29 = ((half)0.5 + (((half)2.0 * tmpvar_22) * (tmpvar_22 * tmpvar_14)));
  half tmpvar_30;
  tmpvar_30 = (((half)1.0 + (
    (tmpvar_29 - (half)1.0)
   * 
    ((x_27 * x_27) * ((x_27 * x_27) * x_27))
  )) * ((half)1.0 + (
    (tmpvar_29 - (half)1.0)
   * 
    ((x_28 * x_28) * ((x_28 * x_28) * x_28))
  )));
  half tmpvar_31;
  tmpvar_31 = ((((half)2.0 / 
    (((tmpvar_19 * (
      (tmpvar_21 * ((half)1.0 - tmpvar_23))
     + tmpvar_23)) + (tmpvar_21 * (
      (tmpvar_19 * ((half)1.0 - tmpvar_23))
     + tmpvar_23))) + (half)1e-05)
  ) * (tmpvar_25 / 
    ((((half)3.141593 * tmpvar_26) * tmpvar_26) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_13 = tmpvar_31;
  bool tmpvar_32;
  tmpvar_32 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_32) {
    specularTerm_13 = sqrt(max ((half)0.0001, tmpvar_31));
  };
  half tmpvar_33;
  tmpvar_33 = max ((half)0.0, (specularTerm_13 * tmpvar_19));
  specularTerm_13 = tmpvar_33;
  half x_34;
  x_34 = ((half)1.0 - tmpvar_22);
  half4 tmpvar_35;
  tmpvar_35.w = half(1.0);
  tmpvar_35.xyz = ((tmpvar_3 * (tmpvar_10 * 
    (tmpvar_30 * tmpvar_19)
  )) + ((tmpvar_33 * tmpvar_10) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_34 * x_34) * ((x_34 * x_34) * x_34)))
  )));
  half4 xlat_varoutput_36;
  xlat_varoutput_36.xyz = tmpvar_35.xyz;
  xlat_varoutput_36.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_36;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 94 math, 1 textures, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half3 tmpvar_7;
  tmpvar_7 = _mtl_u._LightColor0.xyz;
  half3 viewDir_8;
  viewDir_8 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_9;
  half tmpvar_10;
  tmpvar_10 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_11;
  half3 inVec_12;
  inVec_12 = (tmpvar_6 + viewDir_8);
  tmpvar_11 = (inVec_12 * rsqrt(max ((half)0.001, 
    dot (inVec_12, inVec_12)
  )));
  half tmpvar_13;
  tmpvar_13 = dot (tmpvar_5, viewDir_8);
  half3 tmpvar_14;
  if ((tmpvar_13 < (half)0.0)) {
    tmpvar_14 = (tmpvar_5 + (viewDir_8 * (
      -(tmpvar_13)
     + (half)1e-05)));
  } else {
    tmpvar_14 = tmpvar_5;
  };
  half tmpvar_15;
  tmpvar_15 = max ((half)0.0, dot (tmpvar_14, tmpvar_6));
  half tmpvar_16;
  tmpvar_16 = max ((half)0.0, dot (tmpvar_14, tmpvar_11));
  half tmpvar_17;
  tmpvar_17 = max ((half)0.0, dot (tmpvar_14, viewDir_8));
  half tmpvar_18;
  tmpvar_18 = max ((half)0.0, dot (tmpvar_6, tmpvar_11));
  half tmpvar_19;
  tmpvar_19 = (tmpvar_10 * tmpvar_10);
  half tmpvar_20;
  tmpvar_20 = (tmpvar_10 * tmpvar_10);
  half tmpvar_21;
  tmpvar_21 = (tmpvar_20 * tmpvar_20);
  half tmpvar_22;
  tmpvar_22 = (((tmpvar_16 * tmpvar_16) * (tmpvar_21 - (half)1.0)) + (half)1.0);
  half x_23;
  x_23 = ((half)1.0 - tmpvar_15);
  half x_24;
  x_24 = ((half)1.0 - tmpvar_17);
  half tmpvar_25;
  tmpvar_25 = ((half)0.5 + (((half)2.0 * tmpvar_18) * (tmpvar_18 * tmpvar_10)));
  half tmpvar_26;
  tmpvar_26 = (((half)1.0 + (
    (tmpvar_25 - (half)1.0)
   * 
    ((x_23 * x_23) * ((x_23 * x_23) * x_23))
  )) * ((half)1.0 + (
    (tmpvar_25 - (half)1.0)
   * 
    ((x_24 * x_24) * ((x_24 * x_24) * x_24))
  )));
  half tmpvar_27;
  tmpvar_27 = ((((half)2.0 / 
    (((tmpvar_15 * (
      (tmpvar_17 * ((half)1.0 - tmpvar_19))
     + tmpvar_19)) + (tmpvar_17 * (
      (tmpvar_15 * ((half)1.0 - tmpvar_19))
     + tmpvar_19))) + (half)1e-05)
  ) * (tmpvar_21 / 
    ((((half)3.141593 * tmpvar_22) * tmpvar_22) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_9 = tmpvar_27;
  bool tmpvar_28;
  tmpvar_28 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_28) {
    specularTerm_9 = sqrt(max ((half)0.0001, tmpvar_27));
  };
  half tmpvar_29;
  tmpvar_29 = max ((half)0.0, (specularTerm_9 * tmpvar_15));
  specularTerm_9 = tmpvar_29;
  half x_30;
  x_30 = ((half)1.0 - tmpvar_18);
  half4 tmpvar_31;
  tmpvar_31.w = half(1.0);
  tmpvar_31.xyz = ((tmpvar_3 * (tmpvar_7 * 
    (tmpvar_26 * tmpvar_15)
  )) + ((tmpvar_29 * tmpvar_7) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_30 * x_30) * ((x_30 * x_30) * x_30)))
  )));
  half4 xlat_varoutput_32;
  xlat_varoutput_32.xyz = tmpvar_31.xyz;
  xlat_varoutput_32.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_32;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 103 math, 3 textures, 2 branches
Keywords { "SPOT" "SHADOWS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(1)]], sampler _mtlsmp__LightTexture0 [[sampler(1)]]
  ,   texture2d<half> _LightTextureB0 [[texture(2)]], sampler _mtlsmp__LightTextureB0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_7;
  float2 P_8;
  P_8 = ((_mtl_i.xlv_TEXCOORD5.xy / _mtl_i.xlv_TEXCOORD5.w) + 0.5);
  tmpvar_7 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_8));
  float tmpvar_9;
  tmpvar_9 = dot (_mtl_i.xlv_TEXCOORD5.xyz, _mtl_i.xlv_TEXCOORD5.xyz);
  half4 tmpvar_10;
  tmpvar_10 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_9)));
  half atten_11;
  atten_11 = half(((float(
    (_mtl_i.xlv_TEXCOORD5.z > 0.0)
  ) * (float)tmpvar_7.w) * (float)tmpvar_10.w));
  half3 tmpvar_12;
  tmpvar_12 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_6);
  tmpvar_12 = (tmpvar_12 * atten_11);
  half3 viewDir_14;
  viewDir_14 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_15;
  half tmpvar_16;
  tmpvar_16 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_17;
  half3 inVec_18;
  inVec_18 = (tmpvar_13 + viewDir_14);
  tmpvar_17 = (inVec_18 * rsqrt(max ((half)0.001, 
    dot (inVec_18, inVec_18)
  )));
  half tmpvar_19;
  tmpvar_19 = dot (tmpvar_5, viewDir_14);
  half3 tmpvar_20;
  if ((tmpvar_19 < (half)0.0)) {
    tmpvar_20 = (tmpvar_5 + (viewDir_14 * (
      -(tmpvar_19)
     + (half)1e-05)));
  } else {
    tmpvar_20 = tmpvar_5;
  };
  half tmpvar_21;
  tmpvar_21 = max ((half)0.0, dot (tmpvar_20, tmpvar_13));
  half tmpvar_22;
  tmpvar_22 = max ((half)0.0, dot (tmpvar_20, tmpvar_17));
  half tmpvar_23;
  tmpvar_23 = max ((half)0.0, dot (tmpvar_20, viewDir_14));
  half tmpvar_24;
  tmpvar_24 = max ((half)0.0, dot (tmpvar_13, tmpvar_17));
  half tmpvar_25;
  tmpvar_25 = (tmpvar_16 * tmpvar_16);
  half tmpvar_26;
  tmpvar_26 = (tmpvar_16 * tmpvar_16);
  half tmpvar_27;
  tmpvar_27 = (tmpvar_26 * tmpvar_26);
  half tmpvar_28;
  tmpvar_28 = (((tmpvar_22 * tmpvar_22) * (tmpvar_27 - (half)1.0)) + (half)1.0);
  half x_29;
  x_29 = ((half)1.0 - tmpvar_21);
  half x_30;
  x_30 = ((half)1.0 - tmpvar_23);
  half tmpvar_31;
  tmpvar_31 = ((half)0.5 + (((half)2.0 * tmpvar_24) * (tmpvar_24 * tmpvar_16)));
  half tmpvar_32;
  tmpvar_32 = (((half)1.0 + (
    (tmpvar_31 - (half)1.0)
   * 
    ((x_29 * x_29) * ((x_29 * x_29) * x_29))
  )) * ((half)1.0 + (
    (tmpvar_31 - (half)1.0)
   * 
    ((x_30 * x_30) * ((x_30 * x_30) * x_30))
  )));
  half tmpvar_33;
  tmpvar_33 = ((((half)2.0 / 
    (((tmpvar_21 * (
      (tmpvar_23 * ((half)1.0 - tmpvar_25))
     + tmpvar_25)) + (tmpvar_23 * (
      (tmpvar_21 * ((half)1.0 - tmpvar_25))
     + tmpvar_25))) + (half)1e-05)
  ) * (tmpvar_27 / 
    ((((half)3.141593 * tmpvar_28) * tmpvar_28) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_15 = tmpvar_33;
  bool tmpvar_34;
  tmpvar_34 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_34) {
    specularTerm_15 = sqrt(max ((half)0.0001, tmpvar_33));
  };
  half tmpvar_35;
  tmpvar_35 = max ((half)0.0, (specularTerm_15 * tmpvar_21));
  specularTerm_15 = tmpvar_35;
  half x_36;
  x_36 = ((half)1.0 - tmpvar_24);
  half4 tmpvar_37;
  tmpvar_37.w = half(1.0);
  tmpvar_37.xyz = ((tmpvar_3 * (tmpvar_12 * 
    (tmpvar_32 * tmpvar_21)
  )) + ((tmpvar_35 * tmpvar_12) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_36 * x_36) * ((x_36 * x_36) * x_36)))
  )));
  half4 xlat_varoutput_38;
  xlat_varoutput_38.xyz = tmpvar_37.xyz;
  xlat_varoutput_38.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_38;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 98 math, 3 textures, 2 branches
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texturecube<half> _LightTexture0 [[texture(1)]], sampler _mtlsmp__LightTexture0 [[sampler(1)]]
  ,   texture2d<half> _LightTextureB0 [[texture(2)]], sampler _mtlsmp__LightTextureB0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_7;
  tmpvar_7 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_8;
  tmpvar_8 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_7)));
  half4 tmpvar_9;
  tmpvar_9 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD5));
  half atten_10;
  atten_10 = (tmpvar_8.w * tmpvar_9.w);
  half3 tmpvar_11;
  tmpvar_11 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_6);
  tmpvar_11 = (tmpvar_11 * atten_10);
  half3 viewDir_13;
  viewDir_13 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_14;
  half tmpvar_15;
  tmpvar_15 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_16;
  half3 inVec_17;
  inVec_17 = (tmpvar_12 + viewDir_13);
  tmpvar_16 = (inVec_17 * rsqrt(max ((half)0.001, 
    dot (inVec_17, inVec_17)
  )));
  half tmpvar_18;
  tmpvar_18 = dot (tmpvar_5, viewDir_13);
  half3 tmpvar_19;
  if ((tmpvar_18 < (half)0.0)) {
    tmpvar_19 = (tmpvar_5 + (viewDir_13 * (
      -(tmpvar_18)
     + (half)1e-05)));
  } else {
    tmpvar_19 = tmpvar_5;
  };
  half tmpvar_20;
  tmpvar_20 = max ((half)0.0, dot (tmpvar_19, tmpvar_12));
  half tmpvar_21;
  tmpvar_21 = max ((half)0.0, dot (tmpvar_19, tmpvar_16));
  half tmpvar_22;
  tmpvar_22 = max ((half)0.0, dot (tmpvar_19, viewDir_13));
  half tmpvar_23;
  tmpvar_23 = max ((half)0.0, dot (tmpvar_12, tmpvar_16));
  half tmpvar_24;
  tmpvar_24 = (tmpvar_15 * tmpvar_15);
  half tmpvar_25;
  tmpvar_25 = (tmpvar_15 * tmpvar_15);
  half tmpvar_26;
  tmpvar_26 = (tmpvar_25 * tmpvar_25);
  half tmpvar_27;
  tmpvar_27 = (((tmpvar_21 * tmpvar_21) * (tmpvar_26 - (half)1.0)) + (half)1.0);
  half x_28;
  x_28 = ((half)1.0 - tmpvar_20);
  half x_29;
  x_29 = ((half)1.0 - tmpvar_22);
  half tmpvar_30;
  tmpvar_30 = ((half)0.5 + (((half)2.0 * tmpvar_23) * (tmpvar_23 * tmpvar_15)));
  half tmpvar_31;
  tmpvar_31 = (((half)1.0 + (
    (tmpvar_30 - (half)1.0)
   * 
    ((x_28 * x_28) * ((x_28 * x_28) * x_28))
  )) * ((half)1.0 + (
    (tmpvar_30 - (half)1.0)
   * 
    ((x_29 * x_29) * ((x_29 * x_29) * x_29))
  )));
  half tmpvar_32;
  tmpvar_32 = ((((half)2.0 / 
    (((tmpvar_20 * (
      (tmpvar_22 * ((half)1.0 - tmpvar_24))
     + tmpvar_24)) + (tmpvar_22 * (
      (tmpvar_20 * ((half)1.0 - tmpvar_24))
     + tmpvar_24))) + (half)1e-05)
  ) * (tmpvar_26 / 
    ((((half)3.141593 * tmpvar_27) * tmpvar_27) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_14 = tmpvar_32;
  bool tmpvar_33;
  tmpvar_33 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_33) {
    specularTerm_14 = sqrt(max ((half)0.0001, tmpvar_32));
  };
  half tmpvar_34;
  tmpvar_34 = max ((half)0.0, (specularTerm_14 * tmpvar_20));
  specularTerm_14 = tmpvar_34;
  half x_35;
  x_35 = ((half)1.0 - tmpvar_23);
  half4 tmpvar_36;
  tmpvar_36.w = half(1.0);
  tmpvar_36.xyz = ((tmpvar_3 * (tmpvar_11 * 
    (tmpvar_31 * tmpvar_20)
  )) + ((tmpvar_34 * tmpvar_11) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_35 * x_35) * ((x_35 * x_35) * x_35)))
  )));
  half4 xlat_varoutput_37;
  xlat_varoutput_37.xyz = tmpvar_36.xyz;
  xlat_varoutput_37.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_37;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 95 math, 2 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(1)]], sampler _mtlsmp__LightTexture0 [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_7;
  tmpvar_7 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD5));
  half atten_8;
  atten_8 = tmpvar_7.w;
  half3 tmpvar_9;
  tmpvar_9 = _mtl_u._LightColor0.xyz;
  tmpvar_9 = (tmpvar_9 * atten_8);
  half3 viewDir_10;
  viewDir_10 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_11;
  half tmpvar_12;
  tmpvar_12 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_13;
  half3 inVec_14;
  inVec_14 = (tmpvar_6 + viewDir_10);
  tmpvar_13 = (inVec_14 * rsqrt(max ((half)0.001, 
    dot (inVec_14, inVec_14)
  )));
  half tmpvar_15;
  tmpvar_15 = dot (tmpvar_5, viewDir_10);
  half3 tmpvar_16;
  if ((tmpvar_15 < (half)0.0)) {
    tmpvar_16 = (tmpvar_5 + (viewDir_10 * (
      -(tmpvar_15)
     + (half)1e-05)));
  } else {
    tmpvar_16 = tmpvar_5;
  };
  half tmpvar_17;
  tmpvar_17 = max ((half)0.0, dot (tmpvar_16, tmpvar_6));
  half tmpvar_18;
  tmpvar_18 = max ((half)0.0, dot (tmpvar_16, tmpvar_13));
  half tmpvar_19;
  tmpvar_19 = max ((half)0.0, dot (tmpvar_16, viewDir_10));
  half tmpvar_20;
  tmpvar_20 = max ((half)0.0, dot (tmpvar_6, tmpvar_13));
  half tmpvar_21;
  tmpvar_21 = (tmpvar_12 * tmpvar_12);
  half tmpvar_22;
  tmpvar_22 = (tmpvar_12 * tmpvar_12);
  half tmpvar_23;
  tmpvar_23 = (tmpvar_22 * tmpvar_22);
  half tmpvar_24;
  tmpvar_24 = (((tmpvar_18 * tmpvar_18) * (tmpvar_23 - (half)1.0)) + (half)1.0);
  half x_25;
  x_25 = ((half)1.0 - tmpvar_17);
  half x_26;
  x_26 = ((half)1.0 - tmpvar_19);
  half tmpvar_27;
  tmpvar_27 = ((half)0.5 + (((half)2.0 * tmpvar_20) * (tmpvar_20 * tmpvar_12)));
  half tmpvar_28;
  tmpvar_28 = (((half)1.0 + (
    (tmpvar_27 - (half)1.0)
   * 
    ((x_25 * x_25) * ((x_25 * x_25) * x_25))
  )) * ((half)1.0 + (
    (tmpvar_27 - (half)1.0)
   * 
    ((x_26 * x_26) * ((x_26 * x_26) * x_26))
  )));
  half tmpvar_29;
  tmpvar_29 = ((((half)2.0 / 
    (((tmpvar_17 * (
      (tmpvar_19 * ((half)1.0 - tmpvar_21))
     + tmpvar_21)) + (tmpvar_19 * (
      (tmpvar_17 * ((half)1.0 - tmpvar_21))
     + tmpvar_21))) + (half)1e-05)
  ) * (tmpvar_23 / 
    ((((half)3.141593 * tmpvar_24) * tmpvar_24) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_11 = tmpvar_29;
  bool tmpvar_30;
  tmpvar_30 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_30) {
    specularTerm_11 = sqrt(max ((half)0.0001, tmpvar_29));
  };
  half tmpvar_31;
  tmpvar_31 = max ((half)0.0, (specularTerm_11 * tmpvar_17));
  specularTerm_11 = tmpvar_31;
  half x_32;
  x_32 = ((half)1.0 - tmpvar_20);
  half4 tmpvar_33;
  tmpvar_33.w = half(1.0);
  tmpvar_33.xyz = ((tmpvar_3 * (tmpvar_9 * 
    (tmpvar_28 * tmpvar_17)
  )) + ((tmpvar_31 * tmpvar_9) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_32 * x_32) * ((x_32 * x_32) * x_32)))
  )));
  half4 xlat_varoutput_34;
  xlat_varoutput_34.xyz = tmpvar_33.xyz;
  xlat_varoutput_34.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_34;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 107 math, 4 textures, 2 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
ConstBuffer "$Globals" 44
VectorHalf 0 [_LightShadowData] 4
VectorHalf 8 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 16 [unity_ColorSpaceLuminance] 4
VectorHalf 24 [_LightColor0] 4
VectorHalf 32 [_Color] 4
ScalarHalf 40 [_Metallic]
ScalarHalf 42 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::less);
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   depth2d<float> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]]
  ,   texture2d<half> _LightTextureB0 [[texture(3)]], sampler _mtlsmp__LightTextureB0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_7;
  float2 P_8;
  P_8 = ((_mtl_i.xlv_TEXCOORD5.xy / _mtl_i.xlv_TEXCOORD5.w) + 0.5);
  tmpvar_7 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_8));
  float tmpvar_9;
  tmpvar_9 = dot (_mtl_i.xlv_TEXCOORD5.xyz, _mtl_i.xlv_TEXCOORD5.xyz);
  half4 tmpvar_10;
  tmpvar_10 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_9)));
  half tmpvar_11;
  half shadow_12;
  half tmpvar_13;
  tmpvar_13 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, (float2)(_mtl_i.xlv_TEXCOORD6).xy / (float)(_mtl_i.xlv_TEXCOORD6).w, (float)(_mtl_i.xlv_TEXCOORD6).z / (float)(_mtl_i.xlv_TEXCOORD6).w);
  shadow_12 = (_mtl_u._LightShadowData.x + (tmpvar_13 * ((half)1.0 - _mtl_u._LightShadowData.x)));
  tmpvar_11 = shadow_12;
  half atten_14;
  atten_14 = half((((
    float((_mtl_i.xlv_TEXCOORD5.z > 0.0))
   * (float)tmpvar_7.w) * (float)tmpvar_10.w) * (float)tmpvar_11));
  half3 tmpvar_15;
  tmpvar_15 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_16;
  tmpvar_16 = normalize(tmpvar_6);
  tmpvar_15 = (tmpvar_15 * atten_14);
  half3 viewDir_17;
  viewDir_17 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_18;
  half tmpvar_19;
  tmpvar_19 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_20;
  half3 inVec_21;
  inVec_21 = (tmpvar_16 + viewDir_17);
  tmpvar_20 = (inVec_21 * rsqrt(max ((half)0.001, 
    dot (inVec_21, inVec_21)
  )));
  half tmpvar_22;
  tmpvar_22 = dot (tmpvar_5, viewDir_17);
  half3 tmpvar_23;
  if ((tmpvar_22 < (half)0.0)) {
    tmpvar_23 = (tmpvar_5 + (viewDir_17 * (
      -(tmpvar_22)
     + (half)1e-05)));
  } else {
    tmpvar_23 = tmpvar_5;
  };
  half tmpvar_24;
  tmpvar_24 = max ((half)0.0, dot (tmpvar_23, tmpvar_16));
  half tmpvar_25;
  tmpvar_25 = max ((half)0.0, dot (tmpvar_23, tmpvar_20));
  half tmpvar_26;
  tmpvar_26 = max ((half)0.0, dot (tmpvar_23, viewDir_17));
  half tmpvar_27;
  tmpvar_27 = max ((half)0.0, dot (tmpvar_16, tmpvar_20));
  half tmpvar_28;
  tmpvar_28 = (tmpvar_19 * tmpvar_19);
  half tmpvar_29;
  tmpvar_29 = (tmpvar_19 * tmpvar_19);
  half tmpvar_30;
  tmpvar_30 = (tmpvar_29 * tmpvar_29);
  half tmpvar_31;
  tmpvar_31 = (((tmpvar_25 * tmpvar_25) * (tmpvar_30 - (half)1.0)) + (half)1.0);
  half x_32;
  x_32 = ((half)1.0 - tmpvar_24);
  half x_33;
  x_33 = ((half)1.0 - tmpvar_26);
  half tmpvar_34;
  tmpvar_34 = ((half)0.5 + (((half)2.0 * tmpvar_27) * (tmpvar_27 * tmpvar_19)));
  half tmpvar_35;
  tmpvar_35 = (((half)1.0 + (
    (tmpvar_34 - (half)1.0)
   * 
    ((x_32 * x_32) * ((x_32 * x_32) * x_32))
  )) * ((half)1.0 + (
    (tmpvar_34 - (half)1.0)
   * 
    ((x_33 * x_33) * ((x_33 * x_33) * x_33))
  )));
  half tmpvar_36;
  tmpvar_36 = ((((half)2.0 / 
    (((tmpvar_24 * (
      (tmpvar_26 * ((half)1.0 - tmpvar_28))
     + tmpvar_28)) + (tmpvar_26 * (
      (tmpvar_24 * ((half)1.0 - tmpvar_28))
     + tmpvar_28))) + (half)1e-05)
  ) * (tmpvar_30 / 
    ((((half)3.141593 * tmpvar_31) * tmpvar_31) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_18 = tmpvar_36;
  bool tmpvar_37;
  tmpvar_37 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_37) {
    specularTerm_18 = sqrt(max ((half)0.0001, tmpvar_36));
  };
  half tmpvar_38;
  tmpvar_38 = max ((half)0.0, (specularTerm_18 * tmpvar_24));
  specularTerm_18 = tmpvar_38;
  half x_39;
  x_39 = ((half)1.0 - tmpvar_27);
  half4 tmpvar_40;
  tmpvar_40.w = half(1.0);
  tmpvar_40.xyz = ((tmpvar_3 * (tmpvar_15 * 
    (tmpvar_35 * tmpvar_24)
  )) + ((tmpvar_38 * tmpvar_15) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_39 * x_39) * ((x_39 * x_39) * x_39)))
  )));
  half4 xlat_varoutput_41;
  xlat_varoutput_41.xyz = tmpvar_40.xyz;
  xlat_varoutput_41.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_41;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 95 math, 2 textures, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half tmpvar_7;
  tmpvar_7 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, ((float2)(_mtl_i.xlv_TEXCOORD5).xy / (float)(_mtl_i.xlv_TEXCOORD5).w)).x;
  half atten_8;
  atten_8 = tmpvar_7;
  half3 tmpvar_9;
  tmpvar_9 = _mtl_u._LightColor0.xyz;
  tmpvar_9 = (tmpvar_9 * atten_8);
  half3 viewDir_10;
  viewDir_10 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_11;
  half tmpvar_12;
  tmpvar_12 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_13;
  half3 inVec_14;
  inVec_14 = (tmpvar_6 + viewDir_10);
  tmpvar_13 = (inVec_14 * rsqrt(max ((half)0.001, 
    dot (inVec_14, inVec_14)
  )));
  half tmpvar_15;
  tmpvar_15 = dot (tmpvar_5, viewDir_10);
  half3 tmpvar_16;
  if ((tmpvar_15 < (half)0.0)) {
    tmpvar_16 = (tmpvar_5 + (viewDir_10 * (
      -(tmpvar_15)
     + (half)1e-05)));
  } else {
    tmpvar_16 = tmpvar_5;
  };
  half tmpvar_17;
  tmpvar_17 = max ((half)0.0, dot (tmpvar_16, tmpvar_6));
  half tmpvar_18;
  tmpvar_18 = max ((half)0.0, dot (tmpvar_16, tmpvar_13));
  half tmpvar_19;
  tmpvar_19 = max ((half)0.0, dot (tmpvar_16, viewDir_10));
  half tmpvar_20;
  tmpvar_20 = max ((half)0.0, dot (tmpvar_6, tmpvar_13));
  half tmpvar_21;
  tmpvar_21 = (tmpvar_12 * tmpvar_12);
  half tmpvar_22;
  tmpvar_22 = (tmpvar_12 * tmpvar_12);
  half tmpvar_23;
  tmpvar_23 = (tmpvar_22 * tmpvar_22);
  half tmpvar_24;
  tmpvar_24 = (((tmpvar_18 * tmpvar_18) * (tmpvar_23 - (half)1.0)) + (half)1.0);
  half x_25;
  x_25 = ((half)1.0 - tmpvar_17);
  half x_26;
  x_26 = ((half)1.0 - tmpvar_19);
  half tmpvar_27;
  tmpvar_27 = ((half)0.5 + (((half)2.0 * tmpvar_20) * (tmpvar_20 * tmpvar_12)));
  half tmpvar_28;
  tmpvar_28 = (((half)1.0 + (
    (tmpvar_27 - (half)1.0)
   * 
    ((x_25 * x_25) * ((x_25 * x_25) * x_25))
  )) * ((half)1.0 + (
    (tmpvar_27 - (half)1.0)
   * 
    ((x_26 * x_26) * ((x_26 * x_26) * x_26))
  )));
  half tmpvar_29;
  tmpvar_29 = ((((half)2.0 / 
    (((tmpvar_17 * (
      (tmpvar_19 * ((half)1.0 - tmpvar_21))
     + tmpvar_21)) + (tmpvar_19 * (
      (tmpvar_17 * ((half)1.0 - tmpvar_21))
     + tmpvar_21))) + (half)1e-05)
  ) * (tmpvar_23 / 
    ((((half)3.141593 * tmpvar_24) * tmpvar_24) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_11 = tmpvar_29;
  bool tmpvar_30;
  tmpvar_30 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_30) {
    specularTerm_11 = sqrt(max ((half)0.0001, tmpvar_29));
  };
  half tmpvar_31;
  tmpvar_31 = max ((half)0.0, (specularTerm_11 * tmpvar_17));
  specularTerm_11 = tmpvar_31;
  half x_32;
  x_32 = ((half)1.0 - tmpvar_20);
  half4 tmpvar_33;
  tmpvar_33.w = half(1.0);
  tmpvar_33.xyz = ((tmpvar_3 * (tmpvar_9 * 
    (tmpvar_28 * tmpvar_17)
  )) + ((tmpvar_31 * tmpvar_9) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_32 * x_32) * ((x_32 * x_32) * x_32)))
  )));
  half4 xlat_varoutput_34;
  xlat_varoutput_34.xyz = tmpvar_33.xyz;
  xlat_varoutput_34.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_34;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 96 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
ConstBuffer "$Globals" 36
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [unity_ColorSpaceLuminance] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_7;
  tmpvar_7 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD5));
  half4 tmpvar_8;
  tmpvar_8 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, ((float2)(_mtl_i.xlv_TEXCOORD6).xy / (float)(_mtl_i.xlv_TEXCOORD6).w));
  half atten_9;
  atten_9 = (tmpvar_7.w * tmpvar_8.x);
  half3 tmpvar_10;
  tmpvar_10 = _mtl_u._LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * atten_9);
  half3 viewDir_11;
  viewDir_11 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_12;
  half tmpvar_13;
  tmpvar_13 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_14;
  half3 inVec_15;
  inVec_15 = (tmpvar_6 + viewDir_11);
  tmpvar_14 = (inVec_15 * rsqrt(max ((half)0.001, 
    dot (inVec_15, inVec_15)
  )));
  half tmpvar_16;
  tmpvar_16 = dot (tmpvar_5, viewDir_11);
  half3 tmpvar_17;
  if ((tmpvar_16 < (half)0.0)) {
    tmpvar_17 = (tmpvar_5 + (viewDir_11 * (
      -(tmpvar_16)
     + (half)1e-05)));
  } else {
    tmpvar_17 = tmpvar_5;
  };
  half tmpvar_18;
  tmpvar_18 = max ((half)0.0, dot (tmpvar_17, tmpvar_6));
  half tmpvar_19;
  tmpvar_19 = max ((half)0.0, dot (tmpvar_17, tmpvar_14));
  half tmpvar_20;
  tmpvar_20 = max ((half)0.0, dot (tmpvar_17, viewDir_11));
  half tmpvar_21;
  tmpvar_21 = max ((half)0.0, dot (tmpvar_6, tmpvar_14));
  half tmpvar_22;
  tmpvar_22 = (tmpvar_13 * tmpvar_13);
  half tmpvar_23;
  tmpvar_23 = (tmpvar_13 * tmpvar_13);
  half tmpvar_24;
  tmpvar_24 = (tmpvar_23 * tmpvar_23);
  half tmpvar_25;
  tmpvar_25 = (((tmpvar_19 * tmpvar_19) * (tmpvar_24 - (half)1.0)) + (half)1.0);
  half x_26;
  x_26 = ((half)1.0 - tmpvar_18);
  half x_27;
  x_27 = ((half)1.0 - tmpvar_20);
  half tmpvar_28;
  tmpvar_28 = ((half)0.5 + (((half)2.0 * tmpvar_21) * (tmpvar_21 * tmpvar_13)));
  half tmpvar_29;
  tmpvar_29 = (((half)1.0 + (
    (tmpvar_28 - (half)1.0)
   * 
    ((x_26 * x_26) * ((x_26 * x_26) * x_26))
  )) * ((half)1.0 + (
    (tmpvar_28 - (half)1.0)
   * 
    ((x_27 * x_27) * ((x_27 * x_27) * x_27))
  )));
  half tmpvar_30;
  tmpvar_30 = ((((half)2.0 / 
    (((tmpvar_18 * (
      (tmpvar_20 * ((half)1.0 - tmpvar_22))
     + tmpvar_22)) + (tmpvar_20 * (
      (tmpvar_18 * ((half)1.0 - tmpvar_22))
     + tmpvar_22))) + (half)1e-05)
  ) * (tmpvar_24 / 
    ((((half)3.141593 * tmpvar_25) * tmpvar_25) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_12 = tmpvar_30;
  bool tmpvar_31;
  tmpvar_31 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_31) {
    specularTerm_12 = sqrt(max ((half)0.0001, tmpvar_30));
  };
  half tmpvar_32;
  tmpvar_32 = max ((half)0.0, (specularTerm_12 * tmpvar_18));
  specularTerm_12 = tmpvar_32;
  half x_33;
  x_33 = ((half)1.0 - tmpvar_21);
  half4 tmpvar_34;
  tmpvar_34.w = half(1.0);
  tmpvar_34.xyz = ((tmpvar_3 * (tmpvar_10 * 
    (tmpvar_29 * tmpvar_18)
  )) + ((tmpvar_32 * tmpvar_10) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_33 * x_33) * ((x_33 * x_33) * x_33)))
  )));
  half4 xlat_varoutput_35;
  xlat_varoutput_35.xyz = tmpvar_34.xyz;
  xlat_varoutput_35.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_35;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 104 math, 3 textures, 3 branches
Keywords { "POINT" "SHADOWS_CUBE" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
ConstBuffer "$Globals" 60
Vector 0 [_LightPositionRange]
VectorHalf 16 [_LightShadowData] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_LightColor0] 4
VectorHalf 48 [_Color] 4
ScalarHalf 56 [_Metallic]
ScalarHalf 58 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texturecube<float> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6 = normalize(_mtl_i.xlv_TEXCOORD1);
  half3 tmpvar_7;
  tmpvar_7.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_7.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_7.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_8;
  tmpvar_8 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_9;
  tmpvar_9 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_8)));
  float mydist_10;
  mydist_10 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD6, _mtl_i.xlv_TEXCOORD6)
  ) * _mtl_u._LightPositionRange.w) * 0.97);
  float4 tmpvar_11;
  tmpvar_11 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)(_mtl_i.xlv_TEXCOORD6));
  half tmpvar_12;
  if ((tmpvar_11.x < mydist_10)) {
    tmpvar_12 = _mtl_u._LightShadowData.x;
  } else {
    tmpvar_12 = half(1.0);
  };
  half3 tmpvar_13;
  tmpvar_13 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_14;
  tmpvar_14 = normalize(tmpvar_7);
  tmpvar_13 = (tmpvar_13 * (tmpvar_9.w * tmpvar_12));
  half3 viewDir_15;
  viewDir_15 = -(tmpvar_6);
  half specularTerm_16;
  half tmpvar_17;
  tmpvar_17 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_18;
  half3 inVec_19;
  inVec_19 = (tmpvar_14 + viewDir_15);
  tmpvar_18 = (inVec_19 * rsqrt(max ((half)0.001, 
    dot (inVec_19, inVec_19)
  )));
  half tmpvar_20;
  tmpvar_20 = dot (tmpvar_5, viewDir_15);
  half3 tmpvar_21;
  if ((tmpvar_20 < (half)0.0)) {
    tmpvar_21 = (tmpvar_5 + (viewDir_15 * (
      -(tmpvar_20)
     + (half)1e-05)));
  } else {
    tmpvar_21 = tmpvar_5;
  };
  half tmpvar_22;
  tmpvar_22 = max ((half)0.0, dot (tmpvar_21, tmpvar_14));
  half tmpvar_23;
  tmpvar_23 = max ((half)0.0, dot (tmpvar_21, tmpvar_18));
  half tmpvar_24;
  tmpvar_24 = max ((half)0.0, dot (tmpvar_21, viewDir_15));
  half tmpvar_25;
  tmpvar_25 = max ((half)0.0, dot (tmpvar_14, tmpvar_18));
  half tmpvar_26;
  tmpvar_26 = (tmpvar_17 * tmpvar_17);
  half tmpvar_27;
  tmpvar_27 = (tmpvar_17 * tmpvar_17);
  half tmpvar_28;
  tmpvar_28 = (tmpvar_27 * tmpvar_27);
  half tmpvar_29;
  tmpvar_29 = (((tmpvar_23 * tmpvar_23) * (tmpvar_28 - (half)1.0)) + (half)1.0);
  half x_30;
  x_30 = ((half)1.0 - tmpvar_22);
  half x_31;
  x_31 = ((half)1.0 - tmpvar_24);
  half tmpvar_32;
  tmpvar_32 = ((half)0.5 + (((half)2.0 * tmpvar_25) * (tmpvar_25 * tmpvar_17)));
  half tmpvar_33;
  tmpvar_33 = (((half)1.0 + (
    (tmpvar_32 - (half)1.0)
   * 
    ((x_30 * x_30) * ((x_30 * x_30) * x_30))
  )) * ((half)1.0 + (
    (tmpvar_32 - (half)1.0)
   * 
    ((x_31 * x_31) * ((x_31 * x_31) * x_31))
  )));
  half tmpvar_34;
  tmpvar_34 = ((((half)2.0 / 
    (((tmpvar_22 * (
      (tmpvar_24 * ((half)1.0 - tmpvar_26))
     + tmpvar_26)) + (tmpvar_24 * (
      (tmpvar_22 * ((half)1.0 - tmpvar_26))
     + tmpvar_26))) + (half)1e-05)
  ) * (tmpvar_28 / 
    ((((half)3.141593 * tmpvar_29) * tmpvar_29) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_16 = tmpvar_34;
  bool tmpvar_35;
  tmpvar_35 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_35) {
    specularTerm_16 = sqrt(max ((half)0.0001, tmpvar_34));
  };
  half tmpvar_36;
  tmpvar_36 = max ((half)0.0, (specularTerm_16 * tmpvar_22));
  specularTerm_16 = tmpvar_36;
  half x_37;
  x_37 = ((half)1.0 - tmpvar_25);
  half4 tmpvar_38;
  tmpvar_38.w = half(1.0);
  tmpvar_38.xyz = ((tmpvar_3 * (tmpvar_13 * 
    (tmpvar_33 * tmpvar_22)
  )) + ((tmpvar_36 * tmpvar_13) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_37 * x_37) * ((x_37 * x_37) * x_37)))
  )));
  half4 xlat_varoutput_39;
  xlat_varoutput_39.xyz = tmpvar_38.xyz;
  xlat_varoutput_39.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_39;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 105 math, 4 textures, 3 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_LightTextureB0] 2D 3
ConstBuffer "$Globals" 60
Vector 0 [_LightPositionRange]
VectorHalf 16 [_LightShadowData] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_LightColor0] 4
VectorHalf 48 [_Color] 4
ScalarHalf 56 [_Metallic]
ScalarHalf 58 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texturecube<float> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texturecube<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]]
  ,   texture2d<half> _LightTextureB0 [[texture(3)]], sampler _mtlsmp__LightTextureB0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6 = normalize(_mtl_i.xlv_TEXCOORD1);
  half3 tmpvar_7;
  tmpvar_7.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_7.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_7.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_8;
  tmpvar_8 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_9;
  tmpvar_9 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_8)));
  half4 tmpvar_10;
  tmpvar_10 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD5));
  float mydist_11;
  mydist_11 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD6, _mtl_i.xlv_TEXCOORD6)
  ) * _mtl_u._LightPositionRange.w) * 0.97);
  float4 tmpvar_12;
  tmpvar_12 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)(_mtl_i.xlv_TEXCOORD6));
  half tmpvar_13;
  if ((tmpvar_12.x < mydist_11)) {
    tmpvar_13 = _mtl_u._LightShadowData.x;
  } else {
    tmpvar_13 = half(1.0);
  };
  half3 tmpvar_14;
  tmpvar_14 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_15;
  tmpvar_15 = normalize(tmpvar_7);
  tmpvar_14 = (tmpvar_14 * ((tmpvar_9.w * tmpvar_10.w) * tmpvar_13));
  half3 viewDir_16;
  viewDir_16 = -(tmpvar_6);
  half specularTerm_17;
  half tmpvar_18;
  tmpvar_18 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_19;
  half3 inVec_20;
  inVec_20 = (tmpvar_15 + viewDir_16);
  tmpvar_19 = (inVec_20 * rsqrt(max ((half)0.001, 
    dot (inVec_20, inVec_20)
  )));
  half tmpvar_21;
  tmpvar_21 = dot (tmpvar_5, viewDir_16);
  half3 tmpvar_22;
  if ((tmpvar_21 < (half)0.0)) {
    tmpvar_22 = (tmpvar_5 + (viewDir_16 * (
      -(tmpvar_21)
     + (half)1e-05)));
  } else {
    tmpvar_22 = tmpvar_5;
  };
  half tmpvar_23;
  tmpvar_23 = max ((half)0.0, dot (tmpvar_22, tmpvar_15));
  half tmpvar_24;
  tmpvar_24 = max ((half)0.0, dot (tmpvar_22, tmpvar_19));
  half tmpvar_25;
  tmpvar_25 = max ((half)0.0, dot (tmpvar_22, viewDir_16));
  half tmpvar_26;
  tmpvar_26 = max ((half)0.0, dot (tmpvar_15, tmpvar_19));
  half tmpvar_27;
  tmpvar_27 = (tmpvar_18 * tmpvar_18);
  half tmpvar_28;
  tmpvar_28 = (tmpvar_18 * tmpvar_18);
  half tmpvar_29;
  tmpvar_29 = (tmpvar_28 * tmpvar_28);
  half tmpvar_30;
  tmpvar_30 = (((tmpvar_24 * tmpvar_24) * (tmpvar_29 - (half)1.0)) + (half)1.0);
  half x_31;
  x_31 = ((half)1.0 - tmpvar_23);
  half x_32;
  x_32 = ((half)1.0 - tmpvar_25);
  half tmpvar_33;
  tmpvar_33 = ((half)0.5 + (((half)2.0 * tmpvar_26) * (tmpvar_26 * tmpvar_18)));
  half tmpvar_34;
  tmpvar_34 = (((half)1.0 + (
    (tmpvar_33 - (half)1.0)
   * 
    ((x_31 * x_31) * ((x_31 * x_31) * x_31))
  )) * ((half)1.0 + (
    (tmpvar_33 - (half)1.0)
   * 
    ((x_32 * x_32) * ((x_32 * x_32) * x_32))
  )));
  half tmpvar_35;
  tmpvar_35 = ((((half)2.0 / 
    (((tmpvar_23 * (
      (tmpvar_25 * ((half)1.0 - tmpvar_27))
     + tmpvar_27)) + (tmpvar_25 * (
      (tmpvar_23 * ((half)1.0 - tmpvar_27))
     + tmpvar_27))) + (half)1e-05)
  ) * (tmpvar_29 / 
    ((((half)3.141593 * tmpvar_30) * tmpvar_30) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_17 = tmpvar_35;
  bool tmpvar_36;
  tmpvar_36 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_36) {
    specularTerm_17 = sqrt(max ((half)0.0001, tmpvar_35));
  };
  half tmpvar_37;
  tmpvar_37 = max ((half)0.0, (specularTerm_17 * tmpvar_23));
  specularTerm_17 = tmpvar_37;
  half x_38;
  x_38 = ((half)1.0 - tmpvar_26);
  half4 tmpvar_39;
  tmpvar_39.w = half(1.0);
  tmpvar_39.xyz = ((tmpvar_3 * (tmpvar_14 * 
    (tmpvar_34 * tmpvar_23)
  )) + ((tmpvar_37 * tmpvar_14) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_38 * x_38) * ((x_38 * x_38) * x_38)))
  )));
  half4 xlat_varoutput_40;
  xlat_varoutput_40.xyz = tmpvar_39.xyz;
  xlat_varoutput_40.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_40;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 113 math, 7 textures, 2 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
ConstBuffer "$Globals" 112
VectorHalf 0 [_LightShadowData] 4
VectorHalf 8 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 16 [unity_ColorSpaceLuminance] 4
VectorHalf 24 [_LightColor0] 4
VectorHalf 32 [_Color] 4
ScalarHalf 40 [_Metallic]
ScalarHalf 42 [_Glossiness]
Vector 48 [_ShadowOffsets0]
Vector 64 [_ShadowOffsets1]
Vector 80 [_ShadowOffsets2]
Vector 96 [_ShadowOffsets3]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::less);
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float4 xlv_TEXCOORD5;
  float4 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  float4 _ShadowOffsets[4];
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   depth2d<float> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]]
  ,   texture2d<half> _LightTextureB0 [[texture(3)]], sampler _mtlsmp__LightTextureB0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_7;
  float2 P_8;
  P_8 = ((_mtl_i.xlv_TEXCOORD5.xy / _mtl_i.xlv_TEXCOORD5.w) + 0.5);
  tmpvar_7 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_8));
  float tmpvar_9;
  tmpvar_9 = dot (_mtl_i.xlv_TEXCOORD5.xyz, _mtl_i.xlv_TEXCOORD5.xyz);
  half4 tmpvar_10;
  tmpvar_10 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_9)));
  half tmpvar_11;
  half4 shadows_12;
  float3 tmpvar_13;
  tmpvar_13 = (_mtl_i.xlv_TEXCOORD6.xyz / _mtl_i.xlv_TEXCOORD6.w);
  float3 coord_14;
  coord_14 = (tmpvar_13 + _mtl_u._ShadowOffsets[0].xyz);
  half tmpvar_15;
  tmpvar_15 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, (float2)(coord_14).xy, (float)(coord_14).z);
  shadows_12.x = tmpvar_15;
  float3 coord_16;
  coord_16 = (tmpvar_13 + _mtl_u._ShadowOffsets[1].xyz);
  half tmpvar_17;
  tmpvar_17 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, (float2)(coord_16).xy, (float)(coord_16).z);
  shadows_12.y = tmpvar_17;
  float3 coord_18;
  coord_18 = (tmpvar_13 + _mtl_u._ShadowOffsets[2].xyz);
  half tmpvar_19;
  tmpvar_19 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, (float2)(coord_18).xy, (float)(coord_18).z);
  shadows_12.z = tmpvar_19;
  float3 coord_20;
  coord_20 = (tmpvar_13 + _mtl_u._ShadowOffsets[3].xyz);
  half tmpvar_21;
  tmpvar_21 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, (float2)(coord_20).xy, (float)(coord_20).z);
  shadows_12.w = tmpvar_21;
  shadows_12 = (_mtl_u._LightShadowData.xxxx + (shadows_12 * ((half)1.0 - _mtl_u._LightShadowData.xxxx)));
  half tmpvar_22;
  tmpvar_22 = dot (shadows_12, (half4)float4(0.25, 0.25, 0.25, 0.25));
  tmpvar_11 = tmpvar_22;
  half atten_23;
  atten_23 = half((((
    float((_mtl_i.xlv_TEXCOORD5.z > 0.0))
   * (float)tmpvar_7.w) * (float)tmpvar_10.w) * (float)tmpvar_11));
  half3 tmpvar_24;
  tmpvar_24 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_25;
  tmpvar_25 = normalize(tmpvar_6);
  tmpvar_24 = (tmpvar_24 * atten_23);
  half3 viewDir_26;
  viewDir_26 = -(normalize(_mtl_i.xlv_TEXCOORD1));
  half specularTerm_27;
  half tmpvar_28;
  tmpvar_28 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_29;
  half3 inVec_30;
  inVec_30 = (tmpvar_25 + viewDir_26);
  tmpvar_29 = (inVec_30 * rsqrt(max ((half)0.001, 
    dot (inVec_30, inVec_30)
  )));
  half tmpvar_31;
  tmpvar_31 = dot (tmpvar_5, viewDir_26);
  half3 tmpvar_32;
  if ((tmpvar_31 < (half)0.0)) {
    tmpvar_32 = (tmpvar_5 + (viewDir_26 * (
      -(tmpvar_31)
     + (half)1e-05)));
  } else {
    tmpvar_32 = tmpvar_5;
  };
  half tmpvar_33;
  tmpvar_33 = max ((half)0.0, dot (tmpvar_32, tmpvar_25));
  half tmpvar_34;
  tmpvar_34 = max ((half)0.0, dot (tmpvar_32, tmpvar_29));
  half tmpvar_35;
  tmpvar_35 = max ((half)0.0, dot (tmpvar_32, viewDir_26));
  half tmpvar_36;
  tmpvar_36 = max ((half)0.0, dot (tmpvar_25, tmpvar_29));
  half tmpvar_37;
  tmpvar_37 = (tmpvar_28 * tmpvar_28);
  half tmpvar_38;
  tmpvar_38 = (tmpvar_28 * tmpvar_28);
  half tmpvar_39;
  tmpvar_39 = (tmpvar_38 * tmpvar_38);
  half tmpvar_40;
  tmpvar_40 = (((tmpvar_34 * tmpvar_34) * (tmpvar_39 - (half)1.0)) + (half)1.0);
  half x_41;
  x_41 = ((half)1.0 - tmpvar_33);
  half x_42;
  x_42 = ((half)1.0 - tmpvar_35);
  half tmpvar_43;
  tmpvar_43 = ((half)0.5 + (((half)2.0 * tmpvar_36) * (tmpvar_36 * tmpvar_28)));
  half tmpvar_44;
  tmpvar_44 = (((half)1.0 + (
    (tmpvar_43 - (half)1.0)
   * 
    ((x_41 * x_41) * ((x_41 * x_41) * x_41))
  )) * ((half)1.0 + (
    (tmpvar_43 - (half)1.0)
   * 
    ((x_42 * x_42) * ((x_42 * x_42) * x_42))
  )));
  half tmpvar_45;
  tmpvar_45 = ((((half)2.0 / 
    (((tmpvar_33 * (
      (tmpvar_35 * ((half)1.0 - tmpvar_37))
     + tmpvar_37)) + (tmpvar_35 * (
      (tmpvar_33 * ((half)1.0 - tmpvar_37))
     + tmpvar_37))) + (half)1e-05)
  ) * (tmpvar_39 / 
    ((((half)3.141593 * tmpvar_40) * tmpvar_40) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_27 = tmpvar_45;
  bool tmpvar_46;
  tmpvar_46 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_46) {
    specularTerm_27 = sqrt(max ((half)0.0001, tmpvar_45));
  };
  half tmpvar_47;
  tmpvar_47 = max ((half)0.0, (specularTerm_27 * tmpvar_33));
  specularTerm_27 = tmpvar_47;
  half x_48;
  x_48 = ((half)1.0 - tmpvar_36);
  half4 tmpvar_49;
  tmpvar_49.w = half(1.0);
  tmpvar_49.xyz = ((tmpvar_3 * (tmpvar_24 * 
    (tmpvar_44 * tmpvar_33)
  )) + ((tmpvar_47 * tmpvar_24) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_48 * x_48) * ((x_48 * x_48) * x_48)))
  )));
  half4 xlat_varoutput_50;
  xlat_varoutput_50.xyz = tmpvar_49.xyz;
  xlat_varoutput_50.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_50;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 112 math, 6 textures, 6 branches
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
ConstBuffer "$Globals" 60
Vector 0 [_LightPositionRange]
VectorHalf 16 [_LightShadowData] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_LightColor0] 4
VectorHalf 48 [_Color] 4
ScalarHalf 56 [_Metallic]
ScalarHalf 58 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texturecube<float> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6 = normalize(_mtl_i.xlv_TEXCOORD1);
  half3 tmpvar_7;
  tmpvar_7.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_7.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_7.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_8;
  tmpvar_8 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_9;
  tmpvar_9 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_8)));
  float4 shadowVals_10;
  float mydist_11;
  mydist_11 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD6, _mtl_i.xlv_TEXCOORD6)
  ) * _mtl_u._LightPositionRange.w) * 0.97);
  shadowVals_10.x = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(0.0078125, 0.0078125, 0.0078125)))).x;
  shadowVals_10.y = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(-0.0078125, -0.0078125, 0.0078125)))).x;
  shadowVals_10.z = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(-0.0078125, 0.0078125, -0.0078125)))).x;
  shadowVals_10.w = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(0.0078125, -0.0078125, -0.0078125)))).x;
  bool4 tmpvar_12;
  tmpvar_12 = bool4((shadowVals_10 < float4(mydist_11)));
  half4 tmpvar_13;
  tmpvar_13 = _mtl_u._LightShadowData.xxxx;
  half tmpvar_14;
  if (tmpvar_12.x) {
    tmpvar_14 = tmpvar_13.x;
  } else {
    tmpvar_14 = half(1.0);
  };
  half tmpvar_15;
  if (tmpvar_12.y) {
    tmpvar_15 = tmpvar_13.y;
  } else {
    tmpvar_15 = half(1.0);
  };
  half tmpvar_16;
  if (tmpvar_12.z) {
    tmpvar_16 = tmpvar_13.z;
  } else {
    tmpvar_16 = half(1.0);
  };
  half tmpvar_17;
  if (tmpvar_12.w) {
    tmpvar_17 = tmpvar_13.w;
  } else {
    tmpvar_17 = half(1.0);
  };
  half4 tmpvar_18;
  tmpvar_18.x = tmpvar_14;
  tmpvar_18.y = tmpvar_15;
  tmpvar_18.z = tmpvar_16;
  tmpvar_18.w = tmpvar_17;
  half3 tmpvar_19;
  tmpvar_19 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_20;
  tmpvar_20 = normalize(tmpvar_7);
  tmpvar_19 = (tmpvar_19 * (tmpvar_9.w * dot (tmpvar_18, (half4)float4(0.25, 0.25, 0.25, 0.25))));
  half3 viewDir_21;
  viewDir_21 = -(tmpvar_6);
  half specularTerm_22;
  half tmpvar_23;
  tmpvar_23 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_24;
  half3 inVec_25;
  inVec_25 = (tmpvar_20 + viewDir_21);
  tmpvar_24 = (inVec_25 * rsqrt(max ((half)0.001, 
    dot (inVec_25, inVec_25)
  )));
  half tmpvar_26;
  tmpvar_26 = dot (tmpvar_5, viewDir_21);
  half3 tmpvar_27;
  if ((tmpvar_26 < (half)0.0)) {
    tmpvar_27 = (tmpvar_5 + (viewDir_21 * (
      -(tmpvar_26)
     + (half)1e-05)));
  } else {
    tmpvar_27 = tmpvar_5;
  };
  half tmpvar_28;
  tmpvar_28 = max ((half)0.0, dot (tmpvar_27, tmpvar_20));
  half tmpvar_29;
  tmpvar_29 = max ((half)0.0, dot (tmpvar_27, tmpvar_24));
  half tmpvar_30;
  tmpvar_30 = max ((half)0.0, dot (tmpvar_27, viewDir_21));
  half tmpvar_31;
  tmpvar_31 = max ((half)0.0, dot (tmpvar_20, tmpvar_24));
  half tmpvar_32;
  tmpvar_32 = (tmpvar_23 * tmpvar_23);
  half tmpvar_33;
  tmpvar_33 = (tmpvar_23 * tmpvar_23);
  half tmpvar_34;
  tmpvar_34 = (tmpvar_33 * tmpvar_33);
  half tmpvar_35;
  tmpvar_35 = (((tmpvar_29 * tmpvar_29) * (tmpvar_34 - (half)1.0)) + (half)1.0);
  half x_36;
  x_36 = ((half)1.0 - tmpvar_28);
  half x_37;
  x_37 = ((half)1.0 - tmpvar_30);
  half tmpvar_38;
  tmpvar_38 = ((half)0.5 + (((half)2.0 * tmpvar_31) * (tmpvar_31 * tmpvar_23)));
  half tmpvar_39;
  tmpvar_39 = (((half)1.0 + (
    (tmpvar_38 - (half)1.0)
   * 
    ((x_36 * x_36) * ((x_36 * x_36) * x_36))
  )) * ((half)1.0 + (
    (tmpvar_38 - (half)1.0)
   * 
    ((x_37 * x_37) * ((x_37 * x_37) * x_37))
  )));
  half tmpvar_40;
  tmpvar_40 = ((((half)2.0 / 
    (((tmpvar_28 * (
      (tmpvar_30 * ((half)1.0 - tmpvar_32))
     + tmpvar_32)) + (tmpvar_30 * (
      (tmpvar_28 * ((half)1.0 - tmpvar_32))
     + tmpvar_32))) + (half)1e-05)
  ) * (tmpvar_34 / 
    ((((half)3.141593 * tmpvar_35) * tmpvar_35) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_22 = tmpvar_40;
  bool tmpvar_41;
  tmpvar_41 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_41) {
    specularTerm_22 = sqrt(max ((half)0.0001, tmpvar_40));
  };
  half tmpvar_42;
  tmpvar_42 = max ((half)0.0, (specularTerm_22 * tmpvar_28));
  specularTerm_22 = tmpvar_42;
  half x_43;
  x_43 = ((half)1.0 - tmpvar_31);
  half4 tmpvar_44;
  tmpvar_44.w = half(1.0);
  tmpvar_44.xyz = ((tmpvar_3 * (tmpvar_19 * 
    (tmpvar_39 * tmpvar_28)
  )) + ((tmpvar_42 * tmpvar_19) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_43 * x_43) * ((x_43 * x_43) * x_43)))
  )));
  half4 xlat_varoutput_45;
  xlat_varoutput_45.xyz = tmpvar_44.xyz;
  xlat_varoutput_45.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_45;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 113 math, 7 textures, 6 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_LightTextureB0] 2D 3
ConstBuffer "$Globals" 60
Vector 0 [_LightPositionRange]
VectorHalf 16 [_LightShadowData] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_LightColor0] 4
VectorHalf 48 [_Color] 4
ScalarHalf 56 [_Metallic]
ScalarHalf 58 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texturecube<float> _ShadowMapTexture [[texture(1)]], sampler _mtlsmp__ShadowMapTexture [[sampler(1)]]
  ,   texturecube<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]]
  ,   texture2d<half> _LightTextureB0 [[texture(3)]], sampler _mtlsmp__LightTextureB0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6 = normalize(_mtl_i.xlv_TEXCOORD1);
  half3 tmpvar_7;
  tmpvar_7.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_7.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_7.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_8;
  tmpvar_8 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_9;
  tmpvar_9 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_8)));
  half4 tmpvar_10;
  tmpvar_10 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD5));
  float4 shadowVals_11;
  float mydist_12;
  mydist_12 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD6, _mtl_i.xlv_TEXCOORD6)
  ) * _mtl_u._LightPositionRange.w) * 0.97);
  shadowVals_11.x = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(0.0078125, 0.0078125, 0.0078125)))).x;
  shadowVals_11.y = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(-0.0078125, -0.0078125, 0.0078125)))).x;
  shadowVals_11.z = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(-0.0078125, 0.0078125, -0.0078125)))).x;
  shadowVals_11.w = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)((_mtl_i.xlv_TEXCOORD6 + float3(0.0078125, -0.0078125, -0.0078125)))).x;
  bool4 tmpvar_13;
  tmpvar_13 = bool4((shadowVals_11 < float4(mydist_12)));
  half4 tmpvar_14;
  tmpvar_14 = _mtl_u._LightShadowData.xxxx;
  half tmpvar_15;
  if (tmpvar_13.x) {
    tmpvar_15 = tmpvar_14.x;
  } else {
    tmpvar_15 = half(1.0);
  };
  half tmpvar_16;
  if (tmpvar_13.y) {
    tmpvar_16 = tmpvar_14.y;
  } else {
    tmpvar_16 = half(1.0);
  };
  half tmpvar_17;
  if (tmpvar_13.z) {
    tmpvar_17 = tmpvar_14.z;
  } else {
    tmpvar_17 = half(1.0);
  };
  half tmpvar_18;
  if (tmpvar_13.w) {
    tmpvar_18 = tmpvar_14.w;
  } else {
    tmpvar_18 = half(1.0);
  };
  half4 tmpvar_19;
  tmpvar_19.x = tmpvar_15;
  tmpvar_19.y = tmpvar_16;
  tmpvar_19.z = tmpvar_17;
  tmpvar_19.w = tmpvar_18;
  half3 tmpvar_20;
  tmpvar_20 = _mtl_u._LightColor0.xyz;
  half3 tmpvar_21;
  tmpvar_21 = normalize(tmpvar_7);
  tmpvar_20 = (tmpvar_20 * ((tmpvar_9.w * tmpvar_10.w) * dot (tmpvar_19, (half4)float4(0.25, 0.25, 0.25, 0.25))));
  half3 viewDir_22;
  viewDir_22 = -(tmpvar_6);
  half specularTerm_23;
  half tmpvar_24;
  tmpvar_24 = ((half)1.0 - _mtl_u._Glossiness);
  half3 tmpvar_25;
  half3 inVec_26;
  inVec_26 = (tmpvar_21 + viewDir_22);
  tmpvar_25 = (inVec_26 * rsqrt(max ((half)0.001, 
    dot (inVec_26, inVec_26)
  )));
  half tmpvar_27;
  tmpvar_27 = dot (tmpvar_5, viewDir_22);
  half3 tmpvar_28;
  if ((tmpvar_27 < (half)0.0)) {
    tmpvar_28 = (tmpvar_5 + (viewDir_22 * (
      -(tmpvar_27)
     + (half)1e-05)));
  } else {
    tmpvar_28 = tmpvar_5;
  };
  half tmpvar_29;
  tmpvar_29 = max ((half)0.0, dot (tmpvar_28, tmpvar_21));
  half tmpvar_30;
  tmpvar_30 = max ((half)0.0, dot (tmpvar_28, tmpvar_25));
  half tmpvar_31;
  tmpvar_31 = max ((half)0.0, dot (tmpvar_28, viewDir_22));
  half tmpvar_32;
  tmpvar_32 = max ((half)0.0, dot (tmpvar_21, tmpvar_25));
  half tmpvar_33;
  tmpvar_33 = (tmpvar_24 * tmpvar_24);
  half tmpvar_34;
  tmpvar_34 = (tmpvar_24 * tmpvar_24);
  half tmpvar_35;
  tmpvar_35 = (tmpvar_34 * tmpvar_34);
  half tmpvar_36;
  tmpvar_36 = (((tmpvar_30 * tmpvar_30) * (tmpvar_35 - (half)1.0)) + (half)1.0);
  half x_37;
  x_37 = ((half)1.0 - tmpvar_29);
  half x_38;
  x_38 = ((half)1.0 - tmpvar_31);
  half tmpvar_39;
  tmpvar_39 = ((half)0.5 + (((half)2.0 * tmpvar_32) * (tmpvar_32 * tmpvar_24)));
  half tmpvar_40;
  tmpvar_40 = (((half)1.0 + (
    (tmpvar_39 - (half)1.0)
   * 
    ((x_37 * x_37) * ((x_37 * x_37) * x_37))
  )) * ((half)1.0 + (
    (tmpvar_39 - (half)1.0)
   * 
    ((x_38 * x_38) * ((x_38 * x_38) * x_38))
  )));
  half tmpvar_41;
  tmpvar_41 = ((((half)2.0 / 
    (((tmpvar_29 * (
      (tmpvar_31 * ((half)1.0 - tmpvar_33))
     + tmpvar_33)) + (tmpvar_31 * (
      (tmpvar_29 * ((half)1.0 - tmpvar_33))
     + tmpvar_33))) + (half)1e-05)
  ) * (tmpvar_35 / 
    ((((half)3.141593 * tmpvar_36) * tmpvar_36) + (half)1e-07)
  )) * (half)0.7853982);
  specularTerm_23 = tmpvar_41;
  bool tmpvar_42;
  tmpvar_42 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_42) {
    specularTerm_23 = sqrt(max ((half)0.0001, tmpvar_41));
  };
  half tmpvar_43;
  tmpvar_43 = max ((half)0.0, (specularTerm_23 * tmpvar_29));
  specularTerm_23 = tmpvar_43;
  half x_44;
  x_44 = ((half)1.0 - tmpvar_32);
  half4 tmpvar_45;
  tmpvar_45.w = half(1.0);
  tmpvar_45.xyz = ((tmpvar_3 * (tmpvar_20 * 
    (tmpvar_40 * tmpvar_29)
  )) + ((tmpvar_43 * tmpvar_20) * (tmpvar_4 + 
    (((half)1.0 - tmpvar_4) * ((x_44 * x_44) * ((x_44 * x_44) * x_44)))
  )));
  half4 xlat_varoutput_46;
  xlat_varoutput_46.xyz = tmpvar_45.xyz;
  xlat_varoutput_46.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_46;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on glcore"
}
}
 }


 // Stats for Vertex shader:
 //       metal : 15 avg math (3..28), 0 avg branch (0..1)
 //      opengl : 2 avg math (1..4)
 // Stats for Fragment shader:
 //       metal : 2 avg math (1..4)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 147192
Program "vp" {
SubProgram "opengl " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"#version 120

#ifdef VERTEX
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_LightShadowBias;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform mat4 unity_MatrixVP;
void main ()
{
  vec3 vertex_1;
  vertex_1 = gl_Vertex.xyz;
  vec4 clipPos_2;
  if ((unity_LightShadowBias.z != 0.0)) {
    vec4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    vec3 tmpvar_4;
    tmpvar_4 = (_Object2World * tmpvar_3).xyz;
    vec4 v_5;
    v_5.x = _World2Object[0].x;
    v_5.y = _World2Object[1].x;
    v_5.z = _World2Object[2].x;
    v_5.w = _World2Object[3].x;
    vec4 v_6;
    v_6.x = _World2Object[0].y;
    v_6.y = _World2Object[1].y;
    v_6.z = _World2Object[2].y;
    v_6.w = _World2Object[3].y;
    vec4 v_7;
    v_7.x = _World2Object[0].z;
    v_7.y = _World2Object[1].z;
    v_7.z = _World2Object[2].z;
    v_7.w = _World2Object[3].z;
    vec3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * gl_Normal.x)
     + 
      (v_6.xyz * gl_Normal.y)
    ) + (v_7.xyz * gl_Normal.z)));
    float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _WorldSpaceLightPos0.w)
    )));
    vec4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (unity_MatrixVP * tmpvar_10);
  } else {
    vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (gl_ModelViewProjectionMatrix * tmpvar_11);
  };
  vec4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, -(clipPos_2.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_12;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "metal " {
// Stats: 28 math, 1 branches
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 288
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Matrix 224 [unity_MatrixVP]
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [unity_LightShadowBias]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  float4 unity_LightShadowBias;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4x4 unity_MatrixVP;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 vertex_1;
  vertex_1 = _mtl_i._glesVertex.xyz;
  float4 clipPos_2;
  if ((_mtl_u.unity_LightShadowBias.z != 0.0)) {
    float4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    float3 tmpvar_4;
    tmpvar_4 = (_mtl_u._Object2World * tmpvar_3).xyz;
    float4 v_5;
    v_5.x = _mtl_u._World2Object[0].x;
    v_5.y = _mtl_u._World2Object[1].x;
    v_5.z = _mtl_u._World2Object[2].x;
    v_5.w = _mtl_u._World2Object[3].x;
    float4 v_6;
    v_6.x = _mtl_u._World2Object[0].y;
    v_6.y = _mtl_u._World2Object[1].y;
    v_6.z = _mtl_u._World2Object[2].y;
    v_6.w = _mtl_u._World2Object[3].y;
    float4 v_7;
    v_7.x = _mtl_u._World2Object[0].z;
    v_7.y = _mtl_u._World2Object[1].z;
    v_7.z = _mtl_u._World2Object[2].z;
    v_7.w = _mtl_u._World2Object[3].z;
    float3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * _mtl_i._glesNormal.x)
     + 
      (v_6.xyz * _mtl_i._glesNormal.y)
    ) + (v_7.xyz * _mtl_i._glesNormal.z)));
    float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_mtl_u._WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _mtl_u._WorldSpaceLightPos0.w)
    )));
    float4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (_mtl_u.unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (_mtl_u.unity_MatrixVP * tmpvar_10);
  } else {
    float4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (_mtl_u.glstate_matrix_mvp * tmpvar_11);
  };
  float4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((_mtl_u.unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, 0.0), _mtl_u.unity_LightShadowBias.y);
  _mtl_o.gl_Position = clipPos_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	mat4x4 unity_MatrixVP;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + _Object2World[3].xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + unity_MatrixVP[3];
    u_xlat1 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
    u_xlatb2 = unity_LightShadowBias.z!=0.0;
    u_xlat0 = (bool(u_xlatb2)) ? u_xlat0 : u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 4 math
Keywords { "SHADOWS_CUBE" }
"#version 120

#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = ((_Object2World * gl_Vertex).xyz - _LightPositionRange.xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 unity_LightShadowBias;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  gl_FragData[0] = vec4(((sqrt(
    dot (xlv_TEXCOORD0, xlv_TEXCOORD0)
  ) + unity_LightShadowBias.x) * _LightPositionRange.w));
}


#endif
"
}
SubProgram "metal " {
// Stats: 3 math
Keywords { "SHADOWS_CUBE" }
Bind "vertex" ATTR0
ConstBuffer "$Globals" 144
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Vector 0 [_LightPositionRange]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float3 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_u._Object2World * _mtl_i._glesVertex).xyz - _mtl_u._LightPositionRange.xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o._glesFragData_0 = half4(float4(0.0, 0.0, 0.0, 0.0));
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 4 math
Keywords { "SHADOWS_CUBE" }
ConstBuffer "$Globals" 32
Vector 0 [_LightPositionRange]
Vector 16 [unity_LightShadowBias]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float3 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  float4 unity_LightShadowBias;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = float4(((sqrt(
    dot (_mtl_i.xlv_TEXCOORD0, _mtl_i.xlv_TEXCOORD0)
  ) + _mtl_u.unity_LightShadowBias.x) * _mtl_u._LightPositionRange.w));
  tmpvar_1 = half4(tmpvar_2);
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on glcore"
}
}
 }


 // Stats for Vertex shader:
 //       metal : 33 avg math (30..35), 2 branch
 //      opengl : 30 avg math (29..31), 2 texture, 1 branch
 // Stats for Fragment shader:
 //       metal : 30 avg math (29..31), 2 texture, 1 branch
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 219902
Program "vp" {
SubProgram "opengl " {
// Stats: 31 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_12;
  n_12 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * gl_Normal.x)
   + 
    (v_14.xyz * gl_Normal.y)
  ) + (v_15.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_16;
  tmpvar_7 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_17;
  ambient_17 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_17 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_18;
  vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_16.xyzz * tmpvar_16.yzzx);
  x1_18.x = dot (unity_SHBr, tmpvar_19);
  x1_18.y = dot (unity_SHBg, tmpvar_19);
  x1_18.z = dot (unity_SHBb, tmpvar_19);
  ambient_17 = (ambient_17 + (x1_18 + (unity_SHC.xyz * 
    ((tmpvar_16.x * tmpvar_16.x) - (tmpvar_16.y * tmpvar_16.y))
  )));
  tmpvar_7.xyz = ambient_17;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = n_12;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1.x = _Metallic;
  tmpvar_1.y = _Glossiness;
  float tmpvar_2;
  tmpvar_2 = tmpvar_1.y;
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_9;
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_6;
  vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  vec3 tmpvar_12;
  tmpvar_12 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_11));
  ambient_9 = tmpvar_12;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_9 = max (((1.055 * 
      pow (max (tmpvar_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_8 = (ambient_9 * tmpvar_7);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_4 * tmpvar_8);
  vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_4;
  tmpvar_14.w = tmpvar_7;
  vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_5;
  tmpvar_15.w = tmpvar_2;
  vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = ((tmpvar_6 * 0.5) + 0.5);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = exp2(-(tmpvar_13.xyz));
  gl_FragData[0] = tmpvar_14;
  gl_FragData[1] = tmpvar_15;
  gl_FragData[2] = tmpvar_16;
  gl_FragData[3] = tmpvar_17;
}


#endif
"
}
SubProgram "metal " {
// Stats: 30 math, 2 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 290
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
VectorHalf 240 [unity_ColorSpaceLuminance] 4
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float3 tmpvar_10;
  tmpvar_10 = tmpvar_9.xyz;
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 n_14;
  n_14 = (tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_13 = half3(n_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_19);
  tmpvar_8 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 normal_20;
  normal_20 = half3(tmpvar_19);
  half3 ambient_21;
  ambient_21 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_22;
  tmpvar_22 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_22) {
    ambient_21 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_23;
  half4 tmpvar_24;
  tmpvar_24 = (normal_20.xyzz * normal_20.yzzx);
  x1_23.x = dot (_mtl_u.unity_SHBr, tmpvar_24);
  x1_23.y = dot (_mtl_u.unity_SHBg, tmpvar_24);
  x1_23.z = dot (_mtl_u.unity_SHBb, tmpvar_24);
  ambient_21 = (ambient_21 + (x1_23 + (_mtl_u.unity_SHC.xyz * 
    ((normal_20.x * normal_20.x) - (normal_20.y * normal_20.y))
  )));
  tmpvar_8.xyz = ambient_21;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_10;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 31 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_12;
  n_12 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * gl_Normal.x)
   + 
    (v_14.xyz * gl_Normal.y)
  ) + (v_15.xyz * gl_Normal.z)));
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  vec4 tmpvar_18;
  tmpvar_18.xyz = normalize((tmpvar_17 * TANGENT.xyz));
  tmpvar_18.w = TANGENT.w;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_19 = tmpvar_18.xyz;
  tmpvar_20 = (((tmpvar_16.yzx * tmpvar_18.zxy) - (tmpvar_16.zxy * tmpvar_18.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_21;
  vec3 tmpvar_22;
  vec3 tmpvar_23;
  tmpvar_21.x = tmpvar_19.x;
  tmpvar_21.y = tmpvar_20.x;
  tmpvar_21.z = tmpvar_16.x;
  tmpvar_22.x = tmpvar_19.y;
  tmpvar_22.y = tmpvar_20.y;
  tmpvar_22.z = tmpvar_16.y;
  tmpvar_23.x = tmpvar_19.z;
  tmpvar_23.y = tmpvar_20.z;
  tmpvar_23.z = tmpvar_16.z;
  vec3 v_24;
  v_24.x = tmpvar_21.x;
  v_24.y = tmpvar_22.x;
  v_24.z = tmpvar_23.x;
  tmpvar_4.xyz = v_24;
  vec3 v_25;
  v_25.x = tmpvar_21.y;
  v_25.y = tmpvar_22.y;
  v_25.z = tmpvar_23.y;
  tmpvar_5.xyz = v_25;
  vec3 v_26;
  v_26.x = tmpvar_21.z;
  v_26.y = tmpvar_22.z;
  v_26.z = tmpvar_23.z;
  tmpvar_6.xyz = v_26;
  tmpvar_7 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_27;
  ambient_27 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_27 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_28;
  vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_16.xyzz * tmpvar_16.yzzx);
  x1_28.x = dot (unity_SHBr, tmpvar_29);
  x1_28.y = dot (unity_SHBg, tmpvar_29);
  x1_28.z = dot (unity_SHBb, tmpvar_29);
  ambient_27 = (ambient_27 + (x1_28 + (unity_SHC.xyz * 
    ((tmpvar_16.x * tmpvar_16.x) - (tmpvar_16.y * tmpvar_16.y))
  )));
  tmpvar_7.xyz = ambient_27;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = n_12;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1.x = _Metallic;
  tmpvar_1.y = _Glossiness;
  float tmpvar_2;
  tmpvar_2 = tmpvar_1.y;
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_9;
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_6;
  vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  vec3 tmpvar_12;
  tmpvar_12 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_11));
  ambient_9 = tmpvar_12;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_9 = max (((1.055 * 
      pow (max (tmpvar_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_8 = (ambient_9 * tmpvar_7);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_4 * tmpvar_8);
  vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_4;
  tmpvar_14.w = tmpvar_7;
  vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_5;
  tmpvar_15.w = tmpvar_2;
  vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = ((tmpvar_6 * 0.5) + 0.5);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = exp2(-(tmpvar_13.xyz));
  gl_FragData[0] = tmpvar_14;
  gl_FragData[1] = tmpvar_15;
  gl_FragData[2] = tmpvar_16;
  gl_FragData[3] = tmpvar_17;
}


#endif
"
}
SubProgram "metal " {
// Stats: 35 math, 2 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 306
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
Vector 240 [unity_WorldTransformParams]
VectorHalf 256 [unity_ColorSpaceLuminance] 4
Vector 272 [_MainTex_ST]
Vector 288 [_DetailAlbedoMap_ST]
ScalarHalf 304 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float3 tmpvar_12;
  tmpvar_12 = tmpvar_11.xyz;
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_13;
  texcoord_13.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_14;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_15;
  float3 n_16;
  n_16 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_15 = half3(n_16);
  float3 norm_17;
  norm_17 = float3(tmpvar_1);
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].x;
  v_18.y = _mtl_u._World2Object[1].x;
  v_18.z = _mtl_u._World2Object[2].x;
  v_18.w = _mtl_u._World2Object[3].x;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].y;
  v_19.y = _mtl_u._World2Object[1].y;
  v_19.z = _mtl_u._World2Object[2].y;
  v_19.w = _mtl_u._World2Object[3].y;
  float4 v_20;
  v_20.x = _mtl_u._World2Object[0].z;
  v_20.y = _mtl_u._World2Object[1].z;
  v_20.z = _mtl_u._World2Object[2].z;
  v_20.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  float3 dir_22;
  dir_22 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_23;
  tmpvar_23[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_23[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_23[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = float(tmpvar_4.w);
  half3 normal_25;
  normal_25 = half3(tmpvar_21);
  half3 tangent_26;
  tangent_26 = half3(tmpvar_24.xyz);
  half tangentSign_27;
  tangentSign_27 = half(tmpvar_24.w);
  half xlat_varsign_28;
  float tmpvar_29;
  tmpvar_29 = ((float)tangentSign_27 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_28 = half(tmpvar_29);
  half3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * xlat_varsign_28);
  half3x3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].x;
  v_32.y = tangentToWorld_5[1].x;
  v_32.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_5[0].y;
  v_33.y = tangentToWorld_5[1].y;
  v_33.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_33);
  float3 v_34;
  v_34.x = tangentToWorld_5[0].z;
  v_34.y = tangentToWorld_5[1].z;
  v_34.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_34);
  tmpvar_10 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 normal_35;
  normal_35 = half3(tmpvar_21);
  half3 ambient_36;
  ambient_36 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_37;
  tmpvar_37 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_37) {
    ambient_36 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_38;
  half4 tmpvar_39;
  tmpvar_39 = (normal_35.xyzz * normal_35.yzzx);
  x1_38.x = dot (_mtl_u.unity_SHBr, tmpvar_39);
  x1_38.y = dot (_mtl_u.unity_SHBg, tmpvar_39);
  x1_38.z = dot (_mtl_u.unity_SHBb, tmpvar_39);
  ambient_36 = (ambient_36 + (x1_38 + (_mtl_u.unity_SHC.xyz * 
    ((normal_35.x * normal_35.x) - (normal_35.y * normal_35.y))
  )));
  tmpvar_10.xyz = ambient_36;
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_13;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_15;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 31 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_12;
  n_12 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * gl_Normal.x)
   + 
    (v_14.xyz * gl_Normal.y)
  ) + (v_15.xyz * gl_Normal.z)));
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  vec4 tmpvar_18;
  tmpvar_18.xyz = normalize((tmpvar_17 * TANGENT.xyz));
  tmpvar_18.w = TANGENT.w;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_19 = tmpvar_18.xyz;
  tmpvar_20 = (((tmpvar_16.yzx * tmpvar_18.zxy) - (tmpvar_16.zxy * tmpvar_18.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_21;
  vec3 tmpvar_22;
  vec3 tmpvar_23;
  tmpvar_21.x = tmpvar_19.x;
  tmpvar_21.y = tmpvar_20.x;
  tmpvar_21.z = tmpvar_16.x;
  tmpvar_22.x = tmpvar_19.y;
  tmpvar_22.y = tmpvar_20.y;
  tmpvar_22.z = tmpvar_16.y;
  tmpvar_23.x = tmpvar_19.z;
  tmpvar_23.y = tmpvar_20.z;
  tmpvar_23.z = tmpvar_16.z;
  vec3 v_24;
  v_24.x = tmpvar_21.x;
  v_24.y = tmpvar_22.x;
  v_24.z = tmpvar_23.x;
  tmpvar_4.xyz = v_24;
  vec3 v_25;
  v_25.x = tmpvar_21.y;
  v_25.y = tmpvar_22.y;
  v_25.z = tmpvar_23.y;
  tmpvar_5.xyz = v_25;
  vec3 v_26;
  v_26.x = tmpvar_21.z;
  v_26.y = tmpvar_22.z;
  v_26.z = tmpvar_23.z;
  tmpvar_6.xyz = v_26;
  tmpvar_7 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_27;
  ambient_27 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_27 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_28;
  vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_16.xyzz * tmpvar_16.yzzx);
  x1_28.x = dot (unity_SHBr, tmpvar_29);
  x1_28.y = dot (unity_SHBg, tmpvar_29);
  x1_28.z = dot (unity_SHBb, tmpvar_29);
  ambient_27 = (ambient_27 + (x1_28 + (unity_SHC.xyz * 
    ((tmpvar_16.x * tmpvar_16.x) - (tmpvar_16.y * tmpvar_16.y))
  )));
  tmpvar_7.xyz = ambient_27;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = n_12;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1.x = _Metallic;
  tmpvar_1.y = _Glossiness;
  float tmpvar_2;
  tmpvar_2 = tmpvar_1.y;
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_9;
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_6;
  vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  vec3 tmpvar_12;
  tmpvar_12 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_11));
  ambient_9 = tmpvar_12;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_9 = max (((1.055 * 
      pow (max (tmpvar_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_8 = (ambient_9 * tmpvar_7);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_4 * tmpvar_8);
  vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_4;
  tmpvar_14.w = tmpvar_7;
  vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_5;
  tmpvar_15.w = tmpvar_2;
  vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = ((tmpvar_6 * 0.5) + 0.5);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = exp2(-(tmpvar_13.xyz));
  gl_FragData[0] = tmpvar_14;
  gl_FragData[1] = tmpvar_15;
  gl_FragData[2] = tmpvar_16;
  gl_FragData[3] = tmpvar_17;
}


#endif
"
}
SubProgram "metal " {
// Stats: 35 math, 2 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 306
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
Vector 240 [unity_WorldTransformParams]
VectorHalf 256 [unity_ColorSpaceLuminance] 4
Vector 272 [_MainTex_ST]
Vector 288 [_DetailAlbedoMap_ST]
ScalarHalf 304 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float3 tmpvar_12;
  tmpvar_12 = tmpvar_11.xyz;
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_13;
  texcoord_13.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_14;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_15;
  float3 n_16;
  n_16 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_15 = half3(n_16);
  float3 norm_17;
  norm_17 = float3(tmpvar_1);
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].x;
  v_18.y = _mtl_u._World2Object[1].x;
  v_18.z = _mtl_u._World2Object[2].x;
  v_18.w = _mtl_u._World2Object[3].x;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].y;
  v_19.y = _mtl_u._World2Object[1].y;
  v_19.z = _mtl_u._World2Object[2].y;
  v_19.w = _mtl_u._World2Object[3].y;
  float4 v_20;
  v_20.x = _mtl_u._World2Object[0].z;
  v_20.y = _mtl_u._World2Object[1].z;
  v_20.z = _mtl_u._World2Object[2].z;
  v_20.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  float3 dir_22;
  dir_22 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_23;
  tmpvar_23[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_23[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_23[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = float(tmpvar_4.w);
  half3 normal_25;
  normal_25 = half3(tmpvar_21);
  half3 tangent_26;
  tangent_26 = half3(tmpvar_24.xyz);
  half tangentSign_27;
  tangentSign_27 = half(tmpvar_24.w);
  half xlat_varsign_28;
  float tmpvar_29;
  tmpvar_29 = ((float)tangentSign_27 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_28 = half(tmpvar_29);
  half3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * xlat_varsign_28);
  half3x3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].x;
  v_32.y = tangentToWorld_5[1].x;
  v_32.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_5[0].y;
  v_33.y = tangentToWorld_5[1].y;
  v_33.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_33);
  float3 v_34;
  v_34.x = tangentToWorld_5[0].z;
  v_34.y = tangentToWorld_5[1].z;
  v_34.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_34);
  tmpvar_10 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 normal_35;
  normal_35 = half3(tmpvar_21);
  half3 ambient_36;
  ambient_36 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_37;
  tmpvar_37 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_37) {
    ambient_36 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_38;
  half4 tmpvar_39;
  tmpvar_39 = (normal_35.xyzz * normal_35.yzzx);
  x1_38.x = dot (_mtl_u.unity_SHBr, tmpvar_39);
  x1_38.y = dot (_mtl_u.unity_SHBg, tmpvar_39);
  x1_38.z = dot (_mtl_u.unity_SHBb, tmpvar_39);
  ambient_36 = (ambient_36 + (x1_38 + (_mtl_u.unity_SHC.xyz * 
    ((normal_35.x * normal_35.x) - (normal_35.y * normal_35.y))
  )));
  tmpvar_10.xyz = ambient_36;
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_13;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_15;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_12;
  n_12 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * gl_Normal.x)
   + 
    (v_14.xyz * gl_Normal.y)
  ) + (v_15.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_16;
  tmpvar_7 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_17;
  ambient_17 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_17 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_18;
  vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_16.xyzz * tmpvar_16.yzzx);
  x1_18.x = dot (unity_SHBr, tmpvar_19);
  x1_18.y = dot (unity_SHBg, tmpvar_19);
  x1_18.z = dot (unity_SHBb, tmpvar_19);
  ambient_17 = (ambient_17 + (x1_18 + (unity_SHC.xyz * 
    ((tmpvar_16.x * tmpvar_16.x) - (tmpvar_16.y * tmpvar_16.y))
  )));
  tmpvar_7.xyz = ambient_17;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = n_12;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1.x = _Metallic;
  tmpvar_1.y = _Glossiness;
  float tmpvar_2;
  tmpvar_2 = tmpvar_1.y;
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_9;
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_6;
  vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  vec3 tmpvar_12;
  tmpvar_12 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_11));
  ambient_9 = tmpvar_12;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_9 = max (((1.055 * 
      pow (max (tmpvar_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_8 = (ambient_9 * tmpvar_7);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_4 * tmpvar_8);
  vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_4;
  tmpvar_14.w = tmpvar_7;
  vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_5;
  tmpvar_15.w = tmpvar_2;
  vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = ((tmpvar_6 * 0.5) + 0.5);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_13.xyz;
  gl_FragData[0] = tmpvar_14;
  gl_FragData[1] = tmpvar_15;
  gl_FragData[2] = tmpvar_16;
  gl_FragData[3] = tmpvar_17;
}


#endif
"
}
SubProgram "metal " {
// Stats: 30 math, 2 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 290
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
VectorHalf 240 [unity_ColorSpaceLuminance] 4
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float3 tmpvar_10;
  tmpvar_10 = tmpvar_9.xyz;
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 n_14;
  n_14 = (tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_13 = half3(n_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_19);
  tmpvar_8 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 normal_20;
  normal_20 = half3(tmpvar_19);
  half3 ambient_21;
  ambient_21 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_22;
  tmpvar_22 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_22) {
    ambient_21 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_23;
  half4 tmpvar_24;
  tmpvar_24 = (normal_20.xyzz * normal_20.yzzx);
  x1_23.x = dot (_mtl_u.unity_SHBr, tmpvar_24);
  x1_23.y = dot (_mtl_u.unity_SHBg, tmpvar_24);
  x1_23.z = dot (_mtl_u.unity_SHBb, tmpvar_24);
  ambient_21 = (ambient_21 + (x1_23 + (_mtl_u.unity_SHC.xyz * 
    ((normal_20.x * normal_20.x) - (normal_20.y * normal_20.y))
  )));
  tmpvar_8.xyz = ambient_21;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_10;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_12;
  n_12 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * gl_Normal.x)
   + 
    (v_14.xyz * gl_Normal.y)
  ) + (v_15.xyz * gl_Normal.z)));
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  vec4 tmpvar_18;
  tmpvar_18.xyz = normalize((tmpvar_17 * TANGENT.xyz));
  tmpvar_18.w = TANGENT.w;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_19 = tmpvar_18.xyz;
  tmpvar_20 = (((tmpvar_16.yzx * tmpvar_18.zxy) - (tmpvar_16.zxy * tmpvar_18.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_21;
  vec3 tmpvar_22;
  vec3 tmpvar_23;
  tmpvar_21.x = tmpvar_19.x;
  tmpvar_21.y = tmpvar_20.x;
  tmpvar_21.z = tmpvar_16.x;
  tmpvar_22.x = tmpvar_19.y;
  tmpvar_22.y = tmpvar_20.y;
  tmpvar_22.z = tmpvar_16.y;
  tmpvar_23.x = tmpvar_19.z;
  tmpvar_23.y = tmpvar_20.z;
  tmpvar_23.z = tmpvar_16.z;
  vec3 v_24;
  v_24.x = tmpvar_21.x;
  v_24.y = tmpvar_22.x;
  v_24.z = tmpvar_23.x;
  tmpvar_4.xyz = v_24;
  vec3 v_25;
  v_25.x = tmpvar_21.y;
  v_25.y = tmpvar_22.y;
  v_25.z = tmpvar_23.y;
  tmpvar_5.xyz = v_25;
  vec3 v_26;
  v_26.x = tmpvar_21.z;
  v_26.y = tmpvar_22.z;
  v_26.z = tmpvar_23.z;
  tmpvar_6.xyz = v_26;
  tmpvar_7 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_27;
  ambient_27 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_27 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_28;
  vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_16.xyzz * tmpvar_16.yzzx);
  x1_28.x = dot (unity_SHBr, tmpvar_29);
  x1_28.y = dot (unity_SHBg, tmpvar_29);
  x1_28.z = dot (unity_SHBb, tmpvar_29);
  ambient_27 = (ambient_27 + (x1_28 + (unity_SHC.xyz * 
    ((tmpvar_16.x * tmpvar_16.x) - (tmpvar_16.y * tmpvar_16.y))
  )));
  tmpvar_7.xyz = ambient_27;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = n_12;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1.x = _Metallic;
  tmpvar_1.y = _Glossiness;
  float tmpvar_2;
  tmpvar_2 = tmpvar_1.y;
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_9;
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_6;
  vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  vec3 tmpvar_12;
  tmpvar_12 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_11));
  ambient_9 = tmpvar_12;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_9 = max (((1.055 * 
      pow (max (tmpvar_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_8 = (ambient_9 * tmpvar_7);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_4 * tmpvar_8);
  vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_4;
  tmpvar_14.w = tmpvar_7;
  vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_5;
  tmpvar_15.w = tmpvar_2;
  vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = ((tmpvar_6 * 0.5) + 0.5);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_13.xyz;
  gl_FragData[0] = tmpvar_14;
  gl_FragData[1] = tmpvar_15;
  gl_FragData[2] = tmpvar_16;
  gl_FragData[3] = tmpvar_17;
}


#endif
"
}
SubProgram "metal " {
// Stats: 35 math, 2 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 306
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
Vector 240 [unity_WorldTransformParams]
VectorHalf 256 [unity_ColorSpaceLuminance] 4
Vector 272 [_MainTex_ST]
Vector 288 [_DetailAlbedoMap_ST]
ScalarHalf 304 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float3 tmpvar_12;
  tmpvar_12 = tmpvar_11.xyz;
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_13;
  texcoord_13.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_14;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_15;
  float3 n_16;
  n_16 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_15 = half3(n_16);
  float3 norm_17;
  norm_17 = float3(tmpvar_1);
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].x;
  v_18.y = _mtl_u._World2Object[1].x;
  v_18.z = _mtl_u._World2Object[2].x;
  v_18.w = _mtl_u._World2Object[3].x;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].y;
  v_19.y = _mtl_u._World2Object[1].y;
  v_19.z = _mtl_u._World2Object[2].y;
  v_19.w = _mtl_u._World2Object[3].y;
  float4 v_20;
  v_20.x = _mtl_u._World2Object[0].z;
  v_20.y = _mtl_u._World2Object[1].z;
  v_20.z = _mtl_u._World2Object[2].z;
  v_20.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  float3 dir_22;
  dir_22 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_23;
  tmpvar_23[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_23[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_23[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = float(tmpvar_4.w);
  half3 normal_25;
  normal_25 = half3(tmpvar_21);
  half3 tangent_26;
  tangent_26 = half3(tmpvar_24.xyz);
  half tangentSign_27;
  tangentSign_27 = half(tmpvar_24.w);
  half xlat_varsign_28;
  float tmpvar_29;
  tmpvar_29 = ((float)tangentSign_27 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_28 = half(tmpvar_29);
  half3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * xlat_varsign_28);
  half3x3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].x;
  v_32.y = tangentToWorld_5[1].x;
  v_32.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_5[0].y;
  v_33.y = tangentToWorld_5[1].y;
  v_33.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_33);
  float3 v_34;
  v_34.x = tangentToWorld_5[0].z;
  v_34.y = tangentToWorld_5[1].z;
  v_34.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_34);
  tmpvar_10 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 normal_35;
  normal_35 = half3(tmpvar_21);
  half3 ambient_36;
  ambient_36 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_37;
  tmpvar_37 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_37) {
    ambient_36 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_38;
  half4 tmpvar_39;
  tmpvar_39 = (normal_35.xyzz * normal_35.yzzx);
  x1_38.x = dot (_mtl_u.unity_SHBr, tmpvar_39);
  x1_38.y = dot (_mtl_u.unity_SHBg, tmpvar_39);
  x1_38.z = dot (_mtl_u.unity_SHBb, tmpvar_39);
  ambient_36 = (ambient_36 + (x1_38 + (_mtl_u.unity_SHC.xyz * 
    ((normal_35.x * normal_35.x) - (normal_35.y * normal_35.y))
  )));
  tmpvar_10.xyz = ambient_36;
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_13;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_15;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  vec4 tmpvar_8;
  tmpvar_8 = (_Object2World * gl_Vertex);
  vec3 tmpvar_9;
  tmpvar_9 = tmpvar_8.xyz;
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_10;
  texcoord_10.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_11;
  if ((_UVSec == 0.0)) {
    tmpvar_11 = tmpvar_1;
  } else {
    tmpvar_11 = tmpvar_2;
  };
  texcoord_10.zw = ((tmpvar_11 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 n_12;
  n_12 = (tmpvar_8.xyz - _WorldSpaceCameraPos);
  vec4 v_13;
  v_13.x = _World2Object[0].x;
  v_13.y = _World2Object[1].x;
  v_13.z = _World2Object[2].x;
  v_13.w = _World2Object[3].x;
  vec4 v_14;
  v_14.x = _World2Object[0].y;
  v_14.y = _World2Object[1].y;
  v_14.z = _World2Object[2].y;
  v_14.w = _World2Object[3].y;
  vec4 v_15;
  v_15.x = _World2Object[0].z;
  v_15.y = _World2Object[1].z;
  v_15.z = _World2Object[2].z;
  v_15.w = _World2Object[3].z;
  vec3 tmpvar_16;
  tmpvar_16 = normalize(((
    (v_13.xyz * gl_Normal.x)
   + 
    (v_14.xyz * gl_Normal.y)
  ) + (v_15.xyz * gl_Normal.z)));
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  vec4 tmpvar_18;
  tmpvar_18.xyz = normalize((tmpvar_17 * TANGENT.xyz));
  tmpvar_18.w = TANGENT.w;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_19 = tmpvar_18.xyz;
  tmpvar_20 = (((tmpvar_16.yzx * tmpvar_18.zxy) - (tmpvar_16.zxy * tmpvar_18.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_21;
  vec3 tmpvar_22;
  vec3 tmpvar_23;
  tmpvar_21.x = tmpvar_19.x;
  tmpvar_21.y = tmpvar_20.x;
  tmpvar_21.z = tmpvar_16.x;
  tmpvar_22.x = tmpvar_19.y;
  tmpvar_22.y = tmpvar_20.y;
  tmpvar_22.z = tmpvar_16.y;
  tmpvar_23.x = tmpvar_19.z;
  tmpvar_23.y = tmpvar_20.z;
  tmpvar_23.z = tmpvar_16.z;
  vec3 v_24;
  v_24.x = tmpvar_21.x;
  v_24.y = tmpvar_22.x;
  v_24.z = tmpvar_23.x;
  tmpvar_4.xyz = v_24;
  vec3 v_25;
  v_25.x = tmpvar_21.y;
  v_25.y = tmpvar_22.y;
  v_25.z = tmpvar_23.y;
  tmpvar_5.xyz = v_25;
  vec3 v_26;
  v_26.x = tmpvar_21.z;
  v_26.y = tmpvar_22.z;
  v_26.z = tmpvar_23.z;
  tmpvar_6.xyz = v_26;
  tmpvar_7 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_27;
  ambient_27 = vec3(0.0, 0.0, 0.0);
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_27 = vec3(0.0, 0.0, 0.0);
  };
  vec3 x1_28;
  vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_16.xyzz * tmpvar_16.yzzx);
  x1_28.x = dot (unity_SHBr, tmpvar_29);
  x1_28.y = dot (unity_SHBg, tmpvar_29);
  x1_28.z = dot (unity_SHBb, tmpvar_29);
  ambient_27 = (ambient_27 + (x1_28 + (unity_SHC.xyz * 
    ((tmpvar_16.x * tmpvar_16.x) - (tmpvar_16.y * tmpvar_16.y))
  )));
  tmpvar_7.xyz = ambient_27;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_10;
  xlv_TEXCOORD1 = n_12;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform float _OcclusionStrength;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1.x = _Metallic;
  tmpvar_1.y = _Glossiness;
  float tmpvar_2;
  tmpvar_2 = tmpvar_1.y;
  vec3 tmpvar_3;
  tmpvar_3 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_4;
  vec3 tmpvar_5;
  tmpvar_5 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, vec3(_Metallic));
  tmpvar_4 = (tmpvar_3 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = ((1.0 - _OcclusionStrength) + (texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y * _OcclusionStrength));
  vec3 tmpvar_8;
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  vec3 ambient_9;
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_6;
  vec3 x_11;
  x_11.x = dot (unity_SHAr, tmpvar_10);
  x_11.y = dot (unity_SHAg, tmpvar_10);
  x_11.z = dot (unity_SHAb, tmpvar_10);
  vec3 tmpvar_12;
  tmpvar_12 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD5.xyz + x_11));
  ambient_9 = tmpvar_12;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_9 = max (((1.055 * 
      pow (max (tmpvar_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  tmpvar_8 = (ambient_9 * tmpvar_7);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_4 * tmpvar_8);
  vec4 tmpvar_14;
  tmpvar_14.xyz = tmpvar_4;
  tmpvar_14.w = tmpvar_7;
  vec4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_5;
  tmpvar_15.w = tmpvar_2;
  vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = ((tmpvar_6 * 0.5) + 0.5);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_13.xyz;
  gl_FragData[0] = tmpvar_14;
  gl_FragData[1] = tmpvar_15;
  gl_FragData[2] = tmpvar_16;
  gl_FragData[3] = tmpvar_17;
}


#endif
"
}
SubProgram "metal " {
// Stats: 35 math, 2 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 306
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHBr] 4
VectorHalf 24 [unity_SHBg] 4
VectorHalf 32 [unity_SHBb] 4
VectorHalf 40 [unity_SHC] 4
Vector 240 [unity_WorldTransformParams]
VectorHalf 256 [unity_ColorSpaceLuminance] 4
Vector 272 [_MainTex_ST]
Vector 288 [_DetailAlbedoMap_ST]
ScalarHalf 304 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float3 tmpvar_12;
  tmpvar_12 = tmpvar_11.xyz;
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_13;
  texcoord_13.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_14;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_15;
  float3 n_16;
  n_16 = (tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos);
  tmpvar_15 = half3(n_16);
  float3 norm_17;
  norm_17 = float3(tmpvar_1);
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].x;
  v_18.y = _mtl_u._World2Object[1].x;
  v_18.z = _mtl_u._World2Object[2].x;
  v_18.w = _mtl_u._World2Object[3].x;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].y;
  v_19.y = _mtl_u._World2Object[1].y;
  v_19.z = _mtl_u._World2Object[2].y;
  v_19.w = _mtl_u._World2Object[3].y;
  float4 v_20;
  v_20.x = _mtl_u._World2Object[0].z;
  v_20.y = _mtl_u._World2Object[1].z;
  v_20.z = _mtl_u._World2Object[2].z;
  v_20.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  float3 dir_22;
  dir_22 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_23;
  tmpvar_23[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_23[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_23[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = float(tmpvar_4.w);
  half3 normal_25;
  normal_25 = half3(tmpvar_21);
  half3 tangent_26;
  tangent_26 = half3(tmpvar_24.xyz);
  half tangentSign_27;
  tangentSign_27 = half(tmpvar_24.w);
  half xlat_varsign_28;
  float tmpvar_29;
  tmpvar_29 = ((float)tangentSign_27 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_28 = half(tmpvar_29);
  half3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * xlat_varsign_28);
  half3x3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].x;
  v_32.y = tangentToWorld_5[1].x;
  v_32.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_5[0].y;
  v_33.y = tangentToWorld_5[1].y;
  v_33.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_33);
  float3 v_34;
  v_34.x = tangentToWorld_5[0].z;
  v_34.y = tangentToWorld_5[1].z;
  v_34.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_34);
  tmpvar_10 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 normal_35;
  normal_35 = half3(tmpvar_21);
  half3 ambient_36;
  ambient_36 = half3(float3(0.0, 0.0, 0.0));
  bool tmpvar_37;
  tmpvar_37 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_37) {
    ambient_36 = half3(float3(0.0, 0.0, 0.0));
  };
  half3 x1_38;
  half4 tmpvar_39;
  tmpvar_39 = (normal_35.xyzz * normal_35.yzzx);
  x1_38.x = dot (_mtl_u.unity_SHBr, tmpvar_39);
  x1_38.y = dot (_mtl_u.unity_SHBg, tmpvar_39);
  x1_38.z = dot (_mtl_u.unity_SHBb, tmpvar_39);
  ambient_36 = (ambient_36 + (x1_38 + (_mtl_u.unity_SHC.xyz * 
    ((normal_35.x * normal_35.x) - (normal_35.y * normal_35.y))
  )));
  tmpvar_10.xyz = ambient_36;
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_13;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_15;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 31 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_OcclusionMap] 2D 1
ConstBuffer "$Globals" 54
VectorHalf 0 [unity_SHAr] 4
VectorHalf 8 [unity_SHAg] 4
VectorHalf 16 [unity_SHAb] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
ScalarHalf 52 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
  half4 _glesFragData_1 [[color(1)]];
  half4 _glesFragData_2 [[color(2)]];
  half4 _glesFragData_3 [[color(3)]];
};
struct xlatMtlShaderUniform {
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _OcclusionMap [[texture(1)]], sampler _mtlsmp__OcclusionMap [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half2 tmpvar_2;
  tmpvar_2.x = _mtl_u._Metallic;
  tmpvar_2.y = _mtl_u._Glossiness;
  half tmpvar_3;
  tmpvar_3 = tmpvar_2.y;
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  tmpvar_5 = (tmpvar_4 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half occ_8;
  half tmpvar_9;
  tmpvar_9 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_8 = tmpvar_9;
  half tmpvar_10;
  tmpvar_10 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_8 * _mtl_u._OcclusionStrength));
  half3 tmpvar_11;
  tmpvar_11 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_12;
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = tmpvar_7;
  half3 x_14;
  x_14.x = dot (_mtl_u.unity_SHAr, tmpvar_13);
  x_14.y = dot (_mtl_u.unity_SHAg, tmpvar_13);
  x_14.z = dot (_mtl_u.unity_SHAb, tmpvar_13);
  half3 tmpvar_15;
  tmpvar_15 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_14));
  ambient_12 = tmpvar_15;
  bool tmpvar_16;
  tmpvar_16 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_16) {
    ambient_12 = max ((((half)1.055 * 
      pow (max (tmpvar_15, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_11 = (ambient_12 * tmpvar_10);
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = (tmpvar_5 * tmpvar_11);
  half4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_5;
  tmpvar_18.w = tmpvar_10;
  half4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_6;
  tmpvar_19.w = tmpvar_3;
  half4 tmpvar_20;
  tmpvar_20.w = half(1.0);
  tmpvar_20.xyz = ((tmpvar_7 * (half)0.5) + (half)0.5);
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = exp2(-(tmpvar_17.xyz));
  _mtl_o._glesFragData_0 = tmpvar_18;
  _mtl_o._glesFragData_1 = tmpvar_19;
  _mtl_o._glesFragData_2 = tmpvar_20;
  _mtl_o._glesFragData_3 = tmpvar_21;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 31 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_OcclusionMap] 2D 1
ConstBuffer "$Globals" 54
VectorHalf 0 [unity_SHAr] 4
VectorHalf 8 [unity_SHAg] 4
VectorHalf 16 [unity_SHAb] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
ScalarHalf 52 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
  half4 _glesFragData_1 [[color(1)]];
  half4 _glesFragData_2 [[color(2)]];
  half4 _glesFragData_3 [[color(3)]];
};
struct xlatMtlShaderUniform {
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _OcclusionMap [[texture(1)]], sampler _mtlsmp__OcclusionMap [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half2 tmpvar_2;
  tmpvar_2.x = _mtl_u._Metallic;
  tmpvar_2.y = _mtl_u._Glossiness;
  half tmpvar_3;
  tmpvar_3 = tmpvar_2.y;
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  tmpvar_5 = (tmpvar_4 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half occ_8;
  half tmpvar_9;
  tmpvar_9 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_8 = tmpvar_9;
  half tmpvar_10;
  tmpvar_10 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_8 * _mtl_u._OcclusionStrength));
  half3 tmpvar_11;
  tmpvar_11 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_12;
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = tmpvar_7;
  half3 x_14;
  x_14.x = dot (_mtl_u.unity_SHAr, tmpvar_13);
  x_14.y = dot (_mtl_u.unity_SHAg, tmpvar_13);
  x_14.z = dot (_mtl_u.unity_SHAb, tmpvar_13);
  half3 tmpvar_15;
  tmpvar_15 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_14));
  ambient_12 = tmpvar_15;
  bool tmpvar_16;
  tmpvar_16 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_16) {
    ambient_12 = max ((((half)1.055 * 
      pow (max (tmpvar_15, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_11 = (ambient_12 * tmpvar_10);
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = (tmpvar_5 * tmpvar_11);
  half4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_5;
  tmpvar_18.w = tmpvar_10;
  half4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_6;
  tmpvar_19.w = tmpvar_3;
  half4 tmpvar_20;
  tmpvar_20.w = half(1.0);
  tmpvar_20.xyz = ((tmpvar_7 * (half)0.5) + (half)0.5);
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = exp2(-(tmpvar_17.xyz));
  _mtl_o._glesFragData_0 = tmpvar_18;
  _mtl_o._glesFragData_1 = tmpvar_19;
  _mtl_o._glesFragData_2 = tmpvar_20;
  _mtl_o._glesFragData_3 = tmpvar_21;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 31 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_OcclusionMap] 2D 1
ConstBuffer "$Globals" 54
VectorHalf 0 [unity_SHAr] 4
VectorHalf 8 [unity_SHAg] 4
VectorHalf 16 [unity_SHAb] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
ScalarHalf 52 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
  half4 _glesFragData_1 [[color(1)]];
  half4 _glesFragData_2 [[color(2)]];
  half4 _glesFragData_3 [[color(3)]];
};
struct xlatMtlShaderUniform {
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _OcclusionMap [[texture(1)]], sampler _mtlsmp__OcclusionMap [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half2 tmpvar_2;
  tmpvar_2.x = _mtl_u._Metallic;
  tmpvar_2.y = _mtl_u._Glossiness;
  half tmpvar_3;
  tmpvar_3 = tmpvar_2.y;
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  tmpvar_5 = (tmpvar_4 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half occ_8;
  half tmpvar_9;
  tmpvar_9 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_8 = tmpvar_9;
  half tmpvar_10;
  tmpvar_10 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_8 * _mtl_u._OcclusionStrength));
  half3 tmpvar_11;
  tmpvar_11 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_12;
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = tmpvar_7;
  half3 x_14;
  x_14.x = dot (_mtl_u.unity_SHAr, tmpvar_13);
  x_14.y = dot (_mtl_u.unity_SHAg, tmpvar_13);
  x_14.z = dot (_mtl_u.unity_SHAb, tmpvar_13);
  half3 tmpvar_15;
  tmpvar_15 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_14));
  ambient_12 = tmpvar_15;
  bool tmpvar_16;
  tmpvar_16 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_16) {
    ambient_12 = max ((((half)1.055 * 
      pow (max (tmpvar_15, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_11 = (ambient_12 * tmpvar_10);
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = (tmpvar_5 * tmpvar_11);
  half4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_5;
  tmpvar_18.w = tmpvar_10;
  half4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_6;
  tmpvar_19.w = tmpvar_3;
  half4 tmpvar_20;
  tmpvar_20.w = half(1.0);
  tmpvar_20.xyz = ((tmpvar_7 * (half)0.5) + (half)0.5);
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = exp2(-(tmpvar_17.xyz));
  _mtl_o._glesFragData_0 = tmpvar_18;
  _mtl_o._glesFragData_1 = tmpvar_19;
  _mtl_o._glesFragData_2 = tmpvar_20;
  _mtl_o._glesFragData_3 = tmpvar_21;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 29 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_OcclusionMap] 2D 1
ConstBuffer "$Globals" 54
VectorHalf 0 [unity_SHAr] 4
VectorHalf 8 [unity_SHAg] 4
VectorHalf 16 [unity_SHAb] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
ScalarHalf 52 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
  half4 _glesFragData_1 [[color(1)]];
  half4 _glesFragData_2 [[color(2)]];
  half4 _glesFragData_3 [[color(3)]];
};
struct xlatMtlShaderUniform {
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _OcclusionMap [[texture(1)]], sampler _mtlsmp__OcclusionMap [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half2 tmpvar_2;
  tmpvar_2.x = _mtl_u._Metallic;
  tmpvar_2.y = _mtl_u._Glossiness;
  half tmpvar_3;
  tmpvar_3 = tmpvar_2.y;
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  tmpvar_5 = (tmpvar_4 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half occ_8;
  half tmpvar_9;
  tmpvar_9 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_8 = tmpvar_9;
  half tmpvar_10;
  tmpvar_10 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_8 * _mtl_u._OcclusionStrength));
  half3 tmpvar_11;
  tmpvar_11 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_12;
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = tmpvar_7;
  half3 x_14;
  x_14.x = dot (_mtl_u.unity_SHAr, tmpvar_13);
  x_14.y = dot (_mtl_u.unity_SHAg, tmpvar_13);
  x_14.z = dot (_mtl_u.unity_SHAb, tmpvar_13);
  half3 tmpvar_15;
  tmpvar_15 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_14));
  ambient_12 = tmpvar_15;
  bool tmpvar_16;
  tmpvar_16 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_16) {
    ambient_12 = max ((((half)1.055 * 
      pow (max (tmpvar_15, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_11 = (ambient_12 * tmpvar_10);
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = (tmpvar_5 * tmpvar_11);
  half4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_5;
  tmpvar_18.w = tmpvar_10;
  half4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_6;
  tmpvar_19.w = tmpvar_3;
  half4 tmpvar_20;
  tmpvar_20.w = half(1.0);
  tmpvar_20.xyz = ((tmpvar_7 * (half)0.5) + (half)0.5);
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = tmpvar_17.xyz;
  _mtl_o._glesFragData_0 = tmpvar_18;
  _mtl_o._glesFragData_1 = tmpvar_19;
  _mtl_o._glesFragData_2 = tmpvar_20;
  _mtl_o._glesFragData_3 = tmpvar_21;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 29 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_OcclusionMap] 2D 1
ConstBuffer "$Globals" 54
VectorHalf 0 [unity_SHAr] 4
VectorHalf 8 [unity_SHAg] 4
VectorHalf 16 [unity_SHAb] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
ScalarHalf 52 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
  half4 _glesFragData_1 [[color(1)]];
  half4 _glesFragData_2 [[color(2)]];
  half4 _glesFragData_3 [[color(3)]];
};
struct xlatMtlShaderUniform {
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _OcclusionMap [[texture(1)]], sampler _mtlsmp__OcclusionMap [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half2 tmpvar_2;
  tmpvar_2.x = _mtl_u._Metallic;
  tmpvar_2.y = _mtl_u._Glossiness;
  half tmpvar_3;
  tmpvar_3 = tmpvar_2.y;
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  tmpvar_5 = (tmpvar_4 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half occ_8;
  half tmpvar_9;
  tmpvar_9 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_8 = tmpvar_9;
  half tmpvar_10;
  tmpvar_10 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_8 * _mtl_u._OcclusionStrength));
  half3 tmpvar_11;
  tmpvar_11 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_12;
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = tmpvar_7;
  half3 x_14;
  x_14.x = dot (_mtl_u.unity_SHAr, tmpvar_13);
  x_14.y = dot (_mtl_u.unity_SHAg, tmpvar_13);
  x_14.z = dot (_mtl_u.unity_SHAb, tmpvar_13);
  half3 tmpvar_15;
  tmpvar_15 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_14));
  ambient_12 = tmpvar_15;
  bool tmpvar_16;
  tmpvar_16 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_16) {
    ambient_12 = max ((((half)1.055 * 
      pow (max (tmpvar_15, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_11 = (ambient_12 * tmpvar_10);
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = (tmpvar_5 * tmpvar_11);
  half4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_5;
  tmpvar_18.w = tmpvar_10;
  half4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_6;
  tmpvar_19.w = tmpvar_3;
  half4 tmpvar_20;
  tmpvar_20.w = half(1.0);
  tmpvar_20.xyz = ((tmpvar_7 * (half)0.5) + (half)0.5);
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = tmpvar_17.xyz;
  _mtl_o._glesFragData_0 = tmpvar_18;
  _mtl_o._glesFragData_1 = tmpvar_19;
  _mtl_o._glesFragData_2 = tmpvar_20;
  _mtl_o._glesFragData_3 = tmpvar_21;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 29 math, 2 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_OcclusionMap] 2D 1
ConstBuffer "$Globals" 54
VectorHalf 0 [unity_SHAr] 4
VectorHalf 8 [unity_SHAg] 4
VectorHalf 16 [unity_SHAb] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [unity_ColorSpaceLuminance] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
ScalarHalf 52 [_OcclusionStrength]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
  half4 _glesFragData_1 [[color(1)]];
  half4 _glesFragData_2 [[color(2)]];
  half4 _glesFragData_3 [[color(3)]];
};
struct xlatMtlShaderUniform {
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_ColorSpaceDielectricSpec;
  half4 unity_ColorSpaceLuminance;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
  half _OcclusionStrength;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _OcclusionMap [[texture(1)]], sampler _mtlsmp__OcclusionMap [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half2 tmpvar_2;
  tmpvar_2.x = _mtl_u._Metallic;
  tmpvar_2.y = _mtl_u._Glossiness;
  half tmpvar_3;
  tmpvar_3 = tmpvar_2.y;
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  tmpvar_5 = (tmpvar_4 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half occ_8;
  half tmpvar_9;
  tmpvar_9 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy)).y;
  occ_8 = tmpvar_9;
  half tmpvar_10;
  tmpvar_10 = (((half)1.0 - _mtl_u._OcclusionStrength) + (occ_8 * _mtl_u._OcclusionStrength));
  half3 tmpvar_11;
  tmpvar_11 = half3(float3(0.0, 0.0, 0.0));
  half3 ambient_12;
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = tmpvar_7;
  half3 x_14;
  x_14.x = dot (_mtl_u.unity_SHAr, tmpvar_13);
  x_14.y = dot (_mtl_u.unity_SHAg, tmpvar_13);
  x_14.z = dot (_mtl_u.unity_SHAb, tmpvar_13);
  half3 tmpvar_15;
  tmpvar_15 = max ((half3)float3(0.0, 0.0, 0.0), (_mtl_i.xlv_TEXCOORD5.xyz + x_14));
  ambient_12 = tmpvar_15;
  bool tmpvar_16;
  tmpvar_16 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_16) {
    ambient_12 = max ((((half)1.055 * 
      pow (max (tmpvar_15, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  tmpvar_11 = (ambient_12 * tmpvar_10);
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = (tmpvar_5 * tmpvar_11);
  half4 tmpvar_18;
  tmpvar_18.xyz = tmpvar_5;
  tmpvar_18.w = tmpvar_10;
  half4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_6;
  tmpvar_19.w = tmpvar_3;
  half4 tmpvar_20;
  tmpvar_20.w = half(1.0);
  tmpvar_20.xyz = ((tmpvar_7 * (half)0.5) + (half)0.5);
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = tmpvar_17.xyz;
  _mtl_o._glesFragData_0 = tmpvar_18;
  _mtl_o._glesFragData_1 = tmpvar_19;
  _mtl_o._glesFragData_2 = tmpvar_20;
  _mtl_o._glesFragData_3 = tmpvar_21;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on glcore"
}
}
 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }


 // Stats for Vertex shader:
 //       metal : 55 avg math (40..70), 2 branch
 //      opengl : 49 avg math (49..50), 4 avg texture (4..5)
 // Stats for Fragment shader:
 //       metal : 49 avg math (49..50), 4 avg texture (4..5)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 358221
Program "vp" {
SubProgram "opengl " {
// Stats: 49 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 ambientOrLightmapUV_15;
  ambientOrLightmapUV_15 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_16;
  ambient_16 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_14;
  vec3 res_18;
  vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  vec3 x1_20;
  vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )));
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    res_18 = max (((1.055 * 
      pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  ambient_16 = max (vec3(0.0, 0.0, 0.0), res_18);
  ambientOrLightmapUV_15.xyz = ambient_16;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_15;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  vec3 tmpvar_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  tmpvar_8 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_6, xlv_TEXCOORD1)
   * tmpvar_6)));
  vec4 tmpvar_10;
  tmpvar_10.xyz = tmpvar_8;
  tmpvar_10.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_11;
  tmpvar_11 = textureCube (unity_SpecCube0, tmpvar_8, tmpvar_10.w);
  vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  vec3 color_13;
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_6, viewDir_12) * tmpvar_6)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_6, viewDir_12), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_9;
  color_13 = ((tmpvar_3 + (
    (texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0)
   * tmpvar_4)) * (_LightColor0.xyz * clamp (
    dot (tmpvar_6, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_13 = (color_13 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_7)
   * tmpvar_3) + (
    (((unity_SpecCube0_HDR.x * pow (tmpvar_11.w, unity_SpecCube0_HDR.y)) * tmpvar_11.xyz) * tmpvar_7)
   * 
    mix (tmpvar_4, vec3(clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)), tmpvar_15.yyy)
  )));
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = color_13;
  c_1.w = tmpvar_17.w;
  c_1.xyz = color_13;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = c_1.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif
"
}
SubProgram "metal " {
// Stats: 40 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 322
Matrix 80 [glstate_matrix_mvp]
Matrix 144 [_Object2World]
Matrix 208 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [unity_SHAr] 4
VectorHalf 24 [unity_SHAg] 4
VectorHalf 32 [unity_SHAb] 4
VectorHalf 40 [unity_SHBr] 4
VectorHalf 48 [unity_SHBg] 4
VectorHalf 56 [unity_SHBb] 4
VectorHalf 64 [unity_SHC] 4
VectorHalf 272 [unity_ColorSpaceLuminance] 4
Vector 288 [_MainTex_ST]
Vector 304 [_DetailAlbedoMap_ST]
ScalarHalf 320 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  float4 tmpvar_8;
  tmpvar_8 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_9;
  texcoord_9.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_10;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_10 = tmpvar_2;
  } else {
    tmpvar_10 = tmpvar_3;
  };
  texcoord_9.zw = ((tmpvar_10 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_11;
  float3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_8.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_11 = half3(tmpvar_12);
  float3 norm_13;
  norm_13 = float3(tmpvar_1);
  float4 v_14;
  v_14.x = _mtl_u._World2Object[0].x;
  v_14.y = _mtl_u._World2Object[1].x;
  v_14.z = _mtl_u._World2Object[2].x;
  v_14.w = _mtl_u._World2Object[3].x;
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].y;
  v_15.y = _mtl_u._World2Object[1].y;
  v_15.z = _mtl_u._World2Object[2].y;
  v_15.w = _mtl_u._World2Object[3].y;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].z;
  v_16.y = _mtl_u._World2Object[1].z;
  v_16.z = _mtl_u._World2Object[2].z;
  v_16.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_17;
  tmpvar_17 = normalize(((
    (v_14.xyz * norm_13.x)
   + 
    (v_15.xyz * norm_13.y)
  ) + (v_16.xyz * norm_13.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_17);
  half3 normalWorld_18;
  normalWorld_18 = half3(tmpvar_17);
  half4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 ambient_20;
  ambient_20 = half3(float3(0.0, 0.0, 0.0));
  half4 tmpvar_21;
  tmpvar_21.w = half(1.0);
  tmpvar_21.xyz = normalWorld_18;
  half3 res_22;
  half3 x_23;
  x_23.x = dot (_mtl_u.unity_SHAr, tmpvar_21);
  x_23.y = dot (_mtl_u.unity_SHAg, tmpvar_21);
  x_23.z = dot (_mtl_u.unity_SHAb, tmpvar_21);
  half3 x1_24;
  half4 tmpvar_25;
  tmpvar_25 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_24.x = dot (_mtl_u.unity_SHBr, tmpvar_25);
  x1_24.y = dot (_mtl_u.unity_SHBg, tmpvar_25);
  x1_24.z = dot (_mtl_u.unity_SHBb, tmpvar_25);
  res_22 = (x_23 + (x1_24 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  bool tmpvar_26;
  tmpvar_26 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_26) {
    res_22 = max ((((half)1.055 * 
      pow (max (res_22, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  ambient_20 = max ((half3)float3(0.0, 0.0, 0.0), res_22);
  ambientOrLightmapUV_19.xyz = ambient_20;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_9;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_11;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb12 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat22 = (-u_xlat0.x) + _Glossiness;
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat6.xyz = vec3(u_xlat22) + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat0.zzz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat10_0 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_0 = u_xlat10_0.w * 16.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 50 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 o_15;
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_3 * 0.5);
  vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_16.x;
  tmpvar_17.y = (tmpvar_16.y * _ProjectionParams.x);
  o_15.xy = (tmpvar_17 + tmpvar_16.w);
  o_15.zw = tmpvar_3.zw;
  vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18 = vec4(0.0, 0.0, 0.0, 0.0);
  vec3 ambient_19;
  ambient_19 = vec3(0.0, 0.0, 0.0);
  vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_14;
  vec3 res_21;
  vec3 x_22;
  x_22.x = dot (unity_SHAr, tmpvar_20);
  x_22.y = dot (unity_SHAg, tmpvar_20);
  x_22.z = dot (unity_SHAb, tmpvar_20);
  vec3 x1_23;
  vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x1_23.x = dot (unity_SHBr, tmpvar_24);
  x1_23.y = dot (unity_SHBg, tmpvar_24);
  x1_23.z = dot (unity_SHBb, tmpvar_24);
  res_21 = (x_22 + (x1_23 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )));
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    res_21 = max (((1.055 * 
      pow (max (res_21, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  ambient_19 = max (vec3(0.0, 0.0, 0.0), res_21);
  ambientOrLightmapUV_18.xyz = ambient_19;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_18;
  xlv_TEXCOORD6 = o_15;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  vec3 tmpvar_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  tmpvar_8 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_6, xlv_TEXCOORD1)
   * tmpvar_6)));
  vec4 tmpvar_10;
  tmpvar_10.xyz = tmpvar_8;
  tmpvar_10.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_11;
  tmpvar_11 = textureCube (unity_SpecCube0, tmpvar_8, tmpvar_10.w);
  vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  vec3 color_13;
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_6, viewDir_12) * tmpvar_6)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_6, viewDir_12), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_9;
  color_13 = ((tmpvar_3 + (
    (texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0)
   * tmpvar_4)) * ((_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * clamp (
    dot (tmpvar_6, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_13 = (color_13 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_7)
   * tmpvar_3) + (
    (((unity_SpecCube0_HDR.x * pow (tmpvar_11.w, unity_SpecCube0_HDR.y)) * tmpvar_11.xyz) * tmpvar_7)
   * 
    mix (tmpvar_4, vec3(clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)), tmpvar_15.yyy)
  )));
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = color_13;
  c_1.w = tmpvar_17.w;
  c_1.xyz = color_13;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = c_1.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif
"
}
SubProgram "metal " {
// Stats: 43 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 338
Matrix 96 [glstate_matrix_mvp]
Matrix 160 [_Object2World]
Matrix 224 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
VectorHalf 32 [unity_SHAr] 4
VectorHalf 40 [unity_SHAg] 4
VectorHalf 48 [unity_SHAb] 4
VectorHalf 56 [unity_SHBr] 4
VectorHalf 64 [unity_SHBg] 4
VectorHalf 72 [unity_SHBb] 4
VectorHalf 80 [unity_SHC] 4
VectorHalf 288 [unity_ColorSpaceLuminance] 4
Vector 304 [_MainTex_ST]
Vector 320 [_DetailAlbedoMap_ST]
ScalarHalf 336 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_10;
  texcoord_10.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_11;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_12;
  float3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_12 = half3(tmpvar_13);
  float3 norm_14;
  norm_14 = float3(tmpvar_1);
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].x;
  v_15.y = _mtl_u._World2Object[1].x;
  v_15.z = _mtl_u._World2Object[2].x;
  v_15.w = _mtl_u._World2Object[3].x;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].y;
  v_16.y = _mtl_u._World2Object[1].y;
  v_16.z = _mtl_u._World2Object[2].y;
  v_16.w = _mtl_u._World2Object[3].y;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].z;
  v_17.y = _mtl_u._World2Object[1].z;
  v_17.z = _mtl_u._World2Object[2].z;
  v_17.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_18);
  float4 o_19;
  float4 tmpvar_20;
  tmpvar_20 = (tmpvar_4 * 0.5);
  float2 tmpvar_21;
  tmpvar_21.x = tmpvar_20.x;
  tmpvar_21.y = (tmpvar_20.y * _mtl_u._ProjectionParams.x);
  o_19.xy = (tmpvar_21 + tmpvar_20.w);
  o_19.zw = tmpvar_4.zw;
  tmpvar_8 = half4(o_19);
  half3 normalWorld_22;
  normalWorld_22 = half3(tmpvar_18);
  half4 ambientOrLightmapUV_23;
  ambientOrLightmapUV_23 = half4(float4(0.0, 0.0, 0.0, 0.0));
  half3 ambient_24;
  ambient_24 = half3(float3(0.0, 0.0, 0.0));
  half4 tmpvar_25;
  tmpvar_25.w = half(1.0);
  tmpvar_25.xyz = normalWorld_22;
  half3 res_26;
  half3 x_27;
  x_27.x = dot (_mtl_u.unity_SHAr, tmpvar_25);
  x_27.y = dot (_mtl_u.unity_SHAg, tmpvar_25);
  x_27.z = dot (_mtl_u.unity_SHAb, tmpvar_25);
  half3 x1_28;
  half4 tmpvar_29;
  tmpvar_29 = (normalWorld_22.xyzz * normalWorld_22.yzzx);
  x1_28.x = dot (_mtl_u.unity_SHBr, tmpvar_29);
  x1_28.y = dot (_mtl_u.unity_SHBg, tmpvar_29);
  x1_28.z = dot (_mtl_u.unity_SHBb, tmpvar_29);
  res_26 = (x_27 + (x1_28 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_22.x * normalWorld_22.x) - (normalWorld_22.y * normalWorld_22.y))
  )));
  bool tmpvar_30;
  tmpvar_30 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_30) {
    res_26 = max ((((half)1.055 * 
      pow (max (res_26, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  ambient_24 = max ((half3)float3(0.0, 0.0, 0.0), res_26);
  ambientOrLightmapUV_23.xyz = ambient_24;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_10;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_12;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_23;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_8;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    vs_TEXCOORD1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat2.x = u_xlat1.y * u_xlat1.y;
    u_xlat2.x = u_xlat1.x * u_xlat1.x + (-u_xlat2.x);
    u_xlat3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat2.xyz = unity_SHC.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb16 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : u_xlat1.xyz;
    vs_TEXCOORD5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat8;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat1.xy * u_xlat1.xy;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat8 = (-u_xlat1.x) + _Glossiness;
    u_xlat8 = u_xlat8 + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = vec3(u_xlat8) + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat0.zzz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_7 = u_xlat10_6.w * 16.0;
    u_xlat7.xyz = vec3(u_xlat16_7) * u_xlat4.xyz + u_xlat1.xzw;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat7.xyz * u_xlat2.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 49 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 ambientOrLightmapUV_15;
  ambientOrLightmapUV_15.w = 0.0;
  vec3 col_16;
  vec4 ndotl_17;
  vec4 lengthSq_18;
  vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosX0 - tmpvar_7.x);
  vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosY0 - tmpvar_7.y);
  vec4 tmpvar_21;
  tmpvar_21 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_18 = (tmpvar_19 * tmpvar_19);
  lengthSq_18 = (lengthSq_18 + (tmpvar_20 * tmpvar_20));
  lengthSq_18 = (lengthSq_18 + (tmpvar_21 * tmpvar_21));
  ndotl_17 = (tmpvar_19 * tmpvar_14.x);
  ndotl_17 = (ndotl_17 + (tmpvar_20 * tmpvar_14.y));
  ndotl_17 = (ndotl_17 + (tmpvar_21 * tmpvar_14.z));
  vec4 tmpvar_22;
  tmpvar_22 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_17 * inversesqrt(lengthSq_18)));
  ndotl_17 = tmpvar_22;
  vec4 tmpvar_23;
  tmpvar_23 = (tmpvar_22 * (1.0/((1.0 + 
    (lengthSq_18 * unity_4LightAtten0)
  ))));
  col_16 = (unity_LightColor[0].xyz * tmpvar_23.x);
  col_16 = (col_16 + (unity_LightColor[1].xyz * tmpvar_23.y));
  col_16 = (col_16 + (unity_LightColor[2].xyz * tmpvar_23.z));
  col_16 = (col_16 + (unity_LightColor[3].xyz * tmpvar_23.w));
  ambientOrLightmapUV_15.xyz = col_16;
  vec3 ambient_24;
  ambient_24 = ambientOrLightmapUV_15.xyz;
  vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_14;
  vec3 res_26;
  vec3 x_27;
  x_27.x = dot (unity_SHAr, tmpvar_25);
  x_27.y = dot (unity_SHAg, tmpvar_25);
  x_27.z = dot (unity_SHAb, tmpvar_25);
  vec3 x1_28;
  vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x1_28.x = dot (unity_SHBr, tmpvar_29);
  x1_28.y = dot (unity_SHBg, tmpvar_29);
  x1_28.z = dot (unity_SHBb, tmpvar_29);
  res_26 = (x_27 + (x1_28 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )));
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    res_26 = max (((1.055 * 
      pow (max (res_26, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  ambient_24 = (col_16 + max (vec3(0.0, 0.0, 0.0), res_26));
  ambientOrLightmapUV_15.xyz = ambient_24;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_15;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  vec3 tmpvar_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  tmpvar_8 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_6, xlv_TEXCOORD1)
   * tmpvar_6)));
  vec4 tmpvar_10;
  tmpvar_10.xyz = tmpvar_8;
  tmpvar_10.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_11;
  tmpvar_11 = textureCube (unity_SpecCube0, tmpvar_8, tmpvar_10.w);
  vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  vec3 color_13;
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_6, viewDir_12) * tmpvar_6)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_6, viewDir_12), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_9;
  color_13 = ((tmpvar_3 + (
    (texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0)
   * tmpvar_4)) * (_LightColor0.xyz * clamp (
    dot (tmpvar_6, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_13 = (color_13 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_7)
   * tmpvar_3) + (
    (((unity_SpecCube0_HDR.x * pow (tmpvar_11.w, unity_SpecCube0_HDR.y)) * tmpvar_11.xyz) * tmpvar_7)
   * 
    mix (tmpvar_4, vec3(clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)), tmpvar_15.yyy)
  )));
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = color_13;
  c_1.w = tmpvar_17.w;
  c_1.xyz = color_13;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = c_1.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif
"
}
SubProgram "metal " {
// Stats: 67 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 434
Matrix 192 [glstate_matrix_mvp]
Matrix 256 [_Object2World]
Matrix 320 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [unity_4LightPosX0]
Vector 32 [unity_4LightPosY0]
Vector 48 [unity_4LightPosZ0]
VectorHalf 64 [unity_4LightAtten0] 4
VectorHalf 72 [unity_LightColor0] 4
VectorHalf 80 [unity_LightColor1] 4
VectorHalf 88 [unity_LightColor2] 4
VectorHalf 96 [unity_LightColor3] 4
VectorHalf 104 [unity_LightColor4] 4
VectorHalf 112 [unity_LightColor5] 4
VectorHalf 120 [unity_LightColor6] 4
VectorHalf 128 [unity_LightColor7] 4
VectorHalf 136 [unity_SHAr] 4
VectorHalf 144 [unity_SHAg] 4
VectorHalf 152 [unity_SHAb] 4
VectorHalf 160 [unity_SHBr] 4
VectorHalf 168 [unity_SHBg] 4
VectorHalf 176 [unity_SHBb] 4
VectorHalf 184 [unity_SHC] 4
VectorHalf 384 [unity_ColorSpaceLuminance] 4
Vector 400 [_MainTex_ST]
Vector 416 [_DetailAlbedoMap_ST]
ScalarHalf 432 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 unity_4LightPosX0;
  float4 unity_4LightPosY0;
  float4 unity_4LightPosZ0;
  half4 unity_4LightAtten0;
  half4 unity_LightColor[8];
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  float4 tmpvar_8;
  tmpvar_8 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_9;
  texcoord_9.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_10;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_10 = tmpvar_2;
  } else {
    tmpvar_10 = tmpvar_3;
  };
  texcoord_9.zw = ((tmpvar_10 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_11;
  float3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_8.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_11 = half3(tmpvar_12);
  float3 norm_13;
  norm_13 = float3(tmpvar_1);
  float4 v_14;
  v_14.x = _mtl_u._World2Object[0].x;
  v_14.y = _mtl_u._World2Object[1].x;
  v_14.z = _mtl_u._World2Object[2].x;
  v_14.w = _mtl_u._World2Object[3].x;
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].y;
  v_15.y = _mtl_u._World2Object[1].y;
  v_15.z = _mtl_u._World2Object[2].y;
  v_15.w = _mtl_u._World2Object[3].y;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].z;
  v_16.y = _mtl_u._World2Object[1].z;
  v_16.z = _mtl_u._World2Object[2].z;
  v_16.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_17;
  tmpvar_17 = normalize(((
    (v_14.xyz * norm_13.x)
   + 
    (v_15.xyz * norm_13.y)
  ) + (v_16.xyz * norm_13.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_17);
  half3 normalWorld_18;
  normalWorld_18 = half3(tmpvar_17);
  half4 ambientOrLightmapUV_19;
  ambientOrLightmapUV_19.w = half(0.0);
  float3 lightColor0_20;
  lightColor0_20 = float3(_mtl_u.unity_LightColor[0].xyz);
  float3 lightColor1_21;
  lightColor1_21 = float3(_mtl_u.unity_LightColor[1].xyz);
  float3 lightColor2_22;
  lightColor2_22 = float3(_mtl_u.unity_LightColor[2].xyz);
  float3 lightColor3_23;
  lightColor3_23 = float3(_mtl_u.unity_LightColor[3].xyz);
  float4 lightAttenSq_24;
  lightAttenSq_24 = float4(_mtl_u.unity_4LightAtten0);
  float3 normal_25;
  normal_25 = float3(normalWorld_18);
  float3 col_26;
  float4 ndotl_27;
  float4 lengthSq_28;
  float4 tmpvar_29;
  tmpvar_29 = (_mtl_u.unity_4LightPosX0 - tmpvar_8.x);
  float4 tmpvar_30;
  tmpvar_30 = (_mtl_u.unity_4LightPosY0 - tmpvar_8.y);
  float4 tmpvar_31;
  tmpvar_31 = (_mtl_u.unity_4LightPosZ0 - tmpvar_8.z);
  lengthSq_28 = (tmpvar_29 * tmpvar_29);
  lengthSq_28 = (lengthSq_28 + (tmpvar_30 * tmpvar_30));
  lengthSq_28 = (lengthSq_28 + (tmpvar_31 * tmpvar_31));
  ndotl_27 = (tmpvar_29 * normal_25.x);
  ndotl_27 = (ndotl_27 + (tmpvar_30 * normal_25.y));
  ndotl_27 = (ndotl_27 + (tmpvar_31 * normal_25.z));
  float4 tmpvar_32;
  tmpvar_32 = max (float4(0.0, 0.0, 0.0, 0.0), (ndotl_27 * rsqrt(lengthSq_28)));
  ndotl_27 = tmpvar_32;
  float4 tmpvar_33;
  tmpvar_33 = (tmpvar_32 * (1.0/((1.0 + 
    (lengthSq_28 * lightAttenSq_24)
  ))));
  col_26 = (lightColor0_20 * tmpvar_33.x);
  col_26 = (col_26 + (lightColor1_21 * tmpvar_33.y));
  col_26 = (col_26 + (lightColor2_22 * tmpvar_33.z));
  col_26 = (col_26 + (lightColor3_23 * tmpvar_33.w));
  ambientOrLightmapUV_19.xyz = half3(col_26);
  half3 ambient_34;
  ambient_34 = ambientOrLightmapUV_19.xyz;
  half4 tmpvar_35;
  tmpvar_35.w = half(1.0);
  tmpvar_35.xyz = normalWorld_18;
  half3 res_36;
  half3 x_37;
  x_37.x = dot (_mtl_u.unity_SHAr, tmpvar_35);
  x_37.y = dot (_mtl_u.unity_SHAg, tmpvar_35);
  x_37.z = dot (_mtl_u.unity_SHAb, tmpvar_35);
  half3 x1_38;
  half4 tmpvar_39;
  tmpvar_39 = (normalWorld_18.xyzz * normalWorld_18.yzzx);
  x1_38.x = dot (_mtl_u.unity_SHBr, tmpvar_39);
  x1_38.y = dot (_mtl_u.unity_SHBg, tmpvar_39);
  x1_38.z = dot (_mtl_u.unity_SHBb, tmpvar_39);
  res_36 = (x_37 + (x1_38 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_18.x * normalWorld_18.x) - (normalWorld_18.y * normalWorld_18.y))
  )));
  bool tmpvar_40;
  tmpvar_40 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_40) {
    res_36 = max ((((half)1.055 * 
      pow (max (res_36, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  ambient_34 = (ambientOrLightmapUV_19.xyz + max ((half3)float3(0.0, 0.0, 0.0), res_36));
  ambientOrLightmapUV_19.xyz = ambient_34;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_9;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_11;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_19;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TEXCOORD1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb18 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat22 = (-u_xlat0.x) + _Glossiness;
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat6.xyz = vec3(u_xlat22) + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat0.zzz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat10_0 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_0 = u_xlat10_0.w * 16.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 50 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  vec4 v_11;
  v_11.x = _World2Object[0].x;
  v_11.y = _World2Object[1].x;
  v_11.z = _World2Object[2].x;
  v_11.w = _World2Object[3].x;
  vec4 v_12;
  v_12.x = _World2Object[0].y;
  v_12.y = _World2Object[1].y;
  v_12.z = _World2Object[2].y;
  v_12.w = _World2Object[3].y;
  vec4 v_13;
  v_13.x = _World2Object[0].z;
  v_13.y = _World2Object[1].z;
  v_13.z = _World2Object[2].z;
  v_13.w = _World2Object[3].z;
  vec3 tmpvar_14;
  tmpvar_14 = normalize(((
    (v_11.xyz * gl_Normal.x)
   + 
    (v_12.xyz * gl_Normal.y)
  ) + (v_13.xyz * gl_Normal.z)));
  tmpvar_4.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_5.xyz = vec3(0.0, 0.0, 0.0);
  tmpvar_6.xyz = tmpvar_14;
  vec4 o_15;
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_3 * 0.5);
  vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_16.x;
  tmpvar_17.y = (tmpvar_16.y * _ProjectionParams.x);
  o_15.xy = (tmpvar_17 + tmpvar_16.w);
  o_15.zw = tmpvar_3.zw;
  vec4 ambientOrLightmapUV_18;
  ambientOrLightmapUV_18.w = 0.0;
  vec3 col_19;
  vec4 ndotl_20;
  vec4 lengthSq_21;
  vec4 tmpvar_22;
  tmpvar_22 = (unity_4LightPosX0 - tmpvar_7.x);
  vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosY0 - tmpvar_7.y);
  vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_21 = (tmpvar_22 * tmpvar_22);
  lengthSq_21 = (lengthSq_21 + (tmpvar_23 * tmpvar_23));
  lengthSq_21 = (lengthSq_21 + (tmpvar_24 * tmpvar_24));
  ndotl_20 = (tmpvar_22 * tmpvar_14.x);
  ndotl_20 = (ndotl_20 + (tmpvar_23 * tmpvar_14.y));
  ndotl_20 = (ndotl_20 + (tmpvar_24 * tmpvar_14.z));
  vec4 tmpvar_25;
  tmpvar_25 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_20 * inversesqrt(lengthSq_21)));
  ndotl_20 = tmpvar_25;
  vec4 tmpvar_26;
  tmpvar_26 = (tmpvar_25 * (1.0/((1.0 + 
    (lengthSq_21 * unity_4LightAtten0)
  ))));
  col_19 = (unity_LightColor[0].xyz * tmpvar_26.x);
  col_19 = (col_19 + (unity_LightColor[1].xyz * tmpvar_26.y));
  col_19 = (col_19 + (unity_LightColor[2].xyz * tmpvar_26.z));
  col_19 = (col_19 + (unity_LightColor[3].xyz * tmpvar_26.w));
  ambientOrLightmapUV_18.xyz = col_19;
  vec3 ambient_27;
  ambient_27 = ambientOrLightmapUV_18.xyz;
  vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = tmpvar_14;
  vec3 res_29;
  vec3 x_30;
  x_30.x = dot (unity_SHAr, tmpvar_28);
  x_30.y = dot (unity_SHAg, tmpvar_28);
  x_30.z = dot (unity_SHAb, tmpvar_28);
  vec3 x1_31;
  vec4 tmpvar_32;
  tmpvar_32 = (tmpvar_14.xyzz * tmpvar_14.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  res_29 = (x_30 + (x1_31 + (unity_SHC.xyz * 
    ((tmpvar_14.x * tmpvar_14.x) - (tmpvar_14.y * tmpvar_14.y))
  )));
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    res_29 = max (((1.055 * 
      pow (max (res_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  ambient_27 = (col_19 + max (vec3(0.0, 0.0, 0.0), res_29));
  ambientOrLightmapUV_18.xyz = ambient_27;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = ambientOrLightmapUV_18;
  xlv_TEXCOORD6 = o_15;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube unity_SpecCube0;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _OcclusionMap;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 c_1;
  vec3 tmpvar_2;
  tmpvar_2 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_3;
  vec3 tmpvar_4;
  tmpvar_4 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, vec3(_Metallic));
  float tmpvar_5;
  tmpvar_5 = (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w));
  tmpvar_3 = (tmpvar_2 * tmpvar_5);
  vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2_2.xyz);
  float tmpvar_7;
  tmpvar_7 = texture2D (_OcclusionMap, xlv_TEXCOORD0.xy).y;
  vec3 tmpvar_8;
  float tmpvar_9;
  tmpvar_9 = (1.0 - _Glossiness);
  tmpvar_8 = (xlv_TEXCOORD1 - (2.0 * (
    dot (tmpvar_6, xlv_TEXCOORD1)
   * tmpvar_6)));
  vec4 tmpvar_10;
  tmpvar_10.xyz = tmpvar_8;
  tmpvar_10.w = ((tmpvar_9 * (1.7 - 
    (0.7 * tmpvar_9)
  )) * 6.0);
  vec4 tmpvar_11;
  tmpvar_11 = textureCube (unity_SpecCube0, tmpvar_8, tmpvar_10.w);
  vec3 viewDir_12;
  viewDir_12 = -(xlv_TEXCOORD1);
  vec3 color_13;
  vec2 tmpvar_14;
  tmpvar_14.x = dot ((viewDir_12 - (2.0 * 
    (dot (tmpvar_6, viewDir_12) * tmpvar_6)
  )), _WorldSpaceLightPos0.xyz);
  tmpvar_14.y = (1.0 - clamp (dot (tmpvar_6, viewDir_12), 0.0, 1.0));
  vec2 tmpvar_15;
  tmpvar_15 = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14));
  vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = tmpvar_9;
  color_13 = ((tmpvar_3 + (
    (texture2D (unity_NHxRoughness, tmpvar_16).w * 16.0)
   * tmpvar_4)) * ((_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * clamp (
    dot (tmpvar_6, _WorldSpaceLightPos0.xyz)
  , 0.0, 1.0)));
  color_13 = (color_13 + ((
    (xlv_TEXCOORD5.xyz * tmpvar_7)
   * tmpvar_3) + (
    (((unity_SpecCube0_HDR.x * pow (tmpvar_11.w, unity_SpecCube0_HDR.y)) * tmpvar_11.xyz) * tmpvar_7)
   * 
    mix (tmpvar_4, vec3(clamp ((_Glossiness + (1.0 - tmpvar_5)), 0.0, 1.0)), tmpvar_15.yyy)
  )));
  vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = color_13;
  c_1.w = tmpvar_17.w;
  c_1.xyz = color_13;
  c_1.xyz = c_1.xyz;
  vec4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = c_1.xyz;
  xlat_varoutput_18.w = 1.0;
  gl_FragData[0] = xlat_varoutput_18;
}


#endif
"
}
SubProgram "metal " {
// Stats: 70 math, 2 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
Bind "texcoord1" ATTR3
ConstBuffer "$Globals" 450
Matrix 208 [glstate_matrix_mvp]
Matrix 272 [_Object2World]
Matrix 336 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
VectorHalf 80 [unity_4LightAtten0] 4
VectorHalf 88 [unity_LightColor0] 4
VectorHalf 96 [unity_LightColor1] 4
VectorHalf 104 [unity_LightColor2] 4
VectorHalf 112 [unity_LightColor3] 4
VectorHalf 120 [unity_LightColor4] 4
VectorHalf 128 [unity_LightColor5] 4
VectorHalf 136 [unity_LightColor6] 4
VectorHalf 144 [unity_LightColor7] 4
VectorHalf 152 [unity_SHAr] 4
VectorHalf 160 [unity_SHAg] 4
VectorHalf 168 [unity_SHAb] 4
VectorHalf 176 [unity_SHBr] 4
VectorHalf 184 [unity_SHBg] 4
VectorHalf 192 [unity_SHBb] 4
VectorHalf 200 [unity_SHC] 4
VectorHalf 400 [unity_ColorSpaceLuminance] 4
Vector 416 [_MainTex_ST]
Vector 432 [_DetailAlbedoMap_ST]
ScalarHalf 448 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
  float4 _glesMultiTexCoord1 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  float4 unity_4LightPosX0;
  float4 unity_4LightPosY0;
  float4 unity_4LightPosZ0;
  half4 unity_4LightAtten0;
  half4 unity_LightColor[8];
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  half4 unity_SHBr;
  half4 unity_SHBg;
  half4 unity_SHBb;
  half4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  half4 unity_ColorSpaceLuminance;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  float4 tmpvar_4;
  half4 tmpvar_5;
  half4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  float4 tmpvar_9;
  tmpvar_9 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_4 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_10;
  texcoord_10.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_11;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_11 = tmpvar_2;
  } else {
    tmpvar_11 = tmpvar_3;
  };
  texcoord_10.zw = ((tmpvar_11 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_12;
  float3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_9.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_12 = half3(tmpvar_13);
  float3 norm_14;
  norm_14 = float3(tmpvar_1);
  float4 v_15;
  v_15.x = _mtl_u._World2Object[0].x;
  v_15.y = _mtl_u._World2Object[1].x;
  v_15.z = _mtl_u._World2Object[2].x;
  v_15.w = _mtl_u._World2Object[3].x;
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].y;
  v_16.y = _mtl_u._World2Object[1].y;
  v_16.z = _mtl_u._World2Object[2].y;
  v_16.w = _mtl_u._World2Object[3].y;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].z;
  v_17.y = _mtl_u._World2Object[1].z;
  v_17.z = _mtl_u._World2Object[2].z;
  v_17.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_18;
  tmpvar_18 = normalize(((
    (v_15.xyz * norm_14.x)
   + 
    (v_16.xyz * norm_14.y)
  ) + (v_17.xyz * norm_14.z)));
  tmpvar_5.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_6.xyz = half3(float3(0.0, 0.0, 0.0));
  tmpvar_7.xyz = half3(tmpvar_18);
  float4 o_19;
  float4 tmpvar_20;
  tmpvar_20 = (tmpvar_4 * 0.5);
  float2 tmpvar_21;
  tmpvar_21.x = tmpvar_20.x;
  tmpvar_21.y = (tmpvar_20.y * _mtl_u._ProjectionParams.x);
  o_19.xy = (tmpvar_21 + tmpvar_20.w);
  o_19.zw = tmpvar_4.zw;
  tmpvar_8 = half4(o_19);
  half3 normalWorld_22;
  normalWorld_22 = half3(tmpvar_18);
  half4 ambientOrLightmapUV_23;
  ambientOrLightmapUV_23.w = half(0.0);
  float3 lightColor0_24;
  lightColor0_24 = float3(_mtl_u.unity_LightColor[0].xyz);
  float3 lightColor1_25;
  lightColor1_25 = float3(_mtl_u.unity_LightColor[1].xyz);
  float3 lightColor2_26;
  lightColor2_26 = float3(_mtl_u.unity_LightColor[2].xyz);
  float3 lightColor3_27;
  lightColor3_27 = float3(_mtl_u.unity_LightColor[3].xyz);
  float4 lightAttenSq_28;
  lightAttenSq_28 = float4(_mtl_u.unity_4LightAtten0);
  float3 normal_29;
  normal_29 = float3(normalWorld_22);
  float3 col_30;
  float4 ndotl_31;
  float4 lengthSq_32;
  float4 tmpvar_33;
  tmpvar_33 = (_mtl_u.unity_4LightPosX0 - tmpvar_9.x);
  float4 tmpvar_34;
  tmpvar_34 = (_mtl_u.unity_4LightPosY0 - tmpvar_9.y);
  float4 tmpvar_35;
  tmpvar_35 = (_mtl_u.unity_4LightPosZ0 - tmpvar_9.z);
  lengthSq_32 = (tmpvar_33 * tmpvar_33);
  lengthSq_32 = (lengthSq_32 + (tmpvar_34 * tmpvar_34));
  lengthSq_32 = (lengthSq_32 + (tmpvar_35 * tmpvar_35));
  ndotl_31 = (tmpvar_33 * normal_29.x);
  ndotl_31 = (ndotl_31 + (tmpvar_34 * normal_29.y));
  ndotl_31 = (ndotl_31 + (tmpvar_35 * normal_29.z));
  float4 tmpvar_36;
  tmpvar_36 = max (float4(0.0, 0.0, 0.0, 0.0), (ndotl_31 * rsqrt(lengthSq_32)));
  ndotl_31 = tmpvar_36;
  float4 tmpvar_37;
  tmpvar_37 = (tmpvar_36 * (1.0/((1.0 + 
    (lengthSq_32 * lightAttenSq_28)
  ))));
  col_30 = (lightColor0_24 * tmpvar_37.x);
  col_30 = (col_30 + (lightColor1_25 * tmpvar_37.y));
  col_30 = (col_30 + (lightColor2_26 * tmpvar_37.z));
  col_30 = (col_30 + (lightColor3_27 * tmpvar_37.w));
  ambientOrLightmapUV_23.xyz = half3(col_30);
  half3 ambient_38;
  ambient_38 = ambientOrLightmapUV_23.xyz;
  half4 tmpvar_39;
  tmpvar_39.w = half(1.0);
  tmpvar_39.xyz = normalWorld_22;
  half3 res_40;
  half3 x_41;
  x_41.x = dot (_mtl_u.unity_SHAr, tmpvar_39);
  x_41.y = dot (_mtl_u.unity_SHAg, tmpvar_39);
  x_41.z = dot (_mtl_u.unity_SHAb, tmpvar_39);
  half3 x1_42;
  half4 tmpvar_43;
  tmpvar_43 = (normalWorld_22.xyzz * normalWorld_22.yzzx);
  x1_42.x = dot (_mtl_u.unity_SHBr, tmpvar_43);
  x1_42.y = dot (_mtl_u.unity_SHBg, tmpvar_43);
  x1_42.z = dot (_mtl_u.unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (_mtl_u.unity_SHC.xyz * 
    ((normalWorld_22.x * normalWorld_22.x) - (normalWorld_22.y * normalWorld_22.y))
  )));
  bool tmpvar_44;
  tmpvar_44 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)0.0);
  if (tmpvar_44) {
    res_40 = max ((((half)1.055 * 
      pow (max (res_40, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)0.055), (half3)float3(0.0, 0.0, 0.0));
  };
  ambient_38 = (ambientOrLightmapUV_23.xyz + max ((half3)float3(0.0, 0.0, 0.0), res_40));
  ambientOrLightmapUV_23.xyz = ambient_38;
  _mtl_o.gl_Position = tmpvar_4;
  _mtl_o.xlv_TEXCOORD0 = texcoord_10;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_12;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_5;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD5 = ambientOrLightmapUV_23;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_8;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.w = 0.0;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat22 = u_xlat2.y * u_xlat2.y;
    u_xlat22 = u_xlat2.x * u_xlat2.x + (-u_xlat22);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat22) + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb22 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : u_xlat3.xyz;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat6 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
    u_xlat2 = u_xlat1 * u_xlat2.zzzz + u_xlat5;
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat4;
    u_xlat4 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat8;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat1.xy * u_xlat1.xy;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat8 = (-u_xlat1.x) + _Glossiness;
    u_xlat8 = u_xlat8 + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = vec3(u_xlat8) + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat0.zzz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_7 = u_xlat10_6.w * 16.0;
    u_xlat7.xyz = vec3(u_xlat16_7) * u_xlat4.xyz + u_xlat1.xzw;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat7.xyz * u_xlat2.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 49 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_NHxRoughness] 2D 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [_OcclusionMap] 2D 3
ConstBuffer "$Globals" 44
VectorHalf 0 [_WorldSpaceLightPos0] 4
VectorHalf 8 [unity_SpecCube0_HDR] 4
VectorHalf 16 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 24 [_LightColor0] 4
VectorHalf 32 [_Color] 4
ScalarHalf 40 [_Metallic]
ScalarHalf 42 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _WorldSpaceLightPos0;
  half4 unity_SpecCube0_HDR;
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(1)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(1)]]
  ,   texture2d<half> _MainTex [[texture(2)]], sampler _mtlsmp__MainTex [[sampler(2)]]
  ,   texture2d<half> _OcclusionMap [[texture(3)]], sampler _mtlsmp__OcclusionMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half4 tmpvar_2;
  tmpvar_2 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_3;
  tmpvar_3 = (_mtl_u._Color.xyz * tmpvar_2.xyz);
  half3 tmpvar_4;
  half3 tmpvar_5;
  tmpvar_5 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_3, half3(_mtl_u._Metallic));
  half tmpvar_6;
  tmpvar_6 = (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w));
  tmpvar_4 = (tmpvar_3 * tmpvar_6);
  half3 tmpvar_7;
  tmpvar_7 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_8;
  tmpvar_8 = _mtl_u._LightColor0.xyz;
  half tmpvar_9;
  half4 tmpvar_10;
  tmpvar_10 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  tmpvar_9 = tmpvar_10.y;
  float4 tmpvar_11;
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  half3 tmpvar_12;
  half tmpvar_13;
  tmpvar_13 = ((half)1.0 - _mtl_u._Glossiness);
  tmpvar_12 = (_mtl_i.xlv_TEXCOORD1 - ((half)2.0 * (
    dot (tmpvar_7, _mtl_i.xlv_TEXCOORD1)
   * tmpvar_7)));
  half4 hdr_14;
  hdr_14 = half4(tmpvar_11);
  half4 tmpvar_15;
  tmpvar_15.xyz = tmpvar_12;
  tmpvar_15.w = ((tmpvar_13 * ((half)1.7 - 
    ((half)0.7 * tmpvar_13)
  )) * (half)6.0);
  half4 tmpvar_16;
  tmpvar_16 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(tmpvar_12), bias(tmpvar_15.w));
  half4 tmpvar_17;
  tmpvar_17 = tmpvar_16;
  half3 viewDir_18;
  viewDir_18 = -(_mtl_i.xlv_TEXCOORD1);
  half3 color_19;
  half2 tmpvar_20;
  tmpvar_20.x = dot ((viewDir_18 - ((half)2.0 * 
    (dot (tmpvar_7, viewDir_18) * tmpvar_7)
  )), _mtl_u._WorldSpaceLightPos0.xyz);
  tmpvar_20.y = ((half)1.0 - clamp (dot (tmpvar_7, viewDir_18), (half)0.0, (half)1.0));
  half2 tmpvar_21;
  tmpvar_21 = ((tmpvar_20 * tmpvar_20) * (tmpvar_20 * tmpvar_20));
  half2 tmpvar_22;
  tmpvar_22.x = tmpvar_21.x;
  tmpvar_22.y = tmpvar_13;
  half4 tmpvar_23;
  tmpvar_23 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_22));
  color_19 = ((tmpvar_4 + (
    (tmpvar_23.w * (half)16.0)
   * tmpvar_5)) * (tmpvar_8 * clamp (
    dot (tmpvar_7, _mtl_u._WorldSpaceLightPos0.xyz)
  , (half)0.0, (half)1.0)));
  color_19 = (color_19 + ((
    (_mtl_i.xlv_TEXCOORD5.xyz * tmpvar_9)
   * tmpvar_4) + (
    (((hdr_14.x * pow (tmpvar_17.w, hdr_14.y)) * tmpvar_17.xyz) * tmpvar_9)
   * 
    mix (tmpvar_5, half3(clamp ((_mtl_u._Glossiness + ((half)1.0 - tmpvar_6)), (half)0.0, (half)1.0)), tmpvar_21.yyy)
  )));
  half4 tmpvar_24;
  tmpvar_24.w = half(1.0);
  tmpvar_24.xyz = color_19;
  c_1.w = tmpvar_24.w;
  c_1.xyz = color_19;
  c_1.xyz = c_1.xyz;
  half4 xlat_varoutput_25;
  xlat_varoutput_25.xyz = c_1.xyz;
  xlat_varoutput_25.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_25;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 50 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_NHxRoughness] 2D 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [_OcclusionMap] 2D 3
SetTexture 4 [_ShadowMapTexture] 2D 4
ConstBuffer "$Globals" 44
VectorHalf 0 [_WorldSpaceLightPos0] 4
VectorHalf 8 [unity_SpecCube0_HDR] 4
VectorHalf 16 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 24 [_LightColor0] 4
VectorHalf 32 [_Color] 4
ScalarHalf 40 [_Metallic]
ScalarHalf 42 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _WorldSpaceLightPos0;
  half4 unity_SpecCube0_HDR;
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(1)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(1)]]
  ,   texture2d<half> _MainTex [[texture(2)]], sampler _mtlsmp__MainTex [[sampler(2)]]
  ,   texture2d<half> _OcclusionMap [[texture(3)]], sampler _mtlsmp__OcclusionMap [[sampler(3)]]
  ,   texture2d<half> _ShadowMapTexture [[texture(4)]], sampler _mtlsmp__ShadowMapTexture [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half atten_2;
  half4 tmpvar_3;
  tmpvar_3 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_4;
  tmpvar_4 = (_mtl_u._Color.xyz * tmpvar_3.xyz);
  half3 tmpvar_5;
  half3 tmpvar_6;
  tmpvar_6 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_4, half3(_mtl_u._Metallic));
  half tmpvar_7;
  tmpvar_7 = (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w));
  tmpvar_5 = (tmpvar_4 * tmpvar_7);
  half3 tmpvar_8;
  tmpvar_8 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_9;
  tmpvar_9 = _mtl_u._LightColor0.xyz;
  half tmpvar_10;
  tmpvar_10 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, ((float2)(_mtl_i.xlv_TEXCOORD6).xy / (float)(_mtl_i.xlv_TEXCOORD6).w)).x;
  atten_2 = tmpvar_10;
  half tmpvar_11;
  half4 tmpvar_12;
  tmpvar_12 = _OcclusionMap.sample(_mtlsmp__OcclusionMap, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  tmpvar_11 = tmpvar_12.y;
  float4 tmpvar_13;
  tmpvar_13 = float4(_mtl_u.unity_SpecCube0_HDR);
  half3 tmpvar_14;
  half tmpvar_15;
  tmpvar_15 = ((half)1.0 - _mtl_u._Glossiness);
  tmpvar_14 = (_mtl_i.xlv_TEXCOORD1 - ((half)2.0 * (
    dot (tmpvar_8, _mtl_i.xlv_TEXCOORD1)
   * tmpvar_8)));
  half4 hdr_16;
  hdr_16 = half4(tmpvar_13);
  half4 tmpvar_17;
  tmpvar_17.xyz = tmpvar_14;
  tmpvar_17.w = ((tmpvar_15 * ((half)1.7 - 
    ((half)0.7 * tmpvar_15)
  )) * (half)6.0);
  half4 tmpvar_18;
  tmpvar_18 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(tmpvar_14), bias(tmpvar_17.w));
  half4 tmpvar_19;
  tmpvar_19 = tmpvar_18;
  half3 viewDir_20;
  viewDir_20 = -(_mtl_i.xlv_TEXCOORD1);
  half3 color_21;
  half2 tmpvar_22;
  tmpvar_22.x = dot ((viewDir_20 - ((half)2.0 * 
    (dot (tmpvar_8, viewDir_20) * tmpvar_8)
  )), _mtl_u._WorldSpaceLightPos0.xyz);
  tmpvar_22.y = ((half)1.0 - clamp (dot (tmpvar_8, viewDir_20), (half)0.0, (half)1.0));
  half2 tmpvar_23;
  tmpvar_23 = ((tmpvar_22 * tmpvar_22) * (tmpvar_22 * tmpvar_22));
  half2 tmpvar_24;
  tmpvar_24.x = tmpvar_23.x;
  tmpvar_24.y = tmpvar_15;
  half4 tmpvar_25;
  tmpvar_25 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_24));
  color_21 = ((tmpvar_5 + (
    (tmpvar_25.w * (half)16.0)
   * tmpvar_6)) * ((tmpvar_9 * atten_2) * clamp (
    dot (tmpvar_8, _mtl_u._WorldSpaceLightPos0.xyz)
  , (half)0.0, (half)1.0)));
  color_21 = (color_21 + ((
    (_mtl_i.xlv_TEXCOORD5.xyz * tmpvar_11)
   * tmpvar_5) + (
    (((hdr_16.x * pow (tmpvar_19.w, hdr_16.y)) * tmpvar_19.xyz) * tmpvar_11)
   * 
    mix (tmpvar_6, half3(clamp ((_mtl_u._Glossiness + ((half)1.0 - tmpvar_7)), (half)0.0, (half)1.0)), tmpvar_23.yyy)
  )));
  half4 tmpvar_26;
  tmpvar_26.w = half(1.0);
  tmpvar_26.xyz = color_21;
  c_1.w = tmpvar_26.w;
  c_1.xyz = color_21;
  c_1.xyz = c_1.xyz;
  half4 xlat_varoutput_27;
  xlat_varoutput_27.xyz = c_1.xyz;
  xlat_varoutput_27.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_27;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
}
 }


 // Stats for Vertex shader:
 //       metal : 27 avg math (24..29), 1 branch
 //      opengl : 32 avg math (28..40), 3 avg texture (2..5), 0 avg branch (0..1)
 // Stats for Fragment shader:
 //       metal : 32 avg math (28..40), 3 avg texture (2..5), 0 avg branch (0..1)
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 443686
Program "vp" {
SubProgram "opengl " {
// Stats: 30 math, 3 textures
Keywords { "POINT" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * texture2D (_LightTexture0, vec2(
    dot (xlv_TEXCOORD5, xlv_TEXCOORD5)
  )).w) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 27 math, 1 branches
Keywords { "POINT" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 312
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
MatrixHalf 280 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_14 = half3(tmpvar_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  half3 tmpvar_34;
  float3 tmpvar_35;
  tmpvar_35 = normalize((_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w)));
  tmpvar_34 = half3(tmpvar_35);
  lightDir_5 = float3(tmpvar_34);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = ((float4)(_mtl_u._LightMatrix0 * (half4)(_mtl_u._Object2World * _mtl_i._glesVertex))).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 28 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * (_LightColor0.xyz * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 24 math, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 274
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  float4 tmpvar_10;
  tmpvar_10 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_10.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_13 = half3(tmpvar_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  float3 dir_20;
  dir_20 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_21;
  tmpvar_21[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_21[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_21[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = float(tmpvar_4.w);
  half3 normal_23;
  normal_23 = half3(tmpvar_19);
  half3 tangent_24;
  tangent_24 = half3(tmpvar_22.xyz);
  half tangentSign_25;
  tangentSign_25 = half(tmpvar_22.w);
  half xlat_varsign_26;
  float tmpvar_27;
  tmpvar_27 = ((float)tangentSign_25 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_26 = half(tmpvar_27);
  half3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * xlat_varsign_26);
  half3x3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_29);
  float3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_32);
  float3 tmpvar_33;
  tmpvar_33 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_33.x);
  tmpvar_8.w = half(tmpvar_33.y);
  tmpvar_9.w = half(tmpvar_33.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_9 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat2.xyz = vec3(u_xlat16_9) * u_xlat2.xyz;
    u_xlat9 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 36 math, 4 textures
Keywords { "SPOT" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex));
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * 
    ((float((xlv_TEXCOORD5.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5)).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz))).w)
  ) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 27 math, 1 branches
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 312
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
MatrixHalf 280 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  half4 tmpvar_11;
  float4 tmpvar_12;
  tmpvar_12 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_13;
  texcoord_13.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_14;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_14 = tmpvar_2;
  } else {
    tmpvar_14 = tmpvar_3;
  };
  texcoord_13.zw = ((tmpvar_14 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_15;
  float3 tmpvar_16;
  tmpvar_16 = normalize((tmpvar_12.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_15 = half3(tmpvar_16);
  float3 norm_17;
  norm_17 = float3(tmpvar_1);
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].x;
  v_18.y = _mtl_u._World2Object[1].x;
  v_18.z = _mtl_u._World2Object[2].x;
  v_18.w = _mtl_u._World2Object[3].x;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].y;
  v_19.y = _mtl_u._World2Object[1].y;
  v_19.z = _mtl_u._World2Object[2].y;
  v_19.w = _mtl_u._World2Object[3].y;
  float4 v_20;
  v_20.x = _mtl_u._World2Object[0].z;
  v_20.y = _mtl_u._World2Object[1].z;
  v_20.z = _mtl_u._World2Object[2].z;
  v_20.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_21;
  tmpvar_21 = normalize(((
    (v_18.xyz * norm_17.x)
   + 
    (v_19.xyz * norm_17.y)
  ) + (v_20.xyz * norm_17.z)));
  float3 dir_22;
  dir_22 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_23;
  tmpvar_23[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_23[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_23[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_24;
  tmpvar_24.xyz = normalize((tmpvar_23 * dir_22));
  tmpvar_24.w = float(tmpvar_4.w);
  half3 normal_25;
  normal_25 = half3(tmpvar_21);
  half3 tangent_26;
  tangent_26 = half3(tmpvar_24.xyz);
  half tangentSign_27;
  tangentSign_27 = half(tmpvar_24.w);
  half xlat_varsign_28;
  float tmpvar_29;
  tmpvar_29 = ((float)tangentSign_27 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_28 = half(tmpvar_29);
  half3 tmpvar_30;
  tmpvar_30 = (((normal_25.yzx * tangent_26.zxy) - (normal_25.zxy * tangent_26.yzx)) * xlat_varsign_28);
  half3x3 tmpvar_31;
  tmpvar_31[0].x = tangent_26.x;
  tmpvar_31[0].y = tmpvar_30.x;
  tmpvar_31[0].z = normal_25.x;
  tmpvar_31[1].x = tangent_26.y;
  tmpvar_31[1].y = tmpvar_30.y;
  tmpvar_31[1].z = normal_25.y;
  tmpvar_31[2].x = tangent_26.z;
  tmpvar_31[2].y = tmpvar_30.z;
  tmpvar_31[2].z = normal_25.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].x;
  v_32.y = tangentToWorld_6[1].x;
  v_32.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].y;
  v_33.y = tangentToWorld_6[1].y;
  v_33.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_33);
  float3 v_34;
  v_34.x = tangentToWorld_6[0].z;
  v_34.y = tangentToWorld_6[1].z;
  v_34.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_34);
  tmpvar_11 = half4(((float4)(_mtl_u._LightMatrix0 * (half4)(_mtl_u._Object2World * _mtl_i._glesVertex))));
  half3 tmpvar_35;
  float3 tmpvar_36;
  tmpvar_36 = normalize((_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_12.xyz * _mtl_u._WorldSpaceLightPos0.w)));
  tmpvar_35 = half3(tmpvar_36);
  lightDir_5 = float3(tmpvar_35);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_13;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_15;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_11;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb1 = 0.0<vs_TEXCOORD5.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat10_1.w * u_xlat1.x;
    u_xlat4 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat4));
    u_xlat1.x = u_xlat1.x * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 31 math, 4 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * 
    (texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5))).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w)
  ) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 27 math, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 312
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
MatrixHalf 280 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_14 = half3(tmpvar_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  half3 tmpvar_34;
  float3 tmpvar_35;
  tmpvar_35 = normalize((_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w)));
  tmpvar_34 = half3(tmpvar_35);
  lightDir_5 = float3(tmpvar_34);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = ((float4)(_mtl_u._LightMatrix0 * (half4)(_mtl_u._Object2World * _mtl_i._glesVertex))).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_1 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * texture2D (_LightTexture0, xlv_TEXCOORD5).w) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 26 math, 1 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 312
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
MatrixHalf 280 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
Vector 224 [unity_WorldTransformParams]
Vector 240 [_MainTex_ST]
Vector 256 [_DetailAlbedoMap_ST]
ScalarHalf 272 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  float4 tmpvar_10;
  tmpvar_10 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_11;
  texcoord_11.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_12;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_12 = tmpvar_2;
  } else {
    tmpvar_12 = tmpvar_3;
  };
  texcoord_11.zw = ((tmpvar_12 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_13;
  float3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_10.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_13 = half3(tmpvar_14);
  float3 norm_15;
  norm_15 = float3(tmpvar_1);
  float4 v_16;
  v_16.x = _mtl_u._World2Object[0].x;
  v_16.y = _mtl_u._World2Object[1].x;
  v_16.z = _mtl_u._World2Object[2].x;
  v_16.w = _mtl_u._World2Object[3].x;
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].y;
  v_17.y = _mtl_u._World2Object[1].y;
  v_17.z = _mtl_u._World2Object[2].y;
  v_17.w = _mtl_u._World2Object[3].y;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].z;
  v_18.y = _mtl_u._World2Object[1].z;
  v_18.z = _mtl_u._World2Object[2].z;
  v_18.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_19;
  tmpvar_19 = normalize(((
    (v_16.xyz * norm_15.x)
   + 
    (v_17.xyz * norm_15.y)
  ) + (v_18.xyz * norm_15.z)));
  float3 dir_20;
  dir_20 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_21;
  tmpvar_21[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_21[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_21[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_22;
  tmpvar_22.xyz = normalize((tmpvar_21 * dir_20));
  tmpvar_22.w = float(tmpvar_4.w);
  half3 normal_23;
  normal_23 = half3(tmpvar_19);
  half3 tangent_24;
  tangent_24 = half3(tmpvar_22.xyz);
  half tangentSign_25;
  tangentSign_25 = half(tmpvar_22.w);
  half xlat_varsign_26;
  float tmpvar_27;
  tmpvar_27 = ((float)tangentSign_25 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_26 = half(tmpvar_27);
  half3 tmpvar_28;
  tmpvar_28 = (((normal_23.yzx * tangent_24.zxy) - (normal_23.zxy * tangent_24.yzx)) * xlat_varsign_26);
  half3x3 tmpvar_29;
  tmpvar_29[0].x = tangent_24.x;
  tmpvar_29[0].y = tmpvar_28.x;
  tmpvar_29[0].z = normal_23.x;
  tmpvar_29[1].x = tangent_24.y;
  tmpvar_29[1].y = tmpvar_28.y;
  tmpvar_29[1].z = normal_23.y;
  tmpvar_29[2].x = tangent_24.z;
  tmpvar_29[2].y = tmpvar_28.z;
  tmpvar_29[2].z = normal_23.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_29);
  float3 v_30;
  v_30.x = tangentToWorld_5[0].x;
  v_30.y = tangentToWorld_5[1].x;
  v_30.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].y;
  v_31.y = tangentToWorld_5[1].y;
  v_31.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].z;
  v_32.y = tangentToWorld_5[1].z;
  v_32.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_32);
  float3 tmpvar_33;
  tmpvar_33 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_10.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_33.x);
  tmpvar_8.w = half(tmpvar_33.y);
  tmpvar_9.w = half(tmpvar_33.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_11;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_13;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = ((float4)(_mtl_u._LightMatrix0 * (half4)(_mtl_u._Object2World * _mtl_i._glesVertex))).xy;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * _LightMatrix0[1].xy;
    u_xlat0.xy = _LightMatrix0[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = _LightMatrix0[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat0.ww + u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 40 math, 5 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform mat4 unity_World2Shadow[4];

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25);
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * tmpvar_25);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * 
    (((float(
      (xlv_TEXCOORD5.z > 0.0)
    ) * texture2D (_LightTexture0, (
      (xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w)
     + 0.5)).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz))).w) * (_LightShadowData.x + (shadow2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x * (1.0 - _LightShadowData.x))))
  ) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 28 math, 1 branches
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 568
Matrix 32 [unity_World2Shadow0]
Matrix 96 [unity_World2Shadow1]
Matrix 160 [unity_World2Shadow2]
Matrix 224 [unity_World2Shadow3]
Matrix 288 [glstate_matrix_mvp]
Matrix 352 [_Object2World]
Matrix 416 [_World2Object]
MatrixHalf 536 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 480 [unity_WorldTransformParams]
Vector 496 [_MainTex_ST]
Vector 512 [_DetailAlbedoMap_ST]
ScalarHalf 528 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  half4 tmpvar_11;
  half4 tmpvar_12;
  float4 tmpvar_13;
  tmpvar_13 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_14;
  texcoord_14.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_15;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_15 = tmpvar_2;
  } else {
    tmpvar_15 = tmpvar_3;
  };
  texcoord_14.zw = ((tmpvar_15 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_16;
  float3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_13.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_16 = half3(tmpvar_17);
  float3 norm_18;
  norm_18 = float3(tmpvar_1);
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].x;
  v_19.y = _mtl_u._World2Object[1].x;
  v_19.z = _mtl_u._World2Object[2].x;
  v_19.w = _mtl_u._World2Object[3].x;
  float4 v_20;
  v_20.x = _mtl_u._World2Object[0].y;
  v_20.y = _mtl_u._World2Object[1].y;
  v_20.z = _mtl_u._World2Object[2].y;
  v_20.w = _mtl_u._World2Object[3].y;
  float4 v_21;
  v_21.x = _mtl_u._World2Object[0].z;
  v_21.y = _mtl_u._World2Object[1].z;
  v_21.z = _mtl_u._World2Object[2].z;
  v_21.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_22;
  tmpvar_22 = normalize(((
    (v_19.xyz * norm_18.x)
   + 
    (v_20.xyz * norm_18.y)
  ) + (v_21.xyz * norm_18.z)));
  float3 dir_23;
  dir_23 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_24;
  tmpvar_24[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_24[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_24[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_25;
  tmpvar_25.xyz = normalize((tmpvar_24 * dir_23));
  tmpvar_25.w = float(tmpvar_4.w);
  half3 normal_26;
  normal_26 = half3(tmpvar_22);
  half3 tangent_27;
  tangent_27 = half3(tmpvar_25.xyz);
  half tangentSign_28;
  tangentSign_28 = half(tmpvar_25.w);
  half xlat_varsign_29;
  float tmpvar_30;
  tmpvar_30 = ((float)tangentSign_28 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_29 = half(tmpvar_30);
  half3 tmpvar_31;
  tmpvar_31 = (((normal_26.yzx * tangent_27.zxy) - (normal_26.zxy * tangent_27.yzx)) * xlat_varsign_29);
  half3x3 tmpvar_32;
  tmpvar_32[0].x = tangent_27.x;
  tmpvar_32[0].y = tmpvar_31.x;
  tmpvar_32[0].z = normal_26.x;
  tmpvar_32[1].x = tangent_27.y;
  tmpvar_32[1].y = tmpvar_31.y;
  tmpvar_32[1].z = normal_26.y;
  tmpvar_32[2].x = tangent_27.z;
  tmpvar_32[2].y = tmpvar_31.z;
  tmpvar_32[2].z = normal_26.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].x;
  v_33.y = tangentToWorld_6[1].x;
  v_33.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_33);
  float3 v_34;
  v_34.x = tangentToWorld_6[0].y;
  v_34.y = tangentToWorld_6[1].y;
  v_34.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_34);
  float3 v_35;
  v_35.x = tangentToWorld_6[0].z;
  v_35.y = tangentToWorld_6[1].z;
  v_35.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_35);
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_11 = half4(((float4)(_mtl_u._LightMatrix0 * (half4)tmpvar_36)));
  tmpvar_12 = half4((_mtl_u.unity_World2Shadow[0] * tmpvar_36));
  half3 tmpvar_37;
  float3 tmpvar_38;
  tmpvar_38 = normalize((_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_13.xyz * _mtl_u._WorldSpaceLightPos0.w)));
  tmpvar_37 = half3(tmpvar_38);
  lightDir_5 = float3(tmpvar_37);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_14;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_16;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_11;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 unity_World2Shadow[4];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * unity_World2Shadow[0][1];
    u_xlat1 = unity_World2Shadow[0][0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_World2Shadow[0][2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = unity_World2Shadow[0][3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb1 = 0.0<vs_TEXCOORD5.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat10_1.w * u_xlat1.x;
    u_xlat4.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat4.xx);
    u_xlat1.x = u_xlat1.x * u_xlat10_2.w;
    u_xlat4.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
    vec3 txVec4 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat10_4 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
    u_xlat7 = (-_LightShadowData.x) + 1.0;
    u_xlat4.x = u_xlat10_4 * u_xlat7 + _LightShadowData.x;
    u_xlat1.x = u_xlat4.x * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 27 math, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 290
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
VectorHalf 32 [_WorldSpaceLightPos0] 4
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_14 = half3(tmpvar_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].x;
  v_31.y = tangentToWorld_5[1].x;
  v_31.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].y;
  v_32.y = tangentToWorld_5[1].y;
  v_32.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_5[0].z;
  v_33.y = tangentToWorld_5[1].z;
  v_33.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_33);
  float4 o_34;
  float4 tmpvar_35;
  tmpvar_35 = (tmpvar_6 * 0.5);
  float2 tmpvar_36;
  tmpvar_36.x = tmpvar_35.x;
  tmpvar_36.y = (tmpvar_35.y * _mtl_u._ProjectionParams.x);
  o_34.xy = (tmpvar_36 + tmpvar_35.w);
  o_34.zw = tmpvar_6.zw;
  tmpvar_10 = half4(o_34);
  float3 tmpvar_37;
  tmpvar_37 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_37.x);
  tmpvar_8.w = half(tmpvar_37.y);
  tmpvar_9.w = half(tmpvar_37.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_10;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    vs_TEXCOORD1.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 30 math, 4 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _ProjectionParams;
uniform vec4 _WorldSpaceLightPos0;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec4 o_24;
  vec4 tmpvar_25;
  tmpvar_25 = (tmpvar_3 * 0.5);
  vec2 tmpvar_26;
  tmpvar_26.x = tmpvar_25.x;
  tmpvar_26.y = (tmpvar_25.y * _ProjectionParams.x);
  o_24.xy = (tmpvar_26 + tmpvar_25.w);
  o_24.zw = tmpvar_3.zw;
  vec3 tmpvar_27;
  tmpvar_27 = (_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w));
  tmpvar_4.w = tmpvar_27.x;
  tmpvar_5.w = tmpvar_27.y;
  tmpvar_6.w = tmpvar_27.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * gl_Vertex)).xy;
  xlv_TEXCOORD6 = o_24;
}


#endif
#ifdef FRAGMENT
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec2 xlv_TEXCOORD5;
varying vec4 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  tmpvar_2 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_3;
  tmpvar_3.x = xlv_TEXCOORD2.w;
  tmpvar_3.y = xlv_TEXCOORD2_1.w;
  tmpvar_3.z = xlv_TEXCOORD2_2.w;
  vec3 viewDir_4;
  viewDir_4 = -(xlv_TEXCOORD1);
  vec2 tmpvar_5;
  tmpvar_5.x = dot ((viewDir_4 - (2.0 * 
    (dot (tmpvar_2, viewDir_4) * tmpvar_2)
  )), tmpvar_3);
  tmpvar_5.y = (1.0 - clamp (dot (tmpvar_2, viewDir_4), 0.0, 1.0));
  vec2 tmpvar_6;
  tmpvar_6.x = ((tmpvar_5 * tmpvar_5) * (tmpvar_5 * tmpvar_5)).x;
  tmpvar_6.y = (1.0 - _Glossiness);
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (((tmpvar_1 * 
    (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w))
  ) + (
    (texture2D (unity_NHxRoughness, tmpvar_6).w * 16.0)
   * 
    mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic))
  )) * ((_LightColor0.xyz * 
    (texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x)
  ) * clamp (
    dot (tmpvar_2, tmpvar_3)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_8;
  xlat_varoutput_8.xyz = tmpvar_7.xyz;
  xlat_varoutput_8.w = 1.0;
  gl_FragData[0] = xlat_varoutput_8;
}


#endif
"
}
SubProgram "metal " {
// Stats: 29 math, 1 branches
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 328
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
MatrixHalf 296 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_ProjectionParams]
VectorHalf 32 [_WorldSpaceLightPos0] 4
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _ProjectionParams;
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3x3 tangentToWorld_5;
  float4 tmpvar_6;
  half4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_6 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_14 = half3(tmpvar_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_5 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_5[0].x;
  v_31.y = tangentToWorld_5[1].x;
  v_31.z = tangentToWorld_5[2].x;
  tmpvar_7.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_5[0].y;
  v_32.y = tangentToWorld_5[1].y;
  v_32.z = tangentToWorld_5[2].y;
  tmpvar_8.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_5[0].z;
  v_33.y = tangentToWorld_5[1].z;
  v_33.z = tangentToWorld_5[2].z;
  tmpvar_9.xyz = half3(v_33);
  float4 o_34;
  float4 tmpvar_35;
  tmpvar_35 = (tmpvar_6 * 0.5);
  float2 tmpvar_36;
  tmpvar_36.x = tmpvar_35.x;
  tmpvar_36.y = (tmpvar_35.y * _mtl_u._ProjectionParams.x);
  o_34.xy = (tmpvar_36 + tmpvar_35.w);
  o_34.zw = tmpvar_6.zw;
  tmpvar_10 = half4(o_34);
  float3 tmpvar_37;
  tmpvar_37 = ((float3)_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * (float)_mtl_u._WorldSpaceLightPos0.w));
  tmpvar_7.w = half(tmpvar_37.x);
  tmpvar_8.w = half(tmpvar_37.y);
  tmpvar_9.w = half(tmpvar_37.z);
  _mtl_o.gl_Position = tmpvar_6;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD5 = ((float4)(_mtl_u._LightMatrix0 * (half4)(_mtl_u._Object2World * _mtl_i._glesVertex))).xy;
  _mtl_o.xlv_TEXCOORD6 = tmpvar_10;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    vs_TEXCOORD1.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat1 = _Object2World[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = _Object2World[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = _Object2World[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xy = u_xlat1.yy * _LightMatrix0[1].xy;
    u_xlat1.xy = _LightMatrix0[0].xy * u_xlat1.xx + u_xlat2.xy;
    u_xlat1.xy = _LightMatrix0[2].xy * u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat1.ww + u_xlat1.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat16_1 = u_xlat10_1.x * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 37 math, 4 textures, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  float mydist_7;
  mydist_7 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_8;
  tmpvar_8 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_9;
  if ((tmpvar_8.x < mydist_7)) {
    tmpvar_9 = _LightShadowData.x;
  } else {
    tmpvar_9 = 1.0;
  };
  vec3 viewDir_10;
  viewDir_10 = -(xlv_TEXCOORD1);
  vec2 tmpvar_11;
  tmpvar_11.x = dot ((viewDir_10 - (2.0 * 
    (dot (tmpvar_4, viewDir_10) * tmpvar_4)
  )), tmpvar_5);
  tmpvar_11.y = (1.0 - clamp (dot (tmpvar_4, viewDir_10), 0.0, 1.0));
  vec2 tmpvar_12;
  tmpvar_12.x = ((tmpvar_11 * tmpvar_11) * (tmpvar_11 * tmpvar_11)).x;
  tmpvar_12.y = (1.0 - _Glossiness);
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = ((tmpvar_2 + (
    (texture2D (unity_NHxRoughness, tmpvar_12).w * 16.0)
   * tmpvar_3)) * ((_LightColor0.xyz * 
    (tmpvar_6.w * tmpvar_9)
  ) * clamp (
    dot (tmpvar_4, tmpvar_5)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = 1.0;
  gl_FragData[0] = xlat_varoutput_14;
}


#endif
"
}
SubProgram "metal " {
// Stats: 28 math, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 328
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
MatrixHalf 296 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 32 [_LightPositionRange]
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_14 = half3(tmpvar_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  half3 tmpvar_34;
  float3 tmpvar_35;
  tmpvar_35 = normalize((_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w)));
  tmpvar_34 = half3(tmpvar_35);
  lightDir_5 = float3(tmpvar_34);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = ((float4)(_mtl_u._LightMatrix0 * (half4)tmpvar_36)).xyz;
  _mtl_o.xlv_TEXCOORD6 = (tmpvar_36.xyz - _mtl_u._LightPositionRange.xyz);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
    u_xlat1.x = u_xlat1.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb1 = u_xlat10_2.x<u_xlat1.x;
    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
    u_xlat4 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTexture0, vec2(u_xlat4));
    u_xlat1.x = u_xlat1.x * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 38 math, 5 textures, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#version 120

#ifdef VERTEX
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 unity_WorldTransformParams;
uniform vec4 _MainTex_ST;
uniform vec4 _DetailAlbedoMap_ST;
uniform float _UVSec;
uniform mat4 _LightMatrix0;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec2 tmpvar_1;
  tmpvar_1 = gl_MultiTexCoord0.xy;
  vec2 tmpvar_2;
  tmpvar_2 = gl_MultiTexCoord1.xy;
  vec4 tmpvar_3;
  vec4 tmpvar_4;
  vec4 tmpvar_5;
  vec4 tmpvar_6;
  vec4 tmpvar_7;
  tmpvar_7 = (_Object2World * gl_Vertex);
  tmpvar_3 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 texcoord_8;
  texcoord_8.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  vec2 tmpvar_9;
  if ((_UVSec == 0.0)) {
    tmpvar_9 = tmpvar_1;
  } else {
    tmpvar_9 = tmpvar_2;
  };
  texcoord_8.zw = ((tmpvar_9 * _DetailAlbedoMap_ST.xy) + _DetailAlbedoMap_ST.zw);
  vec4 v_10;
  v_10.x = _World2Object[0].x;
  v_10.y = _World2Object[1].x;
  v_10.z = _World2Object[2].x;
  v_10.w = _World2Object[3].x;
  vec4 v_11;
  v_11.x = _World2Object[0].y;
  v_11.y = _World2Object[1].y;
  v_11.z = _World2Object[2].y;
  v_11.w = _World2Object[3].y;
  vec4 v_12;
  v_12.x = _World2Object[0].z;
  v_12.y = _World2Object[1].z;
  v_12.z = _World2Object[2].z;
  v_12.w = _World2Object[3].z;
  vec3 tmpvar_13;
  tmpvar_13 = normalize(((
    (v_10.xyz * gl_Normal.x)
   + 
    (v_11.xyz * gl_Normal.y)
  ) + (v_12.xyz * gl_Normal.z)));
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec4 tmpvar_15;
  tmpvar_15.xyz = normalize((tmpvar_14 * TANGENT.xyz));
  tmpvar_15.w = TANGENT.w;
  vec3 tmpvar_16;
  vec3 tmpvar_17;
  tmpvar_16 = tmpvar_15.xyz;
  tmpvar_17 = (((tmpvar_13.yzx * tmpvar_15.zxy) - (tmpvar_13.zxy * tmpvar_15.yzx)) * (TANGENT.w * unity_WorldTransformParams.w));
  vec3 tmpvar_18;
  vec3 tmpvar_19;
  vec3 tmpvar_20;
  tmpvar_18.x = tmpvar_16.x;
  tmpvar_18.y = tmpvar_17.x;
  tmpvar_18.z = tmpvar_13.x;
  tmpvar_19.x = tmpvar_16.y;
  tmpvar_19.y = tmpvar_17.y;
  tmpvar_19.z = tmpvar_13.y;
  tmpvar_20.x = tmpvar_16.z;
  tmpvar_20.y = tmpvar_17.z;
  tmpvar_20.z = tmpvar_13.z;
  vec3 v_21;
  v_21.x = tmpvar_18.x;
  v_21.y = tmpvar_19.x;
  v_21.z = tmpvar_20.x;
  tmpvar_4.xyz = v_21;
  vec3 v_22;
  v_22.x = tmpvar_18.y;
  v_22.y = tmpvar_19.y;
  v_22.z = tmpvar_20.y;
  tmpvar_5.xyz = v_22;
  vec3 v_23;
  v_23.x = tmpvar_18.z;
  v_23.y = tmpvar_19.z;
  v_23.z = tmpvar_20.z;
  tmpvar_6.xyz = v_23;
  vec3 tmpvar_24;
  tmpvar_24 = normalize((_WorldSpaceLightPos0.xyz - (tmpvar_7.xyz * _WorldSpaceLightPos0.w)));
  tmpvar_4.w = tmpvar_24.x;
  tmpvar_5.w = tmpvar_24.y;
  tmpvar_6.w = tmpvar_24.z;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = texcoord_8;
  xlv_TEXCOORD1 = normalize((tmpvar_7.xyz - _WorldSpaceCameraPos));
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD2_1 = tmpvar_5;
  xlv_TEXCOORD2_2 = tmpvar_6;
  vec4 tmpvar_25;
  tmpvar_25 = (_Object2World * gl_Vertex);
  xlv_TEXCOORD5 = (_LightMatrix0 * tmpvar_25).xyz;
  xlv_TEXCOORD6 = (tmpvar_25.xyz - _LightPositionRange.xyz);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 _LightShadowData;
uniform vec4 unity_ColorSpaceDielectricSpec;
uniform vec4 _LightColor0;
uniform sampler2D unity_NHxRoughness;
uniform vec4 _Color;
uniform sampler2D _MainTex;
uniform float _Metallic;
uniform float _Glossiness;
uniform samplerCube _ShadowMapTexture;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD2_1;
varying vec4 xlv_TEXCOORD2_2;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = (_Color.xyz * texture2D (_MainTex, xlv_TEXCOORD0.xy).xyz);
  vec3 tmpvar_2;
  vec3 tmpvar_3;
  tmpvar_3 = mix (unity_ColorSpaceDielectricSpec.xyz, tmpvar_1, vec3(_Metallic));
  tmpvar_2 = (tmpvar_1 * (unity_ColorSpaceDielectricSpec.w - (_Metallic * unity_ColorSpaceDielectricSpec.w)));
  vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2_2.xyz);
  vec3 tmpvar_5;
  tmpvar_5.x = xlv_TEXCOORD2.w;
  tmpvar_5.y = xlv_TEXCOORD2_1.w;
  tmpvar_5.z = xlv_TEXCOORD2_2.w;
  vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5)));
  vec4 tmpvar_7;
  tmpvar_7 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  float mydist_8;
  mydist_8 = ((sqrt(
    dot (xlv_TEXCOORD6, xlv_TEXCOORD6)
  ) * _LightPositionRange.w) * 0.97);
  vec4 tmpvar_9;
  tmpvar_9 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  float tmpvar_10;
  if ((tmpvar_9.x < mydist_8)) {
    tmpvar_10 = _LightShadowData.x;
  } else {
    tmpvar_10 = 1.0;
  };
  vec3 viewDir_11;
  viewDir_11 = -(xlv_TEXCOORD1);
  vec2 tmpvar_12;
  tmpvar_12.x = dot ((viewDir_11 - (2.0 * 
    (dot (tmpvar_4, viewDir_11) * tmpvar_4)
  )), tmpvar_5);
  tmpvar_12.y = (1.0 - clamp (dot (tmpvar_4, viewDir_11), 0.0, 1.0));
  vec2 tmpvar_13;
  tmpvar_13.x = ((tmpvar_12 * tmpvar_12) * (tmpvar_12 * tmpvar_12)).x;
  tmpvar_13.y = (1.0 - _Glossiness);
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = ((tmpvar_2 + (
    (texture2D (unity_NHxRoughness, tmpvar_13).w * 16.0)
   * tmpvar_3)) * ((_LightColor0.xyz * 
    ((tmpvar_6.w * tmpvar_7.w) * tmpvar_10)
  ) * clamp (
    dot (tmpvar_4, tmpvar_5)
  , 0.0, 1.0)));
  vec4 xlat_varoutput_15;
  xlat_varoutput_15.xyz = tmpvar_14.xyz;
  xlat_varoutput_15.w = 1.0;
  gl_FragData[0] = xlat_varoutput_15;
}


#endif
"
}
SubProgram "metal " {
// Stats: 28 math, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
ConstBuffer "$Globals" 328
Matrix 48 [glstate_matrix_mvp]
Matrix 112 [_Object2World]
Matrix 176 [_World2Object]
MatrixHalf 296 [_LightMatrix0]
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
Vector 32 [_LightPositionRange]
Vector 240 [unity_WorldTransformParams]
Vector 256 [_MainTex_ST]
Vector 272 [_DetailAlbedoMap_ST]
ScalarHalf 288 [_UVSec]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
inline float4x4 _xlcast_float4x4(half4x4 v) { return float4x4(float4(v[0]), float4(v[1]), float4(v[2]), float4(v[3])); }
inline float3x3 _xlcast_float3x3(half3x3 v) { return float3x3(float3(v[0]), float3(v[1]), float3(v[2])); }
inline float2x2 _xlcast_float2x2(half2x2 v) { return float2x2(float2(v[0]), float2(v[1])); }
inline half4x4 _xlcast_half4x4(float4x4 v) { return half4x4(half4(v[0]), half4(v[1]), half4(v[2]), half4(v[3])); }
inline half3x3 _xlcast_half3x3(float3x3 v) { return half3x3(half3(v[0]), half3(v[1]), half3(v[2])); }
inline half2x2 _xlcast_half2x2(float2x2 v) { return half2x2(half2(v[0]), half2(v[1])); }
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4 unity_WorldTransformParams;
  float4 _MainTex_ST;
  float4 _DetailAlbedoMap_ST;
  half _UVSec;
  half4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  tmpvar_1 = half3(_mtl_i._glesNormal);
  float2 tmpvar_2;
  tmpvar_2 = _mtl_i._glesMultiTexCoord0.xy;
  float2 tmpvar_3;
  tmpvar_3 = _mtl_i._glesMultiTexCoord1.xy;
  half4 tmpvar_4;
  tmpvar_4 = half4(_mtl_i._glesTANGENT);
  float3 lightDir_5;
  float3x3 tangentToWorld_6;
  float4 tmpvar_7;
  half4 tmpvar_8;
  half4 tmpvar_9;
  half4 tmpvar_10;
  float4 tmpvar_11;
  tmpvar_11 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_7 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 texcoord_12;
  texcoord_12.xy = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  float2 tmpvar_13;
  if ((_mtl_u._UVSec == (half)0.0)) {
    tmpvar_13 = tmpvar_2;
  } else {
    tmpvar_13 = tmpvar_3;
  };
  texcoord_12.zw = ((tmpvar_13 * _mtl_u._DetailAlbedoMap_ST.xy) + _mtl_u._DetailAlbedoMap_ST.zw);
  half3 tmpvar_14;
  float3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_11.xyz - _mtl_u._WorldSpaceCameraPos));
  tmpvar_14 = half3(tmpvar_15);
  float3 norm_16;
  norm_16 = float3(tmpvar_1);
  float4 v_17;
  v_17.x = _mtl_u._World2Object[0].x;
  v_17.y = _mtl_u._World2Object[1].x;
  v_17.z = _mtl_u._World2Object[2].x;
  v_17.w = _mtl_u._World2Object[3].x;
  float4 v_18;
  v_18.x = _mtl_u._World2Object[0].y;
  v_18.y = _mtl_u._World2Object[1].y;
  v_18.z = _mtl_u._World2Object[2].y;
  v_18.w = _mtl_u._World2Object[3].y;
  float4 v_19;
  v_19.x = _mtl_u._World2Object[0].z;
  v_19.y = _mtl_u._World2Object[1].z;
  v_19.z = _mtl_u._World2Object[2].z;
  v_19.w = _mtl_u._World2Object[3].z;
  float3 tmpvar_20;
  tmpvar_20 = normalize(((
    (v_17.xyz * norm_16.x)
   + 
    (v_18.xyz * norm_16.y)
  ) + (v_19.xyz * norm_16.z)));
  float3 dir_21;
  dir_21 = float3(tmpvar_4.xyz);
  float3x3 tmpvar_22;
  tmpvar_22[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_22[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_22[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_23;
  tmpvar_23.xyz = normalize((tmpvar_22 * dir_21));
  tmpvar_23.w = float(tmpvar_4.w);
  half3 normal_24;
  normal_24 = half3(tmpvar_20);
  half3 tangent_25;
  tangent_25 = half3(tmpvar_23.xyz);
  half tangentSign_26;
  tangentSign_26 = half(tmpvar_23.w);
  half xlat_varsign_27;
  float tmpvar_28;
  tmpvar_28 = ((float)tangentSign_26 * _mtl_u.unity_WorldTransformParams.w);
  xlat_varsign_27 = half(tmpvar_28);
  half3 tmpvar_29;
  tmpvar_29 = (((normal_24.yzx * tangent_25.zxy) - (normal_24.zxy * tangent_25.yzx)) * xlat_varsign_27);
  half3x3 tmpvar_30;
  tmpvar_30[0].x = tangent_25.x;
  tmpvar_30[0].y = tmpvar_29.x;
  tmpvar_30[0].z = normal_24.x;
  tmpvar_30[1].x = tangent_25.y;
  tmpvar_30[1].y = tmpvar_29.y;
  tmpvar_30[1].z = normal_24.y;
  tmpvar_30[2].x = tangent_25.z;
  tmpvar_30[2].y = tmpvar_29.z;
  tmpvar_30[2].z = normal_24.z;
  tangentToWorld_6 = _xlcast_float3x3(tmpvar_30);
  float3 v_31;
  v_31.x = tangentToWorld_6[0].x;
  v_31.y = tangentToWorld_6[1].x;
  v_31.z = tangentToWorld_6[2].x;
  tmpvar_8.xyz = half3(v_31);
  float3 v_32;
  v_32.x = tangentToWorld_6[0].y;
  v_32.y = tangentToWorld_6[1].y;
  v_32.z = tangentToWorld_6[2].y;
  tmpvar_9.xyz = half3(v_32);
  float3 v_33;
  v_33.x = tangentToWorld_6[0].z;
  v_33.y = tangentToWorld_6[1].z;
  v_33.z = tangentToWorld_6[2].z;
  tmpvar_10.xyz = half3(v_33);
  half3 tmpvar_34;
  float3 tmpvar_35;
  tmpvar_35 = normalize((_mtl_u._WorldSpaceLightPos0.xyz - (tmpvar_11.xyz * _mtl_u._WorldSpaceLightPos0.w)));
  tmpvar_34 = half3(tmpvar_35);
  lightDir_5 = float3(tmpvar_34);
  tmpvar_8.w = half(lightDir_5.x);
  tmpvar_9.w = half(lightDir_5.y);
  tmpvar_10.w = half(lightDir_5.z);
  _mtl_o.gl_Position = tmpvar_7;
  _mtl_o.xlv_TEXCOORD0 = texcoord_12;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_14;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_8;
  _mtl_o.xlv_TEXCOORD2_1 = tmpvar_9;
  _mtl_o.xlv_TEXCOORD2_2 = tmpvar_10;
  float4 tmpvar_36;
  tmpvar_36 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD5 = ((float4)(_mtl_u._LightMatrix0 * (half4)tmpvar_36)).xyz;
  _mtl_o.xlv_TEXCOORD6 = (tmpvar_36.xyz - _mtl_u._LightPositionRange.xyz);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_5;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat12 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat12)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat4.x * u_xlat4.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_4 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat4.xyz = vec3(u_xlat16_4) * u_xlat2.xyz;
    u_xlat13 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat4.xyz;
    u_xlat1.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
    u_xlat1.x = u_xlat1.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb1 = u_xlat10_2.x<u_xlat1.x;
    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
    u_xlat5 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat5));
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_5 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat1.x = u_xlat1.x * u_xlat16_5;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 30 math, 3 textures
Keywords { "POINT" "SHADOWS_OFF" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_5;
  tmpvar_5 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_6;
  tmpvar_6 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_5)));
  half atten_7;
  atten_7 = tmpvar_6.w;
  half3 tmpvar_8;
  tmpvar_8 = _mtl_u._LightColor0.xyz;
  tmpvar_8 = (tmpvar_8 * atten_7);
  half3 viewDir_9;
  viewDir_9 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_10;
  tmpvar_10.x = dot ((viewDir_9 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_9) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_10.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_9), (half)0.0, (half)1.0));
  half2 tmpvar_11;
  tmpvar_11.x = ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * tmpvar_10)).x;
  tmpvar_11.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_12;
  tmpvar_12 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_11));
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_12.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_8 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_14;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 28 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half3 tmpvar_5;
  tmpvar_5 = _mtl_u._LightColor0.xyz;
  half3 viewDir_6;
  viewDir_6 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_7;
  tmpvar_7.x = dot ((viewDir_6 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_6) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_7.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_6), (half)0.0, (half)1.0));
  half2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7 * tmpvar_7) * (tmpvar_7 * tmpvar_7)).x;
  tmpvar_8.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_9;
  tmpvar_9 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_8));
  half4 tmpvar_10;
  tmpvar_10.w = half(1.0);
  tmpvar_10.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_9.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_5 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_11;
  xlat_varoutput_11.xyz = tmpvar_10.xyz;
  xlat_varoutput_11.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_11;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 36 math, 4 textures
Keywords { "SPOT" "SHADOWS_OFF" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]]
  ,   texture2d<half> _LightTextureB0 [[texture(3)]], sampler _mtlsmp__LightTextureB0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_5;
  half2 P_6;
  P_6 = ((_mtl_i.xlv_TEXCOORD5.xy / _mtl_i.xlv_TEXCOORD5.w) + (half)0.5);
  tmpvar_5 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_6));
  float3 LightCoord_7;
  LightCoord_7 = float3(_mtl_i.xlv_TEXCOORD5.xyz);
  float tmpvar_8;
  tmpvar_8 = dot (LightCoord_7, LightCoord_7);
  half4 tmpvar_9;
  tmpvar_9 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_8)));
  half3 tmpvar_10;
  tmpvar_10 = _mtl_u._LightColor0.xyz;
  tmpvar_10 = (tmpvar_10 * ((
    half((_mtl_i.xlv_TEXCOORD5.z > (half)0.0))
   * tmpvar_5.w) * tmpvar_9.w));
  half3 viewDir_11;
  viewDir_11 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_12;
  tmpvar_12.x = dot ((viewDir_11 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_11) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_12.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_11), (half)0.0, (half)1.0));
  half2 tmpvar_13;
  tmpvar_13.x = ((tmpvar_12 * tmpvar_12) * (tmpvar_12 * tmpvar_12)).x;
  tmpvar_13.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_14;
  tmpvar_14 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_13));
  half4 tmpvar_15;
  tmpvar_15.w = half(1.0);
  tmpvar_15.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_14.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_10 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_16;
  xlat_varoutput_16.xyz = tmpvar_15.xyz;
  xlat_varoutput_16.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_16;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 31 math, 4 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_LightTextureB0] 2D 3
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texturecube<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]]
  ,   texture2d<half> _LightTextureB0 [[texture(3)]], sampler _mtlsmp__LightTextureB0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_5;
  tmpvar_5 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_6;
  tmpvar_6 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_5)));
  half4 tmpvar_7;
  tmpvar_7 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD5));
  half atten_8;
  atten_8 = (tmpvar_6.w * tmpvar_7.w);
  half3 tmpvar_9;
  tmpvar_9 = _mtl_u._LightColor0.xyz;
  tmpvar_9 = (tmpvar_9 * atten_8);
  half3 viewDir_10;
  viewDir_10 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_11;
  tmpvar_11.x = dot ((viewDir_10 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_10) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_11.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_10), (half)0.0, (half)1.0));
  half2 tmpvar_12;
  tmpvar_12.x = ((tmpvar_11 * tmpvar_11) * (tmpvar_11 * tmpvar_11)).x;
  tmpvar_12.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_13;
  tmpvar_13 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_12));
  half4 tmpvar_14;
  tmpvar_14.w = half(1.0);
  tmpvar_14.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_13.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_9 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_15;
  xlat_varoutput_15.xyz = tmpvar_14.xyz;
  xlat_varoutput_15.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_15;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texture2d<half> _LightTexture0 [[texture(2)]], sampler _mtlsmp__LightTexture0 [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_5;
  tmpvar_5 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD5));
  half atten_6;
  atten_6 = tmpvar_5.w;
  half3 tmpvar_7;
  tmpvar_7 = _mtl_u._LightColor0.xyz;
  tmpvar_7 = (tmpvar_7 * atten_6);
  half3 viewDir_8;
  viewDir_8 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_9;
  tmpvar_9.x = dot ((viewDir_8 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_8) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_9.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_8), (half)0.0, (half)1.0));
  half2 tmpvar_10;
  tmpvar_10.x = ((tmpvar_9 * tmpvar_9) * (tmpvar_9 * tmpvar_9)).x;
  tmpvar_10.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_11;
  tmpvar_11 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_10));
  half4 tmpvar_12;
  tmpvar_12.w = half(1.0);
  tmpvar_12.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_11.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_7 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_13;
  xlat_varoutput_13.xyz = tmpvar_12.xyz;
  xlat_varoutput_13.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_13;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 40 math, 5 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
ConstBuffer "$Globals" 36
VectorHalf 0 [_LightShadowData] 4
VectorHalf 8 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
ScalarHalf 32 [_Metallic]
ScalarHalf 34 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::less);
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   depth2d<float> _ShadowMapTexture [[texture(2)]], sampler _mtlsmp__ShadowMapTexture [[sampler(2)]]
  ,   texture2d<half> _LightTexture0 [[texture(3)]], sampler _mtlsmp__LightTexture0 [[sampler(3)]]
  ,   texture2d<half> _LightTextureB0 [[texture(4)]], sampler _mtlsmp__LightTextureB0 [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_5;
  half2 P_6;
  P_6 = ((_mtl_i.xlv_TEXCOORD5.xy / _mtl_i.xlv_TEXCOORD5.w) + (half)0.5);
  tmpvar_5 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_6));
  half tmpvar_7;
  tmpvar_7 = dot (_mtl_i.xlv_TEXCOORD5.xyz, _mtl_i.xlv_TEXCOORD5.xyz);
  half4 tmpvar_8;
  tmpvar_8 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(half2(tmpvar_7)));
  half tmpvar_9;
  float4 shadowCoord_10;
  shadowCoord_10 = float4(_mtl_i.xlv_TEXCOORD6);
  half shadow_11;
  half tmpvar_12;
  tmpvar_12 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, (float2)(shadowCoord_10).xy / (float)(shadowCoord_10).w, (float)(shadowCoord_10).z / (float)(shadowCoord_10).w);
  shadow_11 = (_mtl_u._LightShadowData.x + (tmpvar_12 * ((half)1.0 - _mtl_u._LightShadowData.x)));
  tmpvar_9 = shadow_11;
  half3 tmpvar_13;
  tmpvar_13 = _mtl_u._LightColor0.xyz;
  tmpvar_13 = (tmpvar_13 * ((
    (half((_mtl_i.xlv_TEXCOORD5.z > (half)0.0)) * tmpvar_5.w)
   * tmpvar_8.w) * tmpvar_9));
  half3 viewDir_14;
  viewDir_14 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_15;
  tmpvar_15.x = dot ((viewDir_14 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_14) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_15.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_14), (half)0.0, (half)1.0));
  half2 tmpvar_16;
  tmpvar_16.x = ((tmpvar_15 * tmpvar_15) * (tmpvar_15 * tmpvar_15)).x;
  tmpvar_16.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_17;
  tmpvar_17 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_16));
  half4 tmpvar_18;
  tmpvar_18.w = half(1.0);
  tmpvar_18.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_17.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_13 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_19;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  half4 xlv_TEXCOORD5;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texture2d<half> _ShadowMapTexture [[texture(2)]], sampler _mtlsmp__ShadowMapTexture [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half tmpvar_5;
  tmpvar_5 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, ((float2)(_mtl_i.xlv_TEXCOORD5).xy / (float)(_mtl_i.xlv_TEXCOORD5).w)).x;
  half atten_6;
  atten_6 = tmpvar_5;
  half3 tmpvar_7;
  tmpvar_7 = _mtl_u._LightColor0.xyz;
  tmpvar_7 = (tmpvar_7 * atten_6);
  half3 viewDir_8;
  viewDir_8 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_9;
  tmpvar_9.x = dot ((viewDir_8 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_8) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_9.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_8), (half)0.0, (half)1.0));
  half2 tmpvar_10;
  tmpvar_10.x = ((tmpvar_9 * tmpvar_9) * (tmpvar_9 * tmpvar_9)).x;
  tmpvar_10.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_11;
  tmpvar_11 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_10));
  half4 tmpvar_12;
  tmpvar_12.w = half(1.0);
  tmpvar_12.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_11.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_7 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_13;
  xlat_varoutput_13.xyz = tmpvar_12.xyz;
  xlat_varoutput_13.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_13;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 30 math, 4 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
ConstBuffer "$Globals" 28
VectorHalf 0 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 8 [_LightColor0] 4
VectorHalf 16 [_Color] 4
ScalarHalf 24 [_Metallic]
ScalarHalf 26 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float2 xlv_TEXCOORD5;
  half4 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texture2d<half> _ShadowMapTexture [[texture(2)]], sampler _mtlsmp__ShadowMapTexture [[sampler(2)]]
  ,   texture2d<half> _LightTexture0 [[texture(3)]], sampler _mtlsmp__LightTexture0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  tmpvar_3 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_4;
  tmpvar_4.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_4.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_4.z = _mtl_i.xlv_TEXCOORD2_2.w;
  half4 tmpvar_5;
  tmpvar_5 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD5));
  half4 tmpvar_6;
  tmpvar_6 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, ((float2)(_mtl_i.xlv_TEXCOORD6).xy / (float)(_mtl_i.xlv_TEXCOORD6).w));
  half atten_7;
  atten_7 = (tmpvar_5.w * tmpvar_6.x);
  half3 tmpvar_8;
  tmpvar_8 = _mtl_u._LightColor0.xyz;
  tmpvar_8 = (tmpvar_8 * atten_7);
  half3 viewDir_9;
  viewDir_9 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_10;
  tmpvar_10.x = dot ((viewDir_9 - ((half)2.0 * 
    (dot (tmpvar_3, viewDir_9) * tmpvar_3)
  )), tmpvar_4);
  tmpvar_10.y = ((half)1.0 - clamp (dot (tmpvar_3, viewDir_9), (half)0.0, (half)1.0));
  half2 tmpvar_11;
  tmpvar_11.x = ((tmpvar_10 * tmpvar_10) * (tmpvar_10 * tmpvar_10)).x;
  tmpvar_11.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_12;
  tmpvar_12 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_11));
  half4 tmpvar_13;
  tmpvar_13.w = half(1.0);
  tmpvar_13.xyz = (((tmpvar_2 * 
    (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w))
  ) + (
    (tmpvar_12.w * (half)16.0)
   * 
    mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic))
  )) * (tmpvar_8 * clamp (
    dot (tmpvar_3, tmpvar_4)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_14;
  xlat_varoutput_14.xyz = tmpvar_13.xyz;
  xlat_varoutput_14.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_14;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 37 math, 4 textures, 1 branches
Keywords { "POINT" "SHADOWS_CUBE" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
ConstBuffer "$Globals" 52
Vector 0 [_LightPositionRange]
VectorHalf 16 [_LightShadowData] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [_LightColor0] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texturecube<float> _ShadowMapTexture [[texture(2)]], sampler _mtlsmp__ShadowMapTexture [[sampler(2)]]
  ,   texture2d<half> _LightTexture0 [[texture(3)]], sampler _mtlsmp__LightTexture0 [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_7;
  tmpvar_7 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_8;
  tmpvar_8 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_7)));
  float mydist_9;
  mydist_9 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD6, _mtl_i.xlv_TEXCOORD6)
  ) * _mtl_u._LightPositionRange.w) * 0.97);
  float4 tmpvar_10;
  tmpvar_10 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)(_mtl_i.xlv_TEXCOORD6));
  half tmpvar_11;
  if ((tmpvar_10.x < mydist_9)) {
    tmpvar_11 = _mtl_u._LightShadowData.x;
  } else {
    tmpvar_11 = half(1.0);
  };
  half3 tmpvar_12;
  tmpvar_12 = _mtl_u._LightColor0.xyz;
  tmpvar_12 = (tmpvar_12 * (tmpvar_8.w * tmpvar_11));
  half3 viewDir_13;
  viewDir_13 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_14;
  tmpvar_14.x = dot ((viewDir_13 - ((half)2.0 * 
    (dot (tmpvar_5, viewDir_13) * tmpvar_5)
  )), tmpvar_6);
  tmpvar_14.y = ((half)1.0 - clamp (dot (tmpvar_5, viewDir_13), (half)0.0, (half)1.0));
  half2 tmpvar_15;
  tmpvar_15.x = ((tmpvar_14 * tmpvar_14) * (tmpvar_14 * tmpvar_14)).x;
  tmpvar_15.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_16;
  tmpvar_16 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_15));
  half4 tmpvar_17;
  tmpvar_17.w = half(1.0);
  tmpvar_17.xyz = ((tmpvar_3 + (
    (tmpvar_16.w * (half)16.0)
   * tmpvar_4)) * (tmpvar_12 * clamp (
    dot (tmpvar_5, tmpvar_6)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_18;
  xlat_varoutput_18.xyz = tmpvar_17.xyz;
  xlat_varoutput_18.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_18;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 38 math, 5 textures, 1 branches
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
SetTexture 0 [unity_NHxRoughness] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] CUBE 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_LightTextureB0] 2D 4
ConstBuffer "$Globals" 52
Vector 0 [_LightPositionRange]
VectorHalf 16 [_LightShadowData] 4
VectorHalf 24 [unity_ColorSpaceDielectricSpec] 4
VectorHalf 32 [_LightColor0] 4
VectorHalf 40 [_Color] 4
ScalarHalf 48 [_Metallic]
ScalarHalf 50 [_Glossiness]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half4 xlv_TEXCOORD2;
  half4 xlv_TEXCOORD2_1;
  half4 xlv_TEXCOORD2_2;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  half4 _LightShadowData;
  half4 unity_ColorSpaceDielectricSpec;
  half4 _LightColor0;
  half4 _Color;
  half _Metallic;
  half _Glossiness;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> unity_NHxRoughness [[texture(0)]], sampler _mtlsmp_unity_NHxRoughness [[sampler(0)]]
  ,   texture2d<half> _MainTex [[texture(1)]], sampler _mtlsmp__MainTex [[sampler(1)]]
  ,   texturecube<float> _ShadowMapTexture [[texture(2)]], sampler _mtlsmp__ShadowMapTexture [[sampler(2)]]
  ,   texturecube<half> _LightTexture0 [[texture(3)]], sampler _mtlsmp__LightTexture0 [[sampler(3)]]
  ,   texture2d<half> _LightTextureB0 [[texture(4)]], sampler _mtlsmp__LightTextureB0 [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0.xy));
  half3 tmpvar_2;
  tmpvar_2 = (_mtl_u._Color.xyz * tmpvar_1.xyz);
  half3 tmpvar_3;
  half3 tmpvar_4;
  tmpvar_4 = mix (_mtl_u.unity_ColorSpaceDielectricSpec.xyz, tmpvar_2, half3(_mtl_u._Metallic));
  tmpvar_3 = (tmpvar_2 * (_mtl_u.unity_ColorSpaceDielectricSpec.w - (_mtl_u._Metallic * _mtl_u.unity_ColorSpaceDielectricSpec.w)));
  half3 tmpvar_5;
  tmpvar_5 = normalize(_mtl_i.xlv_TEXCOORD2_2.xyz);
  half3 tmpvar_6;
  tmpvar_6.x = _mtl_i.xlv_TEXCOORD2.w;
  tmpvar_6.y = _mtl_i.xlv_TEXCOORD2_1.w;
  tmpvar_6.z = _mtl_i.xlv_TEXCOORD2_2.w;
  float tmpvar_7;
  tmpvar_7 = dot (_mtl_i.xlv_TEXCOORD5, _mtl_i.xlv_TEXCOORD5);
  half4 tmpvar_8;
  tmpvar_8 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_7)));
  half4 tmpvar_9;
  tmpvar_9 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD5));
  float mydist_10;
  mydist_10 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD6, _mtl_i.xlv_TEXCOORD6)
  ) * _mtl_u._LightPositionRange.w) * 0.97);
  float4 tmpvar_11;
  tmpvar_11 = _ShadowMapTexture.sample(_mtlsmp__ShadowMapTexture, (float3)(_mtl_i.xlv_TEXCOORD6));
  half tmpvar_12;
  if ((tmpvar_11.x < mydist_10)) {
    tmpvar_12 = _mtl_u._LightShadowData.x;
  } else {
    tmpvar_12 = half(1.0);
  };
  half3 tmpvar_13;
  tmpvar_13 = _mtl_u._LightColor0.xyz;
  tmpvar_13 = (tmpvar_13 * ((tmpvar_8.w * tmpvar_9.w) * tmpvar_12));
  half3 viewDir_14;
  viewDir_14 = -(_mtl_i.xlv_TEXCOORD1);
  half2 tmpvar_15;
  tmpvar_15.x = dot ((viewDir_14 - ((half)2.0 * 
    (dot (tmpvar_5, viewDir_14) * tmpvar_5)
  )), tmpvar_6);
  tmpvar_15.y = ((half)1.0 - clamp (dot (tmpvar_5, viewDir_14), (half)0.0, (half)1.0));
  half2 tmpvar_16;
  tmpvar_16.x = ((tmpvar_15 * tmpvar_15) * (tmpvar_15 * tmpvar_15)).x;
  tmpvar_16.y = ((half)1.0 - _mtl_u._Glossiness);
  half4 tmpvar_17;
  tmpvar_17 = unity_NHxRoughness.sample(_mtlsmp_unity_NHxRoughness, (float2)(tmpvar_16));
  half4 tmpvar_18;
  tmpvar_18.w = half(1.0);
  tmpvar_18.xyz = ((tmpvar_3 + (
    (tmpvar_17.w * (half)16.0)
   * tmpvar_4)) * (tmpvar_13 * clamp (
    dot (tmpvar_5, tmpvar_6)
  , (half)0.0, (half)1.0)));
  half4 xlat_varoutput_19;
  xlat_varoutput_19.xyz = tmpvar_18.xyz;
  xlat_varoutput_19.w = half(1.0);
  _mtl_o._glesFragData_0 = xlat_varoutput_19;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on glcore"
}
}
 }


 // Stats for Vertex shader:
 //       metal : 15 avg math (3..28), 0 avg branch (0..1)
 //      opengl : 2 avg math (1..4)
 // Stats for Fragment shader:
 //       metal : 2 avg math (1..4)
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 488501
Program "vp" {
SubProgram "opengl " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"#version 120

#ifdef VERTEX
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_LightShadowBias;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform mat4 unity_MatrixVP;
void main ()
{
  vec3 vertex_1;
  vertex_1 = gl_Vertex.xyz;
  vec4 clipPos_2;
  if ((unity_LightShadowBias.z != 0.0)) {
    vec4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    vec3 tmpvar_4;
    tmpvar_4 = (_Object2World * tmpvar_3).xyz;
    vec4 v_5;
    v_5.x = _World2Object[0].x;
    v_5.y = _World2Object[1].x;
    v_5.z = _World2Object[2].x;
    v_5.w = _World2Object[3].x;
    vec4 v_6;
    v_6.x = _World2Object[0].y;
    v_6.y = _World2Object[1].y;
    v_6.z = _World2Object[2].y;
    v_6.w = _World2Object[3].y;
    vec4 v_7;
    v_7.x = _World2Object[0].z;
    v_7.y = _World2Object[1].z;
    v_7.z = _World2Object[2].z;
    v_7.w = _World2Object[3].z;
    vec3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * gl_Normal.x)
     + 
      (v_6.xyz * gl_Normal.y)
    ) + (v_7.xyz * gl_Normal.z)));
    float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _WorldSpaceLightPos0.w)
    )));
    vec4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (unity_MatrixVP * tmpvar_10);
  } else {
    vec4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (gl_ModelViewProjectionMatrix * tmpvar_11);
  };
  vec4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, -(clipPos_2.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_12;
}


#endif
#ifdef FRAGMENT
void main ()
{
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "metal " {
// Stats: 28 math, 1 branches
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 288
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [_Object2World]
Matrix 160 [_World2Object]
Matrix 224 [unity_MatrixVP]
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [unity_LightShadowBias]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  float4 unity_LightShadowBias;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4x4 _World2Object;
  float4x4 unity_MatrixVP;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 vertex_1;
  vertex_1 = _mtl_i._glesVertex.xyz;
  float4 clipPos_2;
  if ((_mtl_u.unity_LightShadowBias.z != 0.0)) {
    float4 tmpvar_3;
    tmpvar_3.w = 1.0;
    tmpvar_3.xyz = vertex_1;
    float3 tmpvar_4;
    tmpvar_4 = (_mtl_u._Object2World * tmpvar_3).xyz;
    float4 v_5;
    v_5.x = _mtl_u._World2Object[0].x;
    v_5.y = _mtl_u._World2Object[1].x;
    v_5.z = _mtl_u._World2Object[2].x;
    v_5.w = _mtl_u._World2Object[3].x;
    float4 v_6;
    v_6.x = _mtl_u._World2Object[0].y;
    v_6.y = _mtl_u._World2Object[1].y;
    v_6.z = _mtl_u._World2Object[2].y;
    v_6.w = _mtl_u._World2Object[3].y;
    float4 v_7;
    v_7.x = _mtl_u._World2Object[0].z;
    v_7.y = _mtl_u._World2Object[1].z;
    v_7.z = _mtl_u._World2Object[2].z;
    v_7.w = _mtl_u._World2Object[3].z;
    float3 tmpvar_8;
    tmpvar_8 = normalize(((
      (v_5.xyz * _mtl_i._glesNormal.x)
     + 
      (v_6.xyz * _mtl_i._glesNormal.y)
    ) + (v_7.xyz * _mtl_i._glesNormal.z)));
    float tmpvar_9;
    tmpvar_9 = dot (tmpvar_8, normalize((_mtl_u._WorldSpaceLightPos0.xyz - 
      (tmpvar_4 * _mtl_u._WorldSpaceLightPos0.w)
    )));
    float4 tmpvar_10;
    tmpvar_10.w = 1.0;
    tmpvar_10.xyz = (tmpvar_4 - (tmpvar_8 * (_mtl_u.unity_LightShadowBias.z * 
      sqrt((1.0 - (tmpvar_9 * tmpvar_9)))
    )));
    clipPos_2 = (_mtl_u.unity_MatrixVP * tmpvar_10);
  } else {
    float4 tmpvar_11;
    tmpvar_11.w = 1.0;
    tmpvar_11.xyz = vertex_1;
    clipPos_2 = (_mtl_u.glstate_matrix_mvp * tmpvar_11);
  };
  float4 clipPos_12;
  clipPos_12.xyw = clipPos_2.xyw;
  clipPos_12.z = (clipPos_2.z + clamp ((_mtl_u.unity_LightShadowBias.x / clipPos_2.w), 0.0, 1.0));
  clipPos_12.z = mix (clipPos_12.z, max (clipPos_12.z, 0.0), _mtl_u.unity_LightShadowBias.y);
  _mtl_o.gl_Position = clipPos_12;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	mat4x4 unity_MatrixVP;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + _Object2World[3].xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + unity_MatrixVP[3];
    u_xlat1 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
    u_xlatb2 = unity_LightShadowBias.z!=0.0;
    u_xlat0 = (bool(u_xlatb2)) ? u_xlat0 : u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 4 math
Keywords { "SHADOWS_CUBE" }
"#version 120

#ifdef VERTEX
uniform vec4 _LightPositionRange;

uniform mat4 _Object2World;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = ((_Object2World * gl_Vertex).xyz - _LightPositionRange.xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
}


#endif
#ifdef FRAGMENT
uniform vec4 _LightPositionRange;
uniform vec4 unity_LightShadowBias;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  gl_FragData[0] = vec4(((sqrt(
    dot (xlv_TEXCOORD0, xlv_TEXCOORD0)
  ) + unity_LightShadowBias.x) * _LightPositionRange.w));
}


#endif
"
}
SubProgram "metal " {
// Stats: 3 math
Keywords { "SHADOWS_CUBE" }
Bind "vertex" ATTR0
ConstBuffer "$Globals" 144
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Vector 0 [_LightPositionRange]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float3 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_u._Object2World * _mtl_i._glesVertex).xyz - _mtl_u._LightPositionRange.xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 1 math
Keywords { "SHADOWS_DEPTH" }
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o._glesFragData_0 = half4(float4(0.0, 0.0, 0.0, 0.0));
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 4 math
Keywords { "SHADOWS_CUBE" }
ConstBuffer "$Globals" 32
Vector 0 [_LightPositionRange]
Vector 16 [unity_LightShadowBias]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float3 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _LightPositionRange;
  float4 unity_LightShadowBias;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = float4(((sqrt(
    dot (_mtl_i.xlv_TEXCOORD0, _mtl_i.xlv_TEXCOORD0)
  ) + _mtl_u.unity_LightShadowBias.x) * _mtl_u._LightPositionRange.w));
  tmpvar_1 = half4(tmpvar_2);
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on glcore"
}
}
 }
}
Fallback "VertexLit"
}