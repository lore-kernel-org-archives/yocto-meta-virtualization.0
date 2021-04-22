Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.48])
 by mx.groups.io with SMTP id smtpd.web08.2864.1619120095297574417
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 12:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UxU5SAat;
 spf=pass (domain: windriver.com, ip: 40.107.236.48, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEet3409aRHqzLkHUCK5/7eyBYQXQkn1fSzT/Z33dPX/S/UggUsogzr8uSMkgdlGG7vOUkNlz/gP3fWsTCxVPch6GjuHvpUJSqz0OWjazHBV/xevjgSJkzpxu8fXx3ju73aR+VrwyBEpv2wqXgPNBBQ+EAH8uMRGTEczuH8rx26MQ1oAZN7gPArg+SIx/9qbB1SmR6tLZ9rbffO85QX6cEGX62MzRqwYlH3S/j4jZ/xSmDB1gFDce9owuocC0qGQmBsoLQdLaW3gVeEHTCCVFLoeFR9nTMouaRMNurSJsWt1WWRRE9gwz7o8Fq+o+gYgRslDLHkGjOQuVop+fCtPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCyPoMXpBAiVjTgrY+ON9TGd3AwM6r7Y9kgzARkkvH8=;
 b=gWRSzLtOBFcbI3/WhcuYXCBCn9KcosfWfLahL4p3M8JtIFPwpNWcSlfrhd/sGnPR9zPpsfQeFhdW+KnlpuXf3fbtT6nutmMbziZhrEgnA83Be7x6t+ezKKfQ7mLlW4G8SzYlocsFIJyoK6ym0IaSE4ap6Ek2FiPhwnNnG6KLipWVS/oxg5uBUbGrqOq0t0tpCUXhWHJPSjI69YxMg2hGW3AugxBQ4hRTUaWgQOdmi+CLOZQGGSZjGMg6AUa0fsb+SMtLDzi+g+M5tvz0UIqp+pxZ5eXr1vkMSeI8aoGlaqpn/+HhD944uMFBzaeEhJ2m/Q9ZbN1pqbD7l989xFJToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCyPoMXpBAiVjTgrY+ON9TGd3AwM6r7Y9kgzARkkvH8=;
 b=UxU5SAatmBLp7n5YFEVMpp+vH0GuDj4sJT1mcSzN0cQjlDAAe0l5A3BqGX0vXl2udiy+PHffUol3mgyGgJzL+Gz6W/yQpSekB00OXL20SWAfolnTu5059b1kIM0mFqu4Jkw757kfZO3SG90ndLH4xCzfdsgEn2MuhsdqZ9+O/sg=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1680.namprd11.prod.outlook.com (2603:10b6:301:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 22 Apr
 2021 19:34:53 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 19:34:53 +0000
Subject: Re: [meta-virtualization] [PATCH] ceph: Upgrade to 16.2.0
To: meta-virtualization@lists.yoctoproject.org
References: <16784505F0C7AD01.8361@lists.yoctoproject.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <a0a25678-7990-d5ab-2327-6a9701b2bf5e@windriver.com>
Date: Thu, 22 Apr 2021 12:34:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <16784505F0C7AD01.8361@lists.yoctoproject.org>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR14CA0056.namprd14.prod.outlook.com
 (2603:10b6:300:81::18) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR14CA0056.namprd14.prod.outlook.com (2603:10b6:300:81::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 19:34:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a3d76fd-2e95-4837-259b-08d905c5b3b1
X-MS-TrafficTypeDiagnostic: MWHPR11MB1680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB16807E3A2FED29782C613A4AEE469@MWHPR11MB1680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	68hnAO/fEBNhLy9pkCXKf0aWXJU4MehUpD5JY6zLd3DDptMZ7zvv6CXNsLhUXal2PDe4EBuQgMn4N/G/Duu66Nhh5lXuew/vSdXbaKicrPA1dGJ2hDqZ29wfECeiDh6Av/CmShK3UPM6eF0lNL3ZBbC20w26UamY7mIMA59LS3OiB3/wOWM4BHPtg4hjbmVK0AsiPrJqJQbtWiFfUXDv00WoEi12xrEV8AfDcJidoNhF0QMDc2EHPilJp4HFA/xm3jpPzfZjp1jqBTMlC5Z7wuGLNTOSLwNHjIuRtJM/9EreAOK0RnMxRjrb/ATDw27Eg4HERlEX1PUVI9m8TIUd1k6W5ngUsGrZS6B1c8+Vdm+djxjZ8IEdn8BXvpVtgEYNP3uu1FxapczovTXDc9zMBuvYrEHtWQsYz2M8F4pQRu6uMiYEPu3OiJPHXRIsKiCYsXywAtSq5cj5S34ZqVB3XcxDuiDputkv92nHNfAnlgrhAyS55BHnO5NHd0KC6CzF7MkCSbAbuQ0XfNHgs9k5piposb8dYcsu7Yq2nVcyK6giAETFpLmVPVbH0Km5MUUfQqBDQkp5aG889yWhSzD/Rstuf5ClNiZyogQIGRhOvMTHWnE+XLYe33yM4eDd90fiGSXwYka4Egz9d5SnIlUQgwPMppMQMTx9wZ0JtGktJ1aTLDg9h1Ys2DZAipor3RBP5JtcWFQp0VxOTcnd+GYFZc6mBOEfK6jPYCuqqV/S0JcJC8dhUfDjjC5BQ+pVBgEzd6KYOSb4IbPGQ91OLifb5X+gpXMLJklUHiokmJsTD03F1E3fWBJ4vdkTOkXzvYfF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(376002)(346002)(136003)(396003)(966005)(83380400001)(8676002)(31686004)(16576012)(30864003)(5660300002)(66946007)(8936002)(478600001)(53546011)(2616005)(26005)(31696002)(16526019)(2906002)(6916009)(186003)(66476007)(38350700002)(956004)(38100700002)(66556008)(86362001)(36756003)(52116002)(6486002)(316002)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OStqbUNmQXBpVVEvQkpGZlh6YzZKTVBaMlpFQkNKZjRpb2h4b2lWQWE5WDF6?=
 =?utf-8?B?RU5iRytUK1dyTmxGOG9oTHFoWm5uSUFINTY2M2pHTWMyZWM1Z2VsWWVUZVkv?=
 =?utf-8?B?Y1hZN1c4azNVRmkrUnRnaHZLenZtTFhXOWYwTFFzenRZTTRKOE94REU5Tmgw?=
 =?utf-8?B?eTFUZ2tzak9WblF0cDRQcWM0MUY0Y0JUcUFYZTVSQlllSXlIaXZPdzNMMjBl?=
 =?utf-8?B?UTBKR0dKallqbzVWZjRjd21DN0hmbDZQbFdaRm8yak5hdlRlQURHeDE4Nzhk?=
 =?utf-8?B?NFlmU1RqYWJOV0kxVTQrUW9hZXkvcDVqcU5NTnpvc2FlbTVxYUR1Rk50SHh5?=
 =?utf-8?B?cEIyTmN2U0dRby9BZnhPaWliRnJzT3E1TDRGRkVtd3drR3htbW02TkZnTTFI?=
 =?utf-8?B?QnFTSVNnM3g4YzErREpRdlpJSnZwMFJBeWc3SHAyM3JtdTVVazl3SzhkMlpU?=
 =?utf-8?B?cHU2bDNzRFpyOTBDbE9TWXlTU2ZJYkR3c2lnQWV6ak8ydURnY3FHcGxPbVFJ?=
 =?utf-8?B?VUNJK1MwSDFzRnRsUlJtUEVqR0JjMHFwZFlQcDFsYjJXVkFhOStrM0JubVY0?=
 =?utf-8?B?UDlWNVd4eDc3STU4NDhVMm93WGlENGZtVU1iZlR1RmFoa1hJODVPQ0lIRU90?=
 =?utf-8?B?UzErV0U5OTczRjFsalhsdklaWmRPR01JQ2hRMGdPblpYMis2YVRZcmlGZzY3?=
 =?utf-8?B?aGp5K0hWRG9yd0Y4djYvWTRzRE5KMld6cmM1azh0NytNVEN1d0ZkZVpCaEU0?=
 =?utf-8?B?b2tXT0NFZUhJdXZhcjlxaGRJY1hRMUpJN0hVSGxOaTJjdTc5blI1aE13Rjd4?=
 =?utf-8?B?bHI4bDJnMFlFM1ZuMmM1N0ZSWEhoQnNEQVVtc0ZOUTNpNTE3bHNpQ29aZWFn?=
 =?utf-8?B?bERmaFZKM2U4NUJzMzdheEo3RlZ4ZnZlQjh2dUhmVkpiN0Rxa0VkN0htMzVi?=
 =?utf-8?B?Y3MvdkxhTVJNa2VuNm01SjMwd2YzL3ZVeXJMdDhPZ1FVMEMyZlByNVIwd2FU?=
 =?utf-8?B?VlkzZzl1bXVJZEN5SUhFNGIwS3dqd1h5Nms5ck5ranY4NGVkOENvMU1yMith?=
 =?utf-8?B?aXMvcHVKSWNDOXNsbzBSVXZvdW1BUmx3ODNiM2xKTlVHdEJGQTRCLzdJdTFM?=
 =?utf-8?B?dGlzRUV3UGlHYWJ6N1lYdVppbldINDJEZ2FONTNCNGZpYmtVT0F2SzRvb2dP?=
 =?utf-8?B?LzYxUkJpNTd4eGdRU0dLTytrOCt0eURQbm9IeS81dWE5UUpKbWlNTkVyWkhG?=
 =?utf-8?B?eGlPQWVoNC9rb2lvWjZqTzVKNENiM2pkazc4eloycG1qUHQ1RTBPNHFzRXVH?=
 =?utf-8?B?clhJakE4S3FwZVFBRUpMUjgyQ2FES2UrK2RKZFl6bHIzR2pJMVlQNllqYlpo?=
 =?utf-8?B?SWd3THJTQjc1QUFUTVkxZkxTOERMRWlwMEZrTjk4N25mclpISUlndnowb2pH?=
 =?utf-8?B?Z085K0pjbkIvbmcrRGkwenNQQ01pSnNWRTRrbHZPNUtnN3p6b1JvNnRrMStX?=
 =?utf-8?B?RVFyZXNUVWRKQnUybDRxa2dNUmZZd0EwZjZSNGRsR1JWb0crbTBZcHFyb2xi?=
 =?utf-8?B?V1FuUE1RUHBnQ05jcXhCaUQ3NEhnMCtnR0xGMkxOU3psTUxST0k1RWE5OVhC?=
 =?utf-8?B?eTBuaUJNR0RpTC95T1QybFNOdXpCb3g3TU9VVDVxVzhaYUkrZ25LYTZKT3Vj?=
 =?utf-8?B?RExoUnNBb3lYaU56bFovTS8ybXFYS2NpY0V5YjgrQ2JxdjVVNEdTK01pOUNk?=
 =?utf-8?Q?aaMV88et/5McYNOdCQKJmAOzZcmvTtVXxbMScgq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3d76fd-2e95-4837-259b-08d905c5b3b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 19:34:53.4259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSAVUmQ3F50Pse9D5FbrqTYGroi62fqloOa7xBfn76wnpCJwDz6L+Ga7kMxsmsy6Fxs4VC277AZ8ZFEog7VkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1680
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Bruce

I am aware there is a 16.2.1 that was just published on the 19th, I 
wanted to get visibility to the base upgrade which I just completed 
while I work on the dot dot update.

Ceph-17 is the next major release, but has not be released yet.

Thanks

Sau!


On 4/22/21 12:32 PM, Saul Wold wrote:
> This updates the Ceph version to 16.2.0 which required a couple
> changes to base code via a rebased patch which also disabled the
> sanity check due to it not working correctly, but the actual
> compile worked.  Also added a new patch to add soversion information
> for the new libcephsqlite library so it would be packaged correctly
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   ...h-fix-build-errors-for-cross-compile.patch | 119 ++++++++++++++----
>   ...ite-Add-library-soversion-properties.patch |  31 +++++
>   recipes-extended/ceph/ceph_16.2.0.bb          |  22 ++--
>   3 files changed, 138 insertions(+), 34 deletions(-)
>   create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> 
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> index 7764a2b..00c7e5b 100644
> --- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> +++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> @@ -1,10 +1,15 @@
> -From 04b53b669dbd75c9a90bf7f8ae2b47ff96176239 Mon Sep 17 00:00:00 2001
> +From 2a3ccc8079040a7e783b8a9091618878e7cf0719 Mon Sep 17 00:00:00 2001
>   From: Dengke Du <dengke.du@windriver.com>
>   Date: Mon, 11 Mar 2019 09:14:09 +0800
>   Subject: [PATCH] ceph: fix build errors for cross compile
>   
>   1. set the cross compile sysroot to find the rocksdb library
>   2. correct the install path for library in Distutils.cmake
> +3. remove / disable the sanity_check(), for some reasong the
> +   sanity check gets the wrong settings and will not link
> +   correctly, but the actual build works correctly, this needs
> +   more investigation later, earlier versions of the patch also
> +   removed it but no comment on why. (sgw)
>   
>   Upstream-Status: Inappropriate [oe specific]
>   
> @@ -14,16 +19,17 @@ Adjust context for v14.2.3
>   
>   Signed-off-by: He Zhe <zhe.he@windriver.com>
>   Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
>   
>   ---
>    cmake/modules/Distutils.cmake      | 25 +++++--------------------
>    cmake/modules/FindRocksDB.cmake    |  4 ++--
>    src/compressor/zstd/CMakeLists.txt |  2 +-
> - src/pybind/cephfs/setup.py         |  1 -
> - src/pybind/rados/setup.py          |  1 -
> - src/pybind/rbd/setup.py            |  1 -
> - src/pybind/rgw/setup.py            |  1 -
> - 7 files changed, 8 insertions(+), 27 deletions(-)
> + src/pybind/cephfs/setup.py         | 18 +++++-------------
> + src/pybind/rados/setup.py          | 11 ++---------
> + src/pybind/rbd/setup.py            | 18 +++++-------------
> + src/pybind/rgw/setup.py            | 18 +++++-------------
> + 7 files changed, 25 insertions(+), 71 deletions(-)
>   
>   diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
>   index ff01aaf81..18656c5a5 100644
> @@ -105,50 +111,111 @@ index b53b0d944..4955711a9 100644
>                 -G${CMAKE_GENERATOR}
>      BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
>   diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
> -index c3d40df05..87cdeb473 100755
> +index c3d40df05..24c26c3ed 100755
>   --- a/src/pybind/cephfs/setup.py
>   +++ b/src/pybind/cephfs/setup.py
> -@@ -137,7 +137,6 @@ def check_sanity():
> +@@ -137,19 +137,11 @@ def check_sanity():
>        finally:
>            shutil.rmtree(tmp_dir)
>    
>   -
> - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> -     ext_args = {}
> -     cython_constants = dict(BUILD_DOC=True)
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-    cythonize_args = dict(compile_time_env=cython_constants)
> +-elif check_sanity():
> +-    ext_args = get_python_flags(['cephfs'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> +-    cythonize_args = dict(compile_time_env=cython_constants,
> +-                          include_path=include_path)
> +-else:
> +-    sys.exit(1)
> ++ext_args = get_python_flags(['cephfs'])
> ++cython_constants = dict(BUILD_DOC=False)
> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> ++cythonize_args = dict(compile_time_env=cython_constants,
> ++                      include_path=include_path)
> +
> + cmdclass = {}
> + try:
>   diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
> -index 0d1047825..feafb605d 100755
> +index 0d1047825..cff85a063 100755
>   --- a/src/pybind/rados/setup.py
>   +++ b/src/pybind/rados/setup.py
> -@@ -131,7 +131,6 @@ def check_sanity():
> +@@ -131,15 +131,8 @@ def check_sanity():
>        finally:
>            shutil.rmtree(tmp_dir)
>    
>   -
> - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> -     ext_args = {}
> -     cython_constants = dict(BUILD_DOC=True)
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-elif check_sanity():
> +-    ext_args = get_python_flags(['rados'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-else:
> +-    sys.exit(1)
> ++ext_args = get_python_flags(['rados'])
> ++cython_constants = dict(BUILD_DOC=False)
> +
> + cmdclass = {}
> + try:
>   diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
> -index 73ea4555f..b9c6a78d2 100755
> +index 73ea4555f..e7f57ddb5 100755
>   --- a/src/pybind/rbd/setup.py
>   +++ b/src/pybind/rbd/setup.py
> -@@ -135,7 +135,6 @@ def check_sanity():
> +@@ -135,19 +135,11 @@ def check_sanity():
>        finally:
>            shutil.rmtree(tmp_dir)
>    
>   -
> - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> -     ext_args = {}
> -     cython_constants = dict(BUILD_DOC=True)
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-    cythonize_args = dict(compile_time_env=cython_constants)
> +-elif check_sanity():
> +-    ext_args = get_python_flags(['rados', 'rbd'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> +-    cythonize_args = dict(compile_time_env=cython_constants,
> +-                          include_path=include_path)
> +-else:
> +-    sys.exit(1)
> ++ext_args = get_python_flags(['rados', 'rbd'])
> ++cython_constants = dict(BUILD_DOC=False)
> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> ++cythonize_args = dict(compile_time_env=cython_constants,
> ++                      include_path=include_path)
> +
> + cmdclass = {}
> + try:
>   diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
> -index 663604e8f..695038c0e 100755
> +index 663604e8f..489c9ba1f 100755
>   --- a/src/pybind/rgw/setup.py
>   +++ b/src/pybind/rgw/setup.py
> -@@ -135,7 +135,6 @@ def check_sanity():
> +@@ -135,19 +135,11 @@ def check_sanity():
>        finally:
>            shutil.rmtree(tmp_dir)
>    
>   -
> - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> -     ext_args = {}
> -     cython_constants = dict(BUILD_DOC=True)
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-    cythonize_args = dict(compile_time_env=cython_constants)
> +-elif check_sanity():
> +-    ext_args = get_python_flags(['rados', 'rgw'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> +-    cythonize_args = dict(compile_time_env=cython_constants,
> +-                          include_path=include_path)
> +-else:
> +-    sys.exit(1)
> ++ext_args = get_python_flags(['rados', 'rgw'])
> ++cython_constants = dict(BUILD_DOC=False)
> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> ++cythonize_args = dict(compile_time_env=cython_constants,
> ++                      include_path=include_path)
> +
> + cmdclass = {}
> + try:
> diff --git a/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> new file mode 100644
> index 0000000..2c9cd11
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> @@ -0,0 +1,31 @@
> +From ce36ce7d1c0f954d1532a759f4d7b09d87287dac Mon Sep 17 00:00:00 2001
> +From: Saul Wold <saul.wold@windriver.com>
> +Date: Thu, 22 Apr 2021 08:05:57 -0700
> +Subject: [PATCH] libcephsqlite: Add library soversion properties
> +
> +This additional properties are needed to ensure the library
> +is installed with an soversion so that when the library is
> +packaged it gets packaged corectly in the ceph package and
> +ceph-dev package as the link.
> +
> +Upstream-Status: pending
> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> +---
> + src/CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 37db48f86..8dc7bdb56 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -804,6 +804,10 @@ if(WITH_LIBCEPHSQLITE)
> +   set(cephsqlite_srcs libcephsqlite.cc SimpleRADOSStriper.cc)
> +   add_library(cephsqlite ${CEPH_SHARED} ${cephsqlite_srcs})
> +   target_link_libraries(cephsqlite PRIVATE cls_lock_client librados ceph-common SQLite3::SQLite3 ${EXTRALIBS})
> ++  set_target_properties(cephsqlite PROPERTIES
> ++    OUTPUT_NAME cephsqlite
> ++    VERSION 1.0.0
> ++    SOVERSION 1)
> +   install(TARGETS cephsqlite DESTINATION ${CMAKE_INSTALL_LIBDIR})
> + endif(WITH_LIBCEPHSQLITE)
> +
> diff --git a/recipes-extended/ceph/ceph_16.2.0.bb b/recipes-extended/ceph/ceph_16.2.0.bb
> index 806a03f..d55e602 100644
> --- a/recipes-extended/ceph/ceph_16.2.0.bb
> +++ b/recipes-extended/ceph/ceph_16.2.0.bb
> @@ -58,7 +58,9 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24
>                       file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://COPYING;md5=d140fb1fedb53047f0d0830883e7af9f \
>                       "
> -inherit cmake python3native python3-dir systemd
> +#inherit cmake setuptools3 systemd
> +inherit cmake distutils3-base systemd
> +
>   # Disable python pybind support for ceph temporary, when corss compiling pybind,
>   # pybind mix cmake and python setup environment, would case a lot of errors.
>   
> @@ -66,14 +68,9 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>              file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>              file://0001-fix-host-library-paths-were-used.patch \
>              file://ceph.conf \
> +           file://0001-libcephsqlite-Add-library-soversion-properties.patch \
>              "
>   
> -#SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> -#SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> -#SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> -#SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> -#SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
> -SRC_URI[sha256sum] = "dfeee542536607220dc2ca49f47c41127c8562dea234a886625e0f7ee1524904"
>   SRC_URI[sha1sum] = "f8cc85e4cc519d7e469a0c3c8327bd1675f0b287"
>   SRC_URI[sha384sum] = "29a75a733e5ae8039a5ad603558a9707e36b8c337419039ee97351cdbad57875fa57a365fcde29124cee72734608e245"
>   SRC_URI[sha512sum] = "aeb9a91c33221c64ea24603dc88cab346bf0abdf0d41ff85c2e1cf134130737ec1fab1246be0a2fa3af8a655ae1dabb69688855f229f54438e60cb8098175b8e"
> @@ -149,6 +146,13 @@ do_install_append () {
>   	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
>   	# WITH_FUSE is set to OFF, remove ceph-fuse related units
>   	rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
> +
> +	for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> +		if [ -f "$i" ]; then
> +			sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
> +			sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> +		fi
> +	done
>   }
>   
>   do_install_append_class-target () {
> @@ -173,7 +177,8 @@ FILES_${PN} += "\
>   		${libdir}/rados-classes/*.so.* \
>   		${libdir}/ceph/compressor/*.so \
>   		${libdir}/rados-classes/*.so \
> -		${libdir}/ceph/*.so \
> +	 	${libdir}/ceph/*.so \
> +                ${libdir}/libcephsqlite.so \
>   "
>   
>   FILES_${PN} += " \
> @@ -190,6 +195,7 @@ RDEPENDS_${PN} += "\
>   		python3-modules \
>   		python3-prettytable \
>   		${PN}-python \
> +                gawk \
>   "
>   COMPATIBLE_HOST = "(x86_64).*"
>   PACKAGES += " \
> 
> 
> 
> 
> 

-- 
Sau!
