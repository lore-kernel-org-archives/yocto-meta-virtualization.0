Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.58])
 by mx.groups.io with SMTP id smtpd.web10.4608.1617787424823773472
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 02:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=j6Ppa/2L;
 spf=pass (domain: windriver.com, ip: 40.107.77.58, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWsQSj3dkXPbjVcjk6cgRiyzPOzxMSEbN8t0QXVRgltoWB07f7JDZ0vh3/UFFS95H4LavWA/2qmSbJ+mK7M1EGOkW8UzyRJbxv9OdgfZATUrL8+Ja21VYwfTPa8F6RHllqap7BV0c4POJF6CYafeL9CsS3dVIH6QjV6cHDlmk6XYo++FxreCmcjIEjq3wYuM5GQhuZs5m6bbMrKh3WyK0dl8SMMhsZ0v7ep2hMDH9X1Mp90/VmcSRDN1dG4Ohq4aDymAc2bOsveGTRR2M+xqjDlbpbqmS86288cpzdDd6VtnOkhAeH1bbz5Zi4kJl5E5vMl2HAphunzQ2p99NtBUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CksJdX0U9HtZAyKZ04kVcl0q+20FSxtBsGdhPkbs9w=;
 b=ChNpgD2h5RK3SQH/PAefLnnXgpK3vPw3TjQ2ct0himkA2KRTBpAh8xPBmyJd5k1IwW2LhqPmb6O0c3KFPZmQUdDbQxSV5KWDOfPKFJ1WNjOupdBrOLoGtBbnjZYpLKany7yU8ZPpCxPKS7EtAwBNF6ovGh/QPaw6gFnH85oL1y9/brRrhhvRautKB3x0y9O8nfi4R7R38CYq7HxNzOY2Q2yMEEhlT9TC0tb9yMUdiR0KzIQKIdofXhiOaxyUm7UpaVcngyXx2u56O7HczsXExZhqr4AJmEQ1uSThJG6rCt39on8Gs20+UKXCRtM/FsyI7VFqNIRpEJRWJggEiGjkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CksJdX0U9HtZAyKZ04kVcl0q+20FSxtBsGdhPkbs9w=;
 b=j6Ppa/2LB+EvVgnqFehGhXXZ8X+hKjtXMwiOsJnDf8FfbbWIb7xlAMUdGCStPIfl89j17EZ8REgaE1w6FICq4YlKvQ+AbLuGZ1ZcfoebrPi9Cw9Q5QdP4PBYCLf6kflI6kNyitEAeN0V+gwmVKKBVyCDa10uv6mgGIqMzXNWn4Y=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 09:23:41 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 09:23:40 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: uprev v6.3 -> v7.2
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210402100531.1044353-1-yanfei.xu@windriver.com>
 <20210407003557.GB25009@gmail.com>
Message-ID: <633f30ee-fcbf-a96b-0b67-968ef9031354@windriver.com>
Date: Wed, 7 Apr 2021 17:23:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210407003557.GB25009@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.3 via Frontend Transport; Wed, 7 Apr 2021 09:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e2cfaef-8572-40ef-f229-08d8f9a6d4ad
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38958DCECCFA910BAE75511BE4759@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W8/50oj/5N3JAXa8hlfK4CcB/9O319EFktYwEZKuMXGnKrLU+NjETBsUJwC4IqlNPRL7u50BfZzefCBBQXGKmxXuovBK0saBMlTQK6XR4tACO0K+yZkFq1dWozvN/8LJtfte932CshGHY/BPosJ8Ko/Wbr4qucXwecSFQQ4kN+C4OJolIztcO5z5C9cB4/lTISwi5aOB1n74/vHUVhFqhuHLYFt73QqnAFYNldYa3e4flp2EJdl2JqtIc7/+rXHh9R8we8aJ0wk6fdkrMzGe4vDZTvkcm8FWiMMEQAwQBt6vXaYEWbs75N6NuYOP4AOdeXtI2/YZH/6dk0DADaXKhnuBMvSVNLe7AE9AFyh/2X8MvOFu4tWZKdwfJHtLCgCi6raxbdMQnLnP1+LANvz55ApqzjGsuf6E6Z+8VOeyoMy0uIlXwXT5+8tIRDFVaAkZzwgQlq/MAH03h3X4vEY5sseTGbHAg5l7pggCPM5EB2UYkIvKYWsDH5iQuNi8QISiJMmo+0lG2vB2RoRp/5rS/H4298DswBsMjE1nyHY0zxxh+PtyI/GdmHRyTBjZLLcVfhTvck82L+RzxKvNyTz90bQ75LV0SMQSuiMyVFX62fglSgpL6THOPM4lFaeQUWqKM4z16MKc74jR37fgKHuIXloAZT86epaTBpiaSbKZ/k7kWoR1y/q2QtN4eg+e24HQGyqlpwcV3FfkkdAqwIOJobfp0VrewJ1J11fGdVvWfuV7mvRu/WpOh8UIyYqbW8/8LpxKdZRTO7eJIqgS6+rp6FwVks4QX85TrJ6XJ2pBW9w73KbXMxRfGkAk81h4G+nDJiESbbNcegk1JGyFPvtYKV264Dg9CnU/RxVsS5UsF4AC3q0JbOzmKn1qAj1B58XP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(4326008)(31696002)(83380400001)(66476007)(66946007)(2616005)(66556008)(6916009)(30864003)(52116002)(38350700001)(53546011)(31686004)(86362001)(956004)(6706004)(16526019)(36756003)(966005)(26005)(2906002)(478600001)(316002)(8676002)(38100700001)(5660300002)(16576012)(186003)(6666004)(6486002)(8936002)(21314003)(78286007)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VUxRWFJIaVlwR3hFRWJ3REErc2ZUc0xyVzRnMVdPUjh4NXFjV3NFVVNSM1Q3?=
 =?utf-8?B?c2k2OWRFWEM5Nko0VXhqOXRWVE04RmsxUUlYMSt6MktaK3hTU1pra3J3SUQz?=
 =?utf-8?B?THN5QXVXMHYrNHpFdVd1WEpYT012dWpTV2phNnh1d1JaVXE4SFBJK2trbEtw?=
 =?utf-8?B?T3Vzc0wvSUZFYWJ6UWtjOU9aMHBpaXd3VHQ0aEl2RjVLSmlXcHN5clpSWWxk?=
 =?utf-8?B?WUVhZEM4dFNZRG44aGJnblZHT2lzK0htVTVkeS9ONlZTZ3UyOW03M0xqVUFw?=
 =?utf-8?B?Wmk3WlBiTVp2Z25aOEZPcjVTR0hoSUhpenMvUEQ1TXEyWkVucjM5TG40dENH?=
 =?utf-8?B?ZHdNaWEzQmk5Z2FXVklRdUFRM2lMbW9kWVgyNzdtOTVodnFlYTVIMUJPU1Nw?=
 =?utf-8?B?UVUxSC9kZ1pqYk1GNUtHMGJHZjRqcmxjT1NpSDM0YWVoamdWTXlVQUl2UFdo?=
 =?utf-8?B?WWdoaXBiOGZjWTIyaXdTSGFaaWJiNzl4Ukhwb2VJNzVSSUJER0FnSmVTemlq?=
 =?utf-8?B?YXNienRQU241MUpuemFDTjM4WDlQa0hUQ2dvcVk5R2IvN1JQQlM0SVJIZW1U?=
 =?utf-8?B?V1BEMEdZM2tIY2hpb2VTcjhaZjJmaGVEWlVySXlWQTdvSFBPQkpqem1naFhZ?=
 =?utf-8?B?aituNWlxM0xMcWJYYWlOMjZsUlBwUnRZa2tjSHNCTzJSVHZqNDMxQ0E4YStq?=
 =?utf-8?B?K1RrZnhiMlNzZWV4UXZmM21kOVdDcmhYN2RYN2ZwTXh5Ykl0QlFvNTRZR3pY?=
 =?utf-8?B?YnVKZHNKdktjQ0FTRHgwZTN6NXE3ZWhoNjBwMm83SHhzOWt5UVVkNW56QmFl?=
 =?utf-8?B?S21ZVFBlS2QzdDNKbjB2b0dvNFg1Vm1kUVM1UDJyQm1SUXRNRDJhY2FEZHQz?=
 =?utf-8?B?NnNHZlk5ZXlabGpSTEdGV1IrMCtEa3lUc3ZrV2VWcFAvVitKL2F1cjkySmw2?=
 =?utf-8?B?WlFnVTIvbEg0azlIenE4UzE5bGhkSEZTR3lwc2VocUNkVmJUVGMwYzludDBO?=
 =?utf-8?B?VGNiRTZxdmx3Qk0wY2JTa1BPTHc3RDhjN0x3MUJDdVNoV1dvRlhzU2M4L3Ny?=
 =?utf-8?B?T0RyeTRvV1lOb0RaNC9MTUlWbmNHdEJOSitXWDh6RytGaVRVcmpWY3dtdlc2?=
 =?utf-8?B?MThNc3lIR0JXRXZNVUdvMjJxTCtKODNZZ3BURVNzbUNKYURyYUhCWTBnY0NI?=
 =?utf-8?B?bjV1UHpZWVZERXp2NkpIWUF6ME1SRmcyY3crS0JVZDE1ajhwMmwxSGZsV1RP?=
 =?utf-8?B?RG1vdmVoME1xZkVGeHd4QnorT2FiMGV0c1kwRE81NHN5T2NiZzF3cVRLaTM2?=
 =?utf-8?B?RWR5ejE2NmdhTUhmbUdiNEdqMHRudUlXUi9NUFFVbWFmK0pBeC9MK3VoZnZa?=
 =?utf-8?B?WXZtYkdEdHpyM2NlT1BSd0FRZWFhVk5LSEsrRWlwL0xKUC9nUUJ1YnY0b2FV?=
 =?utf-8?B?T1dCRVA3MXBUR2RFY1VqUE9BYVlFUVpNMmFpeUhXa1JMa2RQRkFVWUxla3lt?=
 =?utf-8?B?WkZjd01Zc1psYmxBZHl1K0VyU2dNY3JtZGFrNzl6QWppc2EvNGZNMWdWaHZS?=
 =?utf-8?B?YjRtTHhjQitGcmxXTzJTb2VtdC9hYitkM0Q0c0JZS2xZS3VKOGFVT1Z1VHk4?=
 =?utf-8?B?aXBIV3JnVTJKdTNFdWNEbklkZ2wzdUc3VDFTbWlOdTR1MVBHVFZ6aGtja2sx?=
 =?utf-8?B?eFo1c2h5R3Vka0FyNDJLVEs0QUt2UHpabFNKeStBTkl6dEhDSGdiMjk4MUtl?=
 =?utf-8?Q?uU1Iu1MsiiHgld3Obvhwsz0qafpghbtpCDF7Zyz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2cfaef-8572-40ef-f229-08d8f9a6d4ad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 09:23:40.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ovMhBbEdL75B3RI/iSaLQ4hKluhJxuUiOry3E1BrJhgu8FEKaZc1Px3opIXTaDenrUlvXwAcwU0hr0JRyIpvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/7/21 8:35 AM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> In message: [meta-virtualization][PATCH] libvirt: uprev v6.3 -> v7.2
> on 02/04/2021 Xu, Yanfei wrote:
> 
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> This upgrade spans 9 small release. The detailed realese logs could
>> refer to: https://gitlab.com/libvirt/libvirt/-/blob/master/NEWS.rst
>>
>> Libvirt's buildsystem has changed to meson, So this upgrade drop some
>> obsolete patches applied to makefile.
>>
>> Due to libvirt's meson currently doesn't support to explicit the runtime
>> binaries path. I made a patch which is
>> 0001-meson-add-options-to-explicit-binaries-path.patch for solving the
>> problem.
> 
> We've tranditionally had runtime issues each time libvirt was
> uprev'd.

Yes. I saw there were some ancient patches...

> 
> Can you summarize the testing that you did after the upgrade ?

OK. I did the testing with our libvirt testcase and ovs testcase.
The summary is as follow:

libvirt_test (keyword: ) test results:
*1 Run libvirt_test testing(do_test1)                          PASS
*2 Check result (virsh_local_capabilities)                     PASS
*3 Check result (virsh_local_domcapabilities)                  PASS
*4 Check result (virsh_local_freecell)                         PASS
*5 Check result (virsh_local_help)                             PASS
*6 Check result (virsh_local_hostname)                         PASS
*7 Check result (virsh_local_iface-begin)                      PASS
*8 Check result (virsh_local_iface-commit)                     PASS
*9 Check result (virsh_local_iface-list)                       PASS
*10 Check result (virsh_local_list)                            PASS
*11 Check result (virsh_local_maxvcpus)                        PASS
*12 Check result (virsh_local_net-list)                        PASS
*13 Check result (virsh_local_nodecpumap)                      PASS
*14 Check result (virsh_local_nodecpustats)                    PASS
*15 Check result (virsh_local_nodedev-list)                    PASS
*16 Check result (virsh_local_nodeinfo)                        PASS
*17 Check result (virsh_local_node-memory-tune)                PASS
*18 Check result (virsh_local_nodememstats)                    PASS
*19 Check result (virsh_local_nwfilter-binding-list)           PASS
*20 Check result (virsh_local_nwfilter-list)                   PASS
*21 Check result (virsh_local_pool-capabilities)               PASS
*22 Check result (virsh_local_pool-list)                       PASS
*23 Check result (virsh_local_pwd)                             PASS
*24 Check result (virsh_local_secret-list)                     PASS
*25 Check result (virsh_local_sysinfo)                         PASS
*26 Check result (virsh_local_uri)                             PASS
*27 Check result (virsh_local_version)                         PASS

openvswitch_vm2vm (keyword: qemux86) test results:
*1 openvswitch_vm2vm testing(do_test1)                         PASS
*2 Check result (ovs_vm2vm_boot_guest1)                        PASS
*3 Check result (ovs_vm2vm_boot_guest2)                        PASS
*4 Check result (ovs_vm2vm_netperf_test)                       PASS
*5 Check result (ovs_vm2vm_destroy_guest1)                     PASS
*6 Check result (ovs_vm2vm_destroy_guest2)                     PASS
*7 check testcase call trace(do_check_call_trace)              PASS

Thanks,
Yanfei

> 
> Bruce
> 
>>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   recipes-extended/libvirt/libvirt-python.inc   |   4 +-
>>   ...drop-unnecessary-libgnu.la-reference.patch |  31 ----
>>   ...dd-options-to-explicit-binaries-path.patch |  86 ++++++++++
>>   .../libvirt/0001-to-fix-build-error.patch     |  47 -----
>>   ...-search-for-rpc-rpc.h-in-the-sysroot.patch |  34 ----
>>   .../libvirt/install-missing-file.patch        |  50 ------
>>   ...read-safety-in-lxc-callback-handling.patch |  63 -------
>>   ...virt-use-pkg-config-to-locate-libcap.patch |  43 -----
>>   .../libvirt/qemu-fix-crash-in-qemuOpen.patch  |  39 -----
>>   .../libvirt/libvirt/runptest.patch            | 116 -------------
>>   ...t-net-rpc-to-virt-host-validate-when.patch |  91 ----------
>>   .../{libvirt_6.3.0.bb => libvirt_7.2.0.bb}    | 161 ++++++------------
>>   12 files changed, 141 insertions(+), 624 deletions(-)
>>   delete mode 100644 recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch
>>   create mode 100644 recipes-extended/libvirt/libvirt/0001-meson-add-options-to-explicit-binaries-path.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/install-missing-file.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/runptest.patch
>>   delete mode 100644 recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
>>   rename recipes-extended/libvirt/{libvirt_6.3.0.bb => libvirt_7.2.0.bb} (69%)
>>
>> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
>> index bcd76572..0c661af8 100644
>> --- a/recipes-extended/libvirt/libvirt-python.inc
>> +++ b/recipes-extended/libvirt/libvirt-python.inc
>> @@ -17,8 +17,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>>
>>   SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>>
>> -SRC_URI[libvirt_python.md5sum] = "4cf898350ee9a47f94986d402c153bdb"
>> -SRC_URI[libvirt_python.sha256sum] = "c772421ecc144f098f4ab15db700c62db9b9e6e76b876217edcfd62e9ce02750"
>> +SRC_URI[libvirt_python.md5sum] = "19bf22414a43d358581b9259b52047a7"
>> +SRC_URI[libvirt_python.sha256sum] = "c0c3bac54c55622e17927b09cd9843869600d71842fb072c99491fe2608dcee7"
>>
>>   export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>>   export LIBVIRT_CFLAGS = "-I${S}/include"
>> diff --git a/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch b/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch
>> deleted file mode 100644
>> index f02a5d64..00000000
>> --- a/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From 30a056069cb35804434fb036e51ae97f33c02025 Mon Sep 17 00:00:00 2001
>> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> -Date: Sat, 7 Mar 2020 21:36:27 -0500
>> -Subject: [PATCH] build: drop unnecessary libgnu.la reference
>> -
>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> -
>> ----
>> - tools/Makefile.am | 2 --
>> - 1 file changed, 2 deletions(-)
>> -
>> -diff --git a/tools/Makefile.am b/tools/Makefile.am
>> -index 2a0a989..93fe283 100644
>> ---- a/tools/Makefile.am
>> -+++ b/tools/Makefile.am
>> -@@ -168,7 +168,6 @@ virt_host_validate_LDADD = \
>> -
>> - if WITH_GNUTLS
>> - virt_host_validate_LDADD += ../src/libvirt-net-rpc.la \
>> --                            ../gnulib/lib/libgnu.la   \
>> -                             $(NULL)
>> - endif
>> -
>> -@@ -270,7 +269,6 @@ BUILT_SOURCES =
>> -
>> - if WITH_GNUTLS
>> - virsh_LDADD += ../src/libvirt-net-rpc.la \
>> --               ../gnulib/lib/libgnu.la   \
>> -                $(NULL)
>> - endif
>> -
>> diff --git a/recipes-extended/libvirt/libvirt/0001-meson-add-options-to-explicit-binaries-path.patch b/recipes-extended/libvirt/libvirt/0001-meson-add-options-to-explicit-binaries-path.patch
>> new file mode 100644
>> index 00000000..4c545d4a
>> --- /dev/null
>> +++ b/recipes-extended/libvirt/libvirt/0001-meson-add-options-to-explicit-binaries-path.patch
>> @@ -0,0 +1,86 @@
>> +From 2e061ccf093063267277893cd5cacc9e7188c629 Mon Sep 17 00:00:00 2001
>> +From: Yanfei Xu <yanfei.xu@windriver.com>
>> +Date: Thu, 25 Mar 2021 16:24:04 +0800
>> +Subject: [PATCH] meson: add options to explicit binaries path
>> +
>> +In cross compile evironment, path of binaries is possiblely different
>> +between target and host. Let's add options to explicit binaries path
>> +to solve this problem.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> +---
>> + meson.build       | 18 ++++++++++++------
>> + meson_options.txt | 23 +++++++++++++++++++++++
>> + 2 files changed, 35 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 369548f127..6c93be8e4b 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -943,18 +943,24 @@ optional_programs = [
>> +   'udevadm',
>> + ]
>> +
>> ++# if -Dxxx-path option is found, use that. Otherwise, check in $PATH,
>> ++# /usr/sbin, /sbin, and fall back to the default from middle column.
>> + foreach name : optional_programs
>> +-  prog = find_program(name, required: false, dirs: libvirt_sbin_path)
>> +   varname = name.underscorify()
>> +-  if prog.found()
>> +-    prog_path = prog.path()
>> ++  prog_path = get_option(name + '-path')
>> ++  if prog_path != ''
>> ++    message('Using @1@ for @0@'.format(name, prog_path))
>> +   else
>> +-    prog_path = name
>> ++    prog = find_program(name, required: false, dirs: libvirt_sbin_path)
>> ++    if prog.found()
>> ++      prog_path = prog.path()
>> ++    else
>> ++      prog_path = name
>> ++    endif
>> ++  set_variable('@0@_prog'.format(varname), prog)
>> +   endif
>> +-
>> +   conf.set_quoted(varname.to_upper(), prog_path)
>> +   conf.set_quoted('@0@_PATH'.format(varname.to_upper()), prog_path)
>> +-  set_variable('@0@_prog'.format(varname), prog)
>> + endforeach
>> +
>> +
>> +diff --git a/meson_options.txt b/meson_options.txt
>> +index e5d79c2b6b..f06f46c7bb 100644
>> +--- a/meson_options.txt
>> ++++ b/meson_options.txt
>> +@@ -102,3 +102,26 @@ option('numad', type: 'feature', value: 'auto', description: 'use numad to manag
>> + option('pm_utils', type: 'feature', value: 'auto', description: 'use pm-utils for power management')
>> + option('sysctl_config', type: 'feature', value: 'auto', description: 'Whether to install sysctl configs')
>> + option('tls_priority', type: 'string', value: 'NORMAL', description: 'set the default TLS session priority string')
>> ++
>> ++
>> ++option('addr2line-path', type : 'string', description : 'path to addr2line')
>> ++option('augparse-path', type : 'string', description : 'path to augparse')
>> ++option('dmidecode-path', type : 'string', description : 'path to dmidecode')
>> ++option('dnsmasq-path', type : 'string', description : 'path to dnsmasq')
>> ++option('ebtables-path', type : 'string', description : 'path to ebtables')
>> ++option('flake8-path', type : 'string', description : 'path to flake8')
>> ++option('ip-path', type : 'string', description : 'path to ip')
>> ++option('ip6tables-path', type : 'string', description : 'path to ip6tables')
>> ++option('iptables-path', type : 'string', description : 'path to iptables')
>> ++option('iscsiadm-path', type : 'string', description : 'path to iscsiadm')
>> ++option('mdevctl-path', type : 'string', description : 'path to mdevctl')
>> ++option('mm-ctl-path', type : 'string', description : 'path to mm-ctl')
>> ++option('modprobe-path', type : 'string', description : 'path to modprobe')
>> ++option('ovs-vsctl-path', type : 'string', description : 'path to ovs-vsctl')
>> ++option('pdwtags-path', type : 'string', description : 'path to pdwtags')
>> ++option('radvd-path', type : 'string', description : 'path to radvd')
>> ++option('rmmod-path', type : 'string', description : 'path to rmmod')
>> ++option('scrub-path', type : 'string', description : 'path to scrub')
>> ++option('tc-path', type : 'string', description : 'path to tc')
>> ++option('udevadm-path', type : 'string', description : 'path to udevadm')
>> ++
>> +--
>> +2.27.0
>> +
>> diff --git a/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
>> deleted file mode 100644
>> index b0148e5c..00000000
>> --- a/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -From 3566bcacaa6408fb8f655d1749a20b2f30e0c765 Mon Sep 17 00:00:00 2001
>> -From: Lei Maohui <leimaohui@cn.fujitsu.com>
>> -Date: Fri, 31 Jul 2015 03:17:07 +0900
>> -Subject: [PATCH] to fix build error
>> -
>> -The error likes as following
>> -
>> -| Generating internals/command.html.tmp
>> -| /bin/sh: line 3: internals/command.html.tmp: No such file or directory
>> -| rm: Generating internals/locking.html.tmp
>> -| cannot remove `internals/command.html.tmp': No such file or directory
>> -| make[3]: *** [internals/command.html.tmp] Error 1
>> -| make[3]: *** Waiting for unfinished jobs....
>> -
>> -Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>> -[ywei: rebased to libvirt-1.3.2]
>> -Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>> -[MA: rebase to v4.3.0]
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -
>> ----
>> - docs/Makefile.am | 5 ++---
>> - 1 file changed, 2 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/docs/Makefile.am b/docs/Makefile.am
>> -index ce3d296..2c8180f 100644
>> ---- a/docs/Makefile.am
>> -+++ b/docs/Makefile.am
>> -@@ -366,7 +366,7 @@ EXTRA_DIST= \
>> -   aclperms.htmlinc \
>> -   $(schema_DATA)
>> -
>> --acl_generated = aclperms.htmlinc
>> -+acl.html:: $(srcdir)/aclperms.htmlinc
>> -
>> - aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
>> -         $(top_srcdir)/scripts/genaclperms.py Makefile.am
>> -@@ -432,8 +432,7 @@ manpages/%.html.in: manpages/%.rst
>> -     $(AM_V_GEN)$(MKDIR_P) `dirname $@` && \
>> -       $(RST2HTML) --strict $< > $@ || { rm $@ && exit 1; }
>> -
>> --%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl \
>> --            $(acl_generated)
>> -+%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl
>> -     $(AM_V_GEN)name=`echo $@ | sed -e 's/.tmp//'`; \
>> -       genhtmlin=`echo $@ | sed -e 's/.tmp/.in/'`; \
>> -       rst=`echo $@ | sed -e 's/.html.tmp/.rst/'`; \
>> diff --git a/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch b/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
>> deleted file mode 100644
>> index 395d5610..00000000
>> --- a/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From 79f5975db01af0599860ccca7ef44b0e27105a04 Mon Sep 17 00:00:00 2001
>> -From: Mark Asselstine <mark.asselstine@windriver.com>
>> -Date: Thu, 10 May 2018 12:05:04 -0400
>> -Subject: [PATCH] configure.ac: search for rpc/rpc.h in the sysroot
>> -
>> -We want to avoid host contamination and use the sysroot as the base
>> -directory for our search so add the '=' the the '-I' when searching
>> -for libtirpc's rpc.h header.
>> -
>> -Upstream-Status: Inappropriate [old release]
>> -
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -
>> ----
>> - m4/virt-xdr.m4 | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/m4/virt-xdr.m4 b/m4/virt-xdr.m4
>> -index 8375415..12b51f7 100644
>> ---- a/m4/virt-xdr.m4
>> -+++ b/m4/virt-xdr.m4
>> -@@ -30,10 +30,10 @@ AC_DEFUN([LIBVIRT_CHECK_XDR], [
>> -     ])
>> -     with_xdr="yes"
>> -
>> --    dnl Recent glibc requires -I/usr/include/tirpc for <rpc/rpc.h>
>> -+    dnl Recent glibc requires -I=/usr/include/tirpc for <rpc/rpc.h>
>> -     old_CFLAGS=$CFLAGS
>> -     AC_CACHE_CHECK([where to find <rpc/rpc.h>], [lv_cv_xdr_cflags], [
>> --      for add_CFLAGS in '' '-I/usr/include/tirpc' 'missing'; do
>> -+      for add_CFLAGS in '' '-I=/usr/include/tirpc' 'missing'; do
>> -         if test x"$add_CFLAGS" = xmissing; then
>> -           lv_cv_xdr_cflags=missing; break
>> -         fi
>> diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/recipes-extended/libvirt/libvirt/install-missing-file.patch
>> deleted file mode 100644
>> index 6aa36df8..00000000
>> --- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
>> +++ /dev/null
>> @@ -1,50 +0,0 @@
>> -From aa75f5136066d239d48a21373b3d96ee12378e8d Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Wed, 8 May 2019 17:24:17 +0800
>> -Subject: [PATCH] Install missing conf file
>> -
>> -openvzutilstest.conf file is needed by openvzutilstest test.
>> -
>> -Upstream-Status: Inapproriate
>> -
>> -Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
>> -[KK: Update context for 1.3.5.]
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> -[MA: Update context for v4.3.0]
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -[DDU: Update context for v5.3.0]
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> -
>> ----
>> - tests/Makefile.am | 4 +++-
>> - 1 file changed, 3 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/tests/Makefile.am b/tests/Makefile.am
>> -index 4a808dd..0c3e799 100644
>> ---- a/tests/Makefile.am
>> -+++ b/tests/Makefile.am
>> -@@ -173,6 +173,7 @@ EXTRA_DIST = \
>> -     $(NULL)
>> -
>> - test_helpers = commandhelper ssh
>> -+test_misc =
>> - test_programs = virshtest sockettest \
>> -     virhostcputest virbuftest \
>> -     commandtest seclabeltest \
>> -@@ -311,6 +312,7 @@ endif WITH_LXC
>> -
>> - if WITH_OPENVZ
>> - test_programs += openvzutilstest
>> -+test_misc += openvzutilstest.conf
>> - endif WITH_OPENVZ
>> -
>> - if WITH_ESX
>> -@@ -1551,7 +1553,7 @@ endif  ! WITH_LINUX
>> -
>> - buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
>> -
>> --PTESTS = $(TESTS) $(test_helpers) test-lib.sh virschematest
>> -+PTESTS = $(TESTS) $(test_helpers) $(test_misc) test-lib.sh virschematest
>> -
>> - install-ptest:
>> -     list='$(TESTS) $(test_helpers) test-lib.sh virschematest'
>> diff --git a/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch b/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
>> deleted file mode 100644
>> index 558d5ef6..00000000
>> --- a/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
>> +++ /dev/null
>> @@ -1,63 +0,0 @@
>> -From ad5d9cee87357f9f38f62583119606ef95ba10df Mon Sep 17 00:00:00 2001
>> -From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
>> -Date: Fri, 24 May 2013 16:46:00 +0300
>> -Subject: [PATCH] Fix thread safety in LXC callback handling
>> -
>> -Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
>> ----
>> - src/lxc/lxc_process.c | 18 +++++++++++++++++-
>> - 1 file changed, 17 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/src/lxc/lxc_process.c b/src/lxc/lxc_process.c
>> -index aaa81a7..0eadc67 100644
>> ---- a/src/lxc/lxc_process.c
>> -+++ b/src/lxc/lxc_process.c
>> -@@ -609,8 +609,13 @@ static void virLXCProcessMonitorExitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
>> -                                            virLXCProtocolExitStatus status,
>> -                                            virDomainObjPtr vm)
>> - {
>> -+    virLXCDriverPtr driver = lxc_driver;
>> -     virLXCDomainObjPrivatePtr priv = vm->privateData;
>> -
>> -+    lxcDriverLock(driver);
>> -+    virObjectLock(vm);
>> -+    lxcDriverUnlock(driver);
>> -+
>> -     switch (status) {
>> -     case VIR_LXC_PROTOCOL_EXIT_STATUS_SHUTDOWN:
>> -         priv->stopReason = VIR_DOMAIN_EVENT_STOPPED_SHUTDOWN;
>> -@@ -628,6 +633,8 @@ static void virLXCProcessMonitorExitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
>> -     }
>> -     VIR_DEBUG("Domain shutoff reason %d (from status %d)",
>> -               priv->stopReason, status);
>> -+
>> -+    virObjectUnlock(vm);
>> - }
>> -
>> - /* XXX a little evil */
>> -@@ -636,12 +643,21 @@ static void virLXCProcessMonitorInitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
>> -                                            pid_t initpid,
>> -                                            virDomainObjPtr vm)
>> - {
>> --    virLXCDomainObjPrivatePtr priv = vm->privateData;
>> -+    virLXCDriverPtr driver = lxc_driver;
>> -+    virLXCDomainObjPrivatePtr priv;
>> -+
>> -+    lxcDriverLock(driver);
>> -+    virObjectLock(vm);
>> -+    lxcDriverUnlock(driver);
>> -+
>> -+    priv = vm->privateData;
>> -     priv->initpid = initpid;
>> -     virDomainAuditInit(vm, initpid);
>> -
>> -     if (virDomainSaveStatus(lxc_driver->caps, lxc_driver->stateDir, vm) < 0)
>> -         VIR_WARN("Cannot update XML with PID for LXC %s", vm->def->name);
>> -+
>> -+    virObjectUnlock(vm);
>> - }
>> -
>> - static virLXCMonitorCallbacks monitorCallbacks = {
>> ---
>> -1.7.11.7
>> -
>> diff --git a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
>> deleted file mode 100644
>> index 87b55915..00000000
>> --- a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From 94bd514e1b6e602a48285db94e65050f8f0c2585 Mon Sep 17 00:00:00 2001
>> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
>> -Date: Wed, 8 Apr 2015 13:03:03 -0400
>> -Subject: [PATCH] libvirt: use pkg-config to locate libcap
>> -
>> -libvirt wants to use pcap-config to locate the exisence and location
>> -of libpcap. oe-core stubs this script and replaces it with pkg-config,
>> -which can lead to the host pcap-config triggering and either breaking
>> -the build or introducing host contamination.
>> -
>> -To fix this issue, we patch configure to use 'pkg-config libcap' to
>> -locate the correct libraries.
>> -
>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> -[MA: Update to apply agains v4.3.0]
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -
>> ----
>> - m4/virt-libpcap.m4 | 6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/m4/virt-libpcap.m4 b/m4/virt-libpcap.m4
>> -index 605c2fd..e0ab018 100644
>> ---- a/m4/virt-libpcap.m4
>> -+++ b/m4/virt-libpcap.m4
>> -@@ -23,14 +23,14 @@ AC_DEFUN([LIBVIRT_ARG_LIBPCAP], [
>> -
>> - AC_DEFUN([LIBVIRT_CHECK_LIBPCAP], [
>> -   LIBPCAP_REQUIRED="1.5.0"
>> --  LIBPCAP_CONFIG="pcap-config"
>> -+  LIBPCAP_CONFIG="pkg-config libpcap"
>> -   LIBPCAP_CFLAGS=""
>> -   LIBPCAP_LIBS=""
>> -
>> -   if test "x$with_libpcap" != "xno"; then
>> -     case $with_libpcap in
>> --      ''|yes|check) LIBPCAP_CONFIG="pcap-config" ;;
>> --      *)      LIBPCAP_CONFIG="$with_libpcap/bin/pcap-config" ;;
>> -+      ''|yes|check) LIBPCAP_CONFIG="pkg-config libpcap" ;;
>> -+      *)      LIBPCAP_CONFIG="$with_libpcap/bin/pkg-config libpcap" ;;
>> -     esac
>> -     AS_IF([test "x$LIBPCAP_CONFIG" != "x"], [
>> -       AC_MSG_CHECKING(libpcap $LIBPCAP_CONFIG >= $LIBPCAP_REQUIRED )
>> diff --git a/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch b/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
>> deleted file mode 100644
>> index 3cf9e839..00000000
>> --- a/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From 74bff2509080912ea8abf1de8fd95fa2412b659a Mon Sep 17 00:00:00 2001
>> -From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
>> -Date: Thu, 11 Apr 2013 11:37:25 +0200
>> -Subject: [PATCH] qemu: fix crash in qemuOpen
>> -
>> -commit 74bff2509080912ea8abf1de8fd95fa2412b659a from upsteam
>> -git://libvirt.org/libvirt.git
>> -
>> -If the path part of connection URI is not present, cfg is used
>> -unitialized.
>> -
>> -https://bugzilla.redhat.com/show_bug.cgi?id=950855
>> ----
>> - src/qemu/qemu_driver.c |    2 +-
>> - 1 files changed, 1 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
>> -index 2c0d7d1..0d41e39 100644
>> ---- a/src/qemu/qemu_driver.c
>> -+++ b/src/qemu/qemu_driver.c
>> -@@ -1026,6 +1026,7 @@ static virDrvOpenStatus qemuOpen(virConnectPtr conn,
>> -             goto cleanup;
>> -         }
>> -
>> -+        cfg = virQEMUDriverGetConfig(qemu_driver);
>> -         if (conn->uri->path == NULL) {
>> -             virReportError(VIR_ERR_INTERNAL_ERROR,
>> -                            _("no QEMU URI path given, try %s"),
>> -@@ -1033,7 +1034,6 @@ static virDrvOpenStatus qemuOpen(virConnectPtr conn,
>> -             goto cleanup;
>> -         }
>> -
>> --        cfg = virQEMUDriverGetConfig(qemu_driver);
>> -         if (cfg->privileged) {
>> -             if (STRNEQ(conn->uri->path, "/system") &&
>> -                 STRNEQ(conn->uri->path, "/session")) {
>> ---
>> -1.7.1
>> -
>> diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
>> deleted file mode 100644
>> index f6bc7736..00000000
>> --- a/recipes-extended/libvirt/libvirt/runptest.patch
>> +++ /dev/null
>> @@ -1,116 +0,0 @@
>> -From d210838a4433dd254c1a11b08b804ebe9ff5f378 Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Wed, 8 May 2019 10:20:47 +0800
>> -Subject: [PATCH] Add 'install-ptest' rule
>> -
>> -Change TESTS_ENVIRONMENT to allow running outside build dir.
>> -
>> -Upstream-status: Pending
>> -Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
>> -[KK: Update context for 1.3.5.]
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> -[MA: Allow separate source and build dirs]
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -[ZH: add missing test_helper files]
>> -Signed-off-by: He Zhe <zhe.he@windriver.com>
>> -[MA: Update context for v4.3.0]
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -[DDU: Update context for v5.3.0]
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> -
>> ----
>> - tests/Makefile.am | 68 +++++++++++++++++++++++++++++++++++++++++------
>> - 1 file changed, 60 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/tests/Makefile.am b/tests/Makefile.am
>> -index ada5b8f..4a808dd 100644
>> ---- a/tests/Makefile.am
>> -+++ b/tests/Makefile.am
>> -@@ -28,11 +28,13 @@ AM_CPPFLAGS = \
>> -
>> - WARN_CFLAGS += $(RELAXED_FRAME_LIMIT_CFLAGS)
>> -
>> -+PTEST_DIR ?= $(libdir)/libvirt/ptest
>> -+
>> - AM_CFLAGS = \
>> --    -Dabs_builddir="\"$(abs_builddir)\"" \
>> --    -Dabs_top_builddir="\"$(abs_top_builddir)\"" \
>> --    -Dabs_srcdir="\"$(abs_srcdir)\"" \
>> --    -Dabs_top_srcdir="\"$(abs_top_srcdir)\"" \
>> -+    -Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
>> -+    -Dabs_top_builddir="\"$(PTEST_DIR)\"" \
>> -+    -Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
>> -+    -Dabs_top_srcdir="\"$(PTEST_DIR)\"" \
>> -     $(LIBXML_CFLAGS) \
>> -     $(GLIB_CFLAGS) \
>> -     $(LIBNL_CFLAGS) \
>> -@@ -474,10 +476,10 @@ TESTS = $(test_programs) \
>> -
>> - VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
>> - TESTS_ENVIRONMENT = \
>> --  abs_top_builddir="$(abs_top_builddir)" \
>> --  abs_top_srcdir="$(abs_top_srcdir)" \
>> --  abs_builddir="$(abs_builddir)" \
>> --  abs_srcdir="$(abs_srcdir)" \
>> -+  abs_top_builddir="$(PTEST_DIR)" \
>> -+  abs_top_srcdir="$(PTEST_DIR)" \
>> -+  abs_builddir="$(PTEST_DIR)/tests" \
>> -+  abs_srcdir="$(PTEST_DIR)/tests" \
>> -   LIBVIRT_AUTOSTART=0 \
>> -   LC_ALL=C \
>> -   VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE) \
>> -@@ -1547,4 +1549,54 @@ else ! WITH_LINUX
>> - EXTRA_DIST += virscsitest.c
>> - endif  ! WITH_LINUX
>> -
>> -+buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
>> -+
>> -+PTESTS = $(TESTS) $(test_helpers) test-lib.sh virschematest
>> -+
>> -+install-ptest:
>> -+    list='$(TESTS) $(test_helpers) test-lib.sh virschematest'
>> -+    install -d $(DEST_DIR)/tools
>> -+    @(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
>> -+    install * $(DEST_DIR)/tools)
>> -+    install -d $(DEST_DIR)/src/network
>> -+    cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
>> -+    install -d $(DEST_DIR)/src/cpu_map
>> -+    cp $(top_srcdir)/src/cpu_map/*.xml $(DEST_DIR)/src/cpu_map
>> -+    install ../src/libvirt_iohelper $(DEST_DIR)/src
>> -+    install -D ../src/libvirtd $(DEST_DIR)/src/libvirtd
>> -+    install -d $(DEST_DIR)/src/remote
>> -+    install -D $(top_srcdir)/../build/src/remote/libvirtd.conf $(DEST_DIR)/src/remote/libvirtd.conf
>> -+    install -d $(DEST_DIR)/src/remote/.libs
>> -+    @(if [ -d ../src/remote/.libs ] ; then cd ../src/remote/.libs; fi; \
>> -+    install * $(DEST_DIR)/src/remote/.libs)
>> -+    install -d $(DEST_DIR)/src/.libs
>> -+    @(if [ -d ../src/.libs ] ; then cd ../src/.libs; fi; \
>> -+    install * $(DEST_DIR)/src/.libs)
>> -+    install -d $(DEST_DIR)/docs/schemas
>> -+    cp $(top_srcdir)/docs/schemas/*.rng $(DEST_DIR)/docs/schemas
>> -+    cp -r $(top_srcdir)/build-aux $(DEST_DIR)
>> -+    install -d $(DEST_DIR)/examples/xml
>> -+    cp -r $(top_srcdir)/examples/xml/test $(DEST_DIR)/examples/xml
>> -+    install -d $(DEST_DIR)/tests/.libs
>> -+    find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
>> -+    find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
>> -+    @(for file in $(PTESTS); do \
>> -+            if [ -f .libs/$$file ]; then \
>> -+                    install .libs/$$file $(DEST_DIR)/tests; \
>> -+            elif [ -f $(srcdir)/$$file ]; then \
>> -+                    install $(srcdir)/$$file $(DEST_DIR)/tests; \
>> -+            else \
>> -+                    install $(builddir)/$$file $(DEST_DIR)/tests; \
>> -+            fi; \
>> -+    done;)
>> -+    @(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
>> -+    cp ../config.h $(DEST_DIR)
>> -+    cp Makefile $(DEST_DIR)/tests
>> -+    sed -i -e 's/^Makefile:/_Makefile:/' $(DEST_DIR)/tests/Makefile
>> -+    cp ../Makefile $(DEST_DIR)
>> -+    sed -i -e 's|^Makefile:|_Makefile:|' $(DEST_DIR)/Makefile
>> -+    sed -i -e 's|$(BUILD_DIR)|$(PTEST_DIR)|g' $(DEST_DIR)/tests/Makefile
>> -+    sed -i -e 's|$(BUILD_DIR)|$(PTEST_DIR)|g' $(DEST_DIR)/Makefile
>> -+    sed -i -e 's|^\(.*\.log:\) \(.*EXEEXT.*\)|\1|g' $(DEST_DIR)/tests/Makefile
>> -+
>> - CLEANFILES = *.cov *.gcov .libs/*.gcda .libs/*.gcno *.gcno *.gcda
>> diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
>> deleted file mode 100644
>> index bb500fde..00000000
>> --- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
>> +++ /dev/null
>> @@ -1,91 +0,0 @@
>> -From 7dc21edd851b260485b432c096f8e90f6fa07778 Mon Sep 17 00:00:00 2001
>> -From: Dengke Du <dengke.du@windriver.com>
>> -Date: Tue, 7 May 2019 15:26:32 +0800
>> -Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS is
>> - enabled
>> -
>> -When gnu-tls is enabled for libvirt references to virNetTLSInit are
>> -generated in libvirt. Any binaries linking against libvirt, must also
>> -link against libvirt-net-rpc which provides the implementation.
>> -
>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> -[ywei: rebased to libvirt-1.3.2]
>> -Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>> -[MA: rebase to v4.3.0]
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> -[ddu: rebase to v5.3.0]
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> -
>> ----
>> - examples/Makefile.am | 20 ++++++++++++++++++++
>> - tools/Makefile.am    | 12 ++++++++++++
>> - 2 files changed, 32 insertions(+)
>> -
>> -diff --git a/examples/Makefile.am b/examples/Makefile.am
>> -index ad635bd..a94f41d 100644
>> ---- a/examples/Makefile.am
>> -+++ b/examples/Makefile.am
>> -@@ -74,6 +74,10 @@ LDADD = \
>> -     $(top_builddir)/src/libvirt-admin.la \
>> -     $(NULL)
>> -
>> -+if WITH_GNUTLS
>> -+LDADD += $(top_builddir)/src/libvirt-net-rpc.la
>> -+endif
>> -+
>> - noinst_PROGRAMS = \
>> -     c/admin/client_close \
>> -     c/admin/client_info \
>> -@@ -111,6 +115,22 @@ c_misc_openauth_SOURCES = c/misc/openauth.c
>> - examplesdir = $(docdir)/examples
>> -
>> - adminexamplesdir = $(examplesdir)/c/admin
>> -+
>> -+if WITH_GNUTLS
>> -+dominfo_info1_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
>> -+               $(LDADD)    \
>> -+               $(NULL)
>> -+domsuspend_suspend_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
>> -+               $(LDADD)    \
>> -+               $(NULL)
>> -+hellolibvirt_hellolibvirt_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
>> -+               $(LDADD)    \
>> -+               $(NULL)
>> -+openauth_openauth_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
>> -+               $(LDADD)   \
>> -+               $(NULL)
>> -+endif
>> -+
>> - adminexamples_DATA = $(ADMIN_EXAMPLES)
>> -
>> - domainexamplesdir = $(examplesdir)/c/domain
>> -diff --git a/tools/Makefile.am b/tools/Makefile.am
>> -index 53df930..2a0a989 100644
>> ---- a/tools/Makefile.am
>> -+++ b/tools/Makefile.am
>> -@@ -166,6 +166,12 @@ virt_host_validate_LDADD = \
>> -             $(GLIB_LIBS) \
>> -             $(NULL)
>> -
>> -+if WITH_GNUTLS
>> -+virt_host_validate_LDADD += ../src/libvirt-net-rpc.la \
>> -+                            ../gnulib/lib/libgnu.la   \
>> -+                            $(NULL)
>> -+endif
>> -+
>> - virt_host_validate_CFLAGS = \
>> -             $(AM_CFLAGS) \
>> -             $(NULL)
>> -@@ -262,6 +268,12 @@ virt_admin_CFLAGS = \
>> -             $(READLINE_CFLAGS)
>> - BUILT_SOURCES =
>> -
>> -+if WITH_GNUTLS
>> -+virsh_LDADD += ../src/libvirt-net-rpc.la \
>> -+               ../gnulib/lib/libgnu.la   \
>> -+               $(NULL)
>> -+endif
>> -+
>> - if WITH_WIN_ICON
>> - virsh_LDADD += virsh_win_icon.$(OBJEXT)
>> -
>> diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
>> similarity index 69%
>> rename from recipes-extended/libvirt/libvirt_6.3.0.bb
>> rename to recipes-extended/libvirt/libvirt_7.2.0.bb
>> index 41abb06f..790071d5 100644
>> --- a/recipes-extended/libvirt/libvirt_6.3.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
>> @@ -18,96 +18,42 @@ RDEPENDS_${PN} = "gettext-runtime"
>>
>>   RDEPENDS_${PN}-ptest += "make gawk perl bash"
>>
>> -RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
>> +RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
>>   RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
>>   RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>>
>>   #connman blocks the 53 port and libvirtd can't start its DNS service
>>   RCONFLICTS_${PN}_libvirtd = "connman"
>>
>> +HOSTTOOLS_NONFATAL += "getent"
>> +
>>   SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>> -           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
>>              file://libvirtd.sh \
>>              file://libvirtd.conf \
>>              file://dnsmasq.conf \
>> -           file://runptest.patch \
>>              file://run-ptest \
>> -           file://libvirt-use-pkg-config-to-locate-libcap.patch \
>> -           file://0001-to-fix-build-error.patch \
>> -           file://install-missing-file.patch \
>>              file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
>> -           file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
>> -           file://0001-build-drop-unnecessary-libgnu.la-reference.patch \
>>              file://hook_support.py \
>>              file://gnutls-helper.py \
>> +           file://0001-meson-add-options-to-explicit-binaries-path.patch \
>>             "
>>
>> -SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
>> -SRC_URI[libvirt.sha256sum] = "74069438d34082336e99a88146349e21130552b96efc3b7c562f6878127996f5"
>> +SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
>> +SRC_URI[libvirt.sha256sum] = "01f459d0c7ba5009622a628dba1a026200e8f4a299fea783b936a71d7e0ed1d0"
>>
>> -inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
>> +inherit meson gettext update-rc.d pkgconfig ptest systemd useradd perlnative
>>   USERADD_PACKAGES = "${PN}"
>>   GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
>>   USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
>>
>> -# Override the default set in autotools.bbclass so that we will use relative pathnames
>> -# to our local m4 files.  This prevents an "Argument list too long" error during configuration
>> -# if our project is in a directory with an absolute pathname of more than about 125 characters.
>> -#
>> -acpaths = "-I ./m4"
>> -
>> -CACHED_CONFIGUREVARS += "\
>> -ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
>> -ac_cv_path_AUGPARSE=/usr/bin/augparse \
>> -ac_cv_path_DMIDECODE=/usr/sbin/dmidecode \
>> -ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
>> -ac_cv_path_BRCTL=/usr/sbin/brctl \
>> -ac_cv_path_TC=/sbin/tc \
>> -ac_cv_path_UDEVADM=/sbin/udevadm \
>> -ac_cv_path_MODPROBE=/sbin/modprobe \
>> -ac_cv_path_IP_PATH=/bin/ip \
>> -ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
>> -ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
>> -ac_cv_path_MOUNT=/bin/mount \
>> -ac_cv_path_UMOUNT=/bin/umount \
>> -ac_cv_path_MKFS=/usr/sbin/mkfs \
>> -ac_cv_path_SHOWMOUNT=/usr/sbin/showmount \
>> -ac_cv_path_PVCREATE=/usr/sbin/pvcreate \
>> -ac_cv_path_VGCREATE=/usr/sbin/vgcreate \
>> -ac_cv_path_LVCREATE=/usr/sbin/lvcreate \
>> -ac_cv_path_PVREMOVE=/usr/sbin/pvremove \
>> -ac_cv_path_VGREMOVE=/usr/sbin/vgremove \
>> -ac_cv_path_LVREMOVE=/usr/sbin/lvremove \
>> -ac_cv_path_LVCHANGE=/usr/sbin/lvchange \
>> -ac_cv_path_VGCHANGE=/usr/sbin/vgchange \
>> -ac_cv_path_VGSCAN=/usr/sbin/vgscan \
>> -ac_cv_path_PVS=/usr/sbin/pvs \
>> -ac_cv_path_VGS=/usr/sbin/vgs \
>> -ac_cv_path_LVS=/usr/sbin/lvs \
>> -ac_cv_path_PARTED=/usr/sbin/parted \
>> -ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
>> -
>> -# Ensure that libvirt uses polkit rather than policykit, whether the host has
>> -# pkcheck installed or not, and ensure the path is correct per our config.
>> -CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
>> -
>> -# Some other possible paths we are not yet setting
>> -#ac_cv_path_RPCGEN=
>> -#ac_cv_path_XSLTPROC=
>> -#ac_cv_path_RADVD=
>> -#ac_cv_path_UDEVSETTLE=
>> -#ac_cv_path_EBTABLES_PATH=
>> -#ac_cv_path_PKG_CONFIG=
>> -#ac_cv_path_ac_pt_PKG_CONFIG
>> -#ac_cv_path_POLKIT_AUTH=
>> -#ac_cv_path_DTRACE=
>> -#ac_cv_path_ISCSIADM=
>> -#ac_cv_path_MSGFMT=
>> -#ac_cv_path_GMSGFMT=
>> -#ac_cv_path_XGETTEXT=
>> -#ac_cv_path_MSGMERGE=
>> -#ac_cv_path_SCRUB=
>> -#ac_cv_path_PYTHON=
>> +
>> +EXTRA_OEMESON += " \
>> +    -Dip6tables-path=/usr/sbin/ip6tables \
>> +    -Ddmidecode-path=/usr/sbin/dmidecode \
>> +    -Ddnsmasq-path=/usr/bin/dnsmasq \
>> +    -Diptables-path=/usr/sbin/iptables \
>> +    -Debtables-path=/sbin/ebtables \
>> +    "
>>
>>   ALLOW_EMPTY_${PN} = "1"
>>
>> @@ -191,7 +137,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
>>   # full config
>>   PACKAGECONFIG ??= "gnutls qemu yajl openvz vmware vbox esx iproute2 lxc test \
>>                      remote macvtap libvirtd netcf udev python ebtables \
>> -                   fuse iproute2 firewalld libpcap \
>> +                   fuse firewalld libpcap \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
>> @@ -208,37 +154,34 @@ PACKAGECONFIG_remove_armeb = "numactl"
>>   # enable,disable,depends,rdepends
>>   #
>>   PACKAGECONFIG[gnutls] = ",,,gnutls-bin"
>> -PACKAGECONFIG[qemu] = "--with-qemu --with-qemu-user=qemu --with-qemu-group=qemu,--without-qemu,qemu,"
>> -PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>> -PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
>> -PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
>> -PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
>> -PACKAGECONFIG[vbox] = "--with-vbox,--without-vbox,,"
>> -PACKAGECONFIG[esx] = "--with-esx,--without-esx,,"
>> -PACKAGECONFIG[hyperv] = "--with-hyperv,--without-hyperv,,"
>> -PACKAGECONFIG[polkit] = "--with-polkit,--without-polkit,polkit,polkit"
>> -PACKAGECONFIG[lxc] = "--with-lxc,--without-lxc, lxc,"
>> -PACKAGECONFIG[test] = "--with-test=yes,--with-test=no,,"
>> -PACKAGECONFIG[remote] = "--with-remote,--without-remote,,"
>> -PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
>> -PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd,,"
>> -PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
>> -PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
>> -PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
>> -PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
>> -PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
>> +PACKAGECONFIG[qemu] = "-Ddriver_qemu=enabled -Dqemu_user=qemu -Dqemu_group=qemu,-Dqemu=disabled,qemu,"
>> +PACKAGECONFIG[yajl] = "-Dyajl=enabled,-Dyajl=disabled,yajl,yajl"
>> +PACKAGECONFIG[libxl] = "-Dlibxl=${STAGING_DIR_TARGET}/lib,,xen,"
>> +PACKAGECONFIG[openvz] = "-Ddriver_openvz=enabled,-Ddriver_openvz=disabled,,"
>> +PACKAGECONFIG[vmware] = "-Ddriver_vmware=enabled,-Ddriver_vmware=disabled,,"
>> +PACKAGECONFIG[vbox] = "-Ddriver_vbox=enabled,-Ddriver_vbox=disabled,,"
>> +PACKAGECONFIG[esx] = "-Ddriver_esx=enabled,-Ddriver_esx=disabled,,"
>> +PACKAGECONFIG[hyperv] = "-Ddriver_hyperv=enabled,-Ddriver_hyperv=disabled,,"
>> +PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit,polkit"
>> +PACKAGECONFIG[lxc] = "-Ddriver_lxc=enabled,-Ddriver_lxc=disabled,lxc,"
>> +PACKAGECONFIG[test] = "-Ddriver_test=enabled,-Ddriver_test=disabled,,"
>> +PACKAGECONFIG[remote] = "-Ddriver_remote=enabled,-Ddriver_remote=disabled,,"
>> +PACKAGECONFIG[libvirtd] = "-Ddriver_libvirtd=enabled,-Ddriver_libvirtd=disabled,,"
>> +PACKAGECONFIG[netcf] = "-Dnetcf=enabled,-Dnetcf=disabled,netcf,netcf"
>> +PACKAGECONFIG[dtrace] = "-Ddtrace=enabled,-Ddtrace=disabled,,"
>> +PACKAGECONFIG[udev] = "-Dudev=enabled -Dpciaccess=enabled,-Dudev=disabled,udev libpciaccess,"
>> +PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux,"
>>   PACKAGECONFIG[python] = ",,python3,"
>> -PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
>> -PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
>> -PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
>> -PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
>> -PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
>> -PACKAGECONFIG[libcap-ng] = "--with-capng,--without-capng,libcap-ng,"
>> -PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-dissector,wireshark libwsutil,"
>> -PACKAGECONFIG[apparmor-profiles] = "--with-apparmor-profiles, --without-apparmor-profiles,"
>> -PACKAGECONFIG[firewalld] = "--with-firewalld, --without-firewalld,"
>> -PACKAGECONFIG[libpcap] = "--with-libpcap, --without-libpcap,libpcap,libpcap"
>> -PACKAGECONFIG[numad] = "--with-numad, --without-numad,"
>> +PACKAGECONFIG[sasl] = "-Dsasl=enabled,-Dsasl=disabled,cyrus-sasl,cyrus-sasl"
>> +PACKAGECONFIG[numactl] = "-Dnumactl=enabled,-Dnumactl=disabled,numactl,"
>> +PACKAGECONFIG[fuse] = "-Dfuse=enabled,-Dfuse=disabled,fuse,"
>> +PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit,"
>> +PACKAGECONFIG[libcap-ng] = "-Dcapng=enabled,-Dcapng=disabled,libcap-ng,"
>> +PACKAGECONFIG[wireshark] = "-Dwireshark_dissector=enabled,-Dwireshark_dissector=disabled,wireshark libwsutil,"
>> +PACKAGECONFIG[apparmor_profiles] = "-Dapparmor_profiles=true, -Dapparmor_profiles=false,"
>> +PACKAGECONFIG[firewalld] = "-Dfirewalld=enabled, -Dfirewalld=disabled,"
>> +PACKAGECONFIG[libpcap] = "-Dlibpcap=enabled, -Dlibpcap=disabled,libpcap,libpcap"
>> +PACKAGECONFIG[numad] = "-Dnumad=enabled, -Dnumad=disabled,"
>>
>>   # Enable the Python tool support
>>   require libvirt-python.inc
>> @@ -255,7 +198,7 @@ do_compile() {
>>
>>        cd ${B}
>>        export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${B}/src:"
>> -     oe_runmake all
>> +     ninja all
>>   }
>>
>>   do_install_prepend() {
>> @@ -278,6 +221,8 @@ do_install_append() {
>>        fi
>>
>>        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>> +            mkdir -p ${D}/lib
>> +            mv ${D}/usr/lib/systemd ${D}/lib
>>            # This variable is used by libvirtd.service to start libvirtd in the right mode
>>            sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
>>
>> @@ -360,7 +305,7 @@ do_install_append() {
>>            # connection via 127.0.0.1 is available out of box.
>>            install -d ${D}/etc/pki/CA
>>            install -d ${D}/etc/pki/libvirt/private
>> -         install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
>> +            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
>>            install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
>>            install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
>>            install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
>> @@ -376,10 +321,10 @@ do_install_append() {
>>        chmod 4755 ${D}${bindir}/virt-login-shell
>>   }
>>
>> -EXTRA_OECONF += " \
>> -    --with-init-script=systemd \
>> -    --with-test-suite \
>> -    --with-runstatedir=/run \
>> +EXTRA_OEMESON += " \
>> +    -Dinit_script=systemd \
>> +    -Drunstatedir=/run \
>> +    -Dtests=enabled \
>>       "
>>
>>   # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
>> @@ -392,11 +337,11 @@ EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH
>>   PRIVATE_LIBS_${PN}-ptest_append = "libvirt-admin.so.0"
>>
>>   do_compile_ptest() {
>> -     oe_runmake -C tests buildtest-TESTS
>> +     ninja -C tests buildtest-TESTS
>>   }
>>
>>   do_install_ptest() {
>> -     oe_runmake -C tests install-ptest
>> +     ninja -C tests install-ptest
>>
>>        find ${S}/tests -maxdepth 1 -type d -exec cp -r {} ${D}${PTEST_PATH}/tests/ \;
>>
>> --
>> 2.27.0
>>
> 
>>
>> 
>>
> 
