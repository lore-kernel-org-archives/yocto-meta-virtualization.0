Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4627.1634611433026688967
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 19:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=o7h2FqC+;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=592617ddc3=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J2ZK1X025234;
	Tue, 19 Oct 2021 02:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : cc : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=NBtlMVYJLuV94lJLC38Ia01udYk+fVCnR+o+lPPLTcw=;
 b=o7h2FqC+Oi5m3yoa44ZsRrYPIRd09Pf1gLvmjTzmAbi8fa+/VQDq3SP10uvDMaWKbPL5
 VdeNShl3cgGIOvkNwO2nw40hLPqovBN2DchJUFwWTW2/DzzyAnzrRAIDcJgKgwWGn9Ov
 deiFDZN/6k1/Yf0lU4l5gjFa4vz3mPF8szzMGlUAZf0SY/sGYmvDnE4OsL4cXIAh0o1w
 0kX0DDrWsoxWwInRJBY9v3xS71K7VPKjdjSS1cxrRWs9kkK0YE3oPqgsYeDv6yJlFMDl
 VH8Kp1Fzisnd0kaSC9+mcpXQy0PP7TfnkuXU00dOWB/uEQzEW0EP+pcuGfCCa2ZigetZ mw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bs9apgjv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Oct 2021 02:43:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7n0NxJvwLPyh0m0Z8QuC+7pBcoiJ0VQAJD1scCQE/r/FYrVFodFCXZqWPcOLvREyin6U/64mtPxFwzrN90KEm2Vwc4resi8vpz4rd3htoGCYu7kK14tUJR2O98IcZdSKPmgNbH8MT0q9lD4qP0IHrMAP9ud5n9Ph1Cj7f6VXhuACNbFnneoW0kI7KDJYbzmXOxDQKRPHGYvU0zryA/KKP9faAh5OxU50xtOsxet9vLSYuS2BDQNU9ZkVcVxJkvgBEIs6fp/vLIsWzPzb7rH+Reqz5EBkNB5wE2++Z285jC+1MRNGRt9gnxrZB2OOkgpVFTetc6rde/o+UEd6/ZUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBtlMVYJLuV94lJLC38Ia01udYk+fVCnR+o+lPPLTcw=;
 b=MPk2wetXf/TWO+2M/+QXrrDMgCi85E69e8Q7mJfPbgEzjpYwHv7Reo+fL75uScz0kxp0A0boInmg9URHmEVfQgIHXJEJ2t0sSrXjnjE2APct+Pr8cYGgi5h3JqNdwIgnPK7+tKBMPHzz0g2IRp50vqdCSefQ+AIiRdlBFW6MZd2NJRRyfKsSjSalITQHzW3AVisWiZ4JNFaOp89tfmXxb3KHfeMbzChsy6nIYwqO0MphsJbtaTsfd7m3/EfiqcJcqo94mDi3wlo4SnPzc09GvD0mrqj8QuAwCjyykRcByuuZE9ZY4obypBct8pWicjKVZfUNLtLsYYVanAiddQydVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 02:43:48 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 02:43:48 +0000
Subject: Re: [meta-virtualization] [PATCH] ceph: inherit pkgconfig.bbclass
From: "kai" <kai.kang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20211015093705.39812-1-kai.kang@windriver.com>
 <CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com>
 <6f755656-54b8-9db5-7141-7a7a1de18b80@windriver.com>
Message-ID: <04711a6e-02cc-9ae6-f312-ec4f6a804ff3@windriver.com>
Date: Tue, 19 Oct 2021 10:43:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6f755656-54b8-9db5-7141-7a7a1de18b80@windriver.com>
X-ClientProxiedBy: HK2PR02CA0183.apcprd02.prod.outlook.com
 (2603:1096:201:21::19) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by HK2PR02CA0183.apcprd02.prod.outlook.com (2603:1096:201:21::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 02:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4db3967-1067-4fd0-e824-08d992aa471e
X-MS-TrafficTypeDiagnostic: CO6PR11MB5587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB558765E98A677F14EBB6F7BD95BD9@CO6PR11MB5587.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OEm3gSlWaEcxmuDJJvFHWQdCDDd3ZTpAbqi4NoplbwUEDxhK8gSfhEbHl04oiUF8RwFxqbYAoNNc81bf13k5mGQGpTzjcMOb6wKDpezktBMg5T0sQ3oAbDfbszax1r8z4HE1qlTkBVz+zkitLno1LUC0oVLLnu2itE9iZj6THTZk15ZDRI5aQd/wthQqRAfuIw2/0CYA1vAHBL7X+DCXp7KRSZgjMNxUQrWvEEe6VdZjXfgn60//31kiduHzMa3sxmRh8jRQ6LWNGS8Tmd18jJdO0NlFF4wq339OhlvtER7y7/A/crLnchWlA6PtkRuWjNIx093r1LqSazakmwXxAxl7ghHF6MiTMmeH/9fm2nnPOjzv0GhoRjBk+Fp/3PAHGPvBhmnzGSM2B/LP9Jei7o6FmvoocycCUED5EDMkDxfaz94wtXfSMFmXwV80VYuFYPaLNSELfYP/jePUQLtKFqIRvDp/djyGV2sPtc3mMyekWElxWAJJ291s/nvPRmRTVGAlx9gNXRFclsQL4LcYbgbDwKMdiTK2953Sfl188EXB6TJrn7Sh2qG/Npf/wp3uPfrFXmtsqK6SBVx/Qp1mt27x0KN9TPnkRZMy90atdNL8cHkW82Vxprkw0aT1WXHt91F4k9G/t1s9mBiV7iP0d+ncZDm8J2yly8YEgw4g+uD+1AREsy426mqlzUyCZL6m7aQCjgL4ivfC2yH6QbsrACLf3OS9fs6qx54F1+igzSh7mdYa/9CzdNDwsw8pmsMqNXs4erQ4sEw/yzxq0CJgZVmGE9wP3Y9MIk7iDQbXMNfiLyGBHo8ot3VcY5cGHePRzJmThcsCJO7rprLVwNqJBcAE6JytlOA/kdbr1OC1m//qkvx+iuT7XM8ECEGMbv5QOjM2GBUUqt/iOmO1SwwnUhv0FwKoqsc9pg423fGFhpc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(52116002)(316002)(6486002)(4326008)(2906002)(8676002)(38350700002)(31686004)(38100700002)(6916009)(16576012)(66556008)(66476007)(8936002)(2616005)(956004)(66946007)(6666004)(53546011)(31696002)(966005)(86362001)(186003)(36756003)(166002)(33964004)(6706004)(26005)(5660300002)(83380400001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjhsNFM5WU90V2xMNzhzVG42M3JyUlJqZnR1M1RDb3NVRFlZNElZTFMwLzFF?=
 =?utf-8?B?b0dmM01jaytSYzZyWEVCdDdOakdwZU5UQ2ZBemRta3N2S093QnJVbnIvZCtk?=
 =?utf-8?B?QlRtYzVlRVZ5Y01nRW9Gc3djdWpVVTNoSFpUdy9IZGgxWFJBc3d5dm9IOStY?=
 =?utf-8?B?SS84SEwxdWkyNEtsajNDVUt5WjQ0L3laaWdSTFl2WVQrY1cvc0hlYU94TEhI?=
 =?utf-8?B?R1lGY0kxc21OQXhaQ1o0ZUU0aWg4K1IyRFNEcVlUcWZvamRzQWF1V0huaVlp?=
 =?utf-8?B?elNXaURSNG1nSGprTUFieXdJSEdMQlpRU3M1ejJQelVUNU5tdE5PZW1qS2pv?=
 =?utf-8?B?UWVhOS9uWkJESlNJTjFPL2Fqd1hsTEwrK3N5VnlRRTF5SGRnMHcrSWdJdWNG?=
 =?utf-8?B?d2pxK3R0QlZZdlI0ZXJ3ZXFHUFQ3djNwNExZeHBtMGJ3VEtRTVlGaDlyeUhB?=
 =?utf-8?B?QmlaZHdVQmxpQ2ZESFhiM3JicHhSczVqVmFIbnRVcE81ZWU2TjI3WEFsU0tv?=
 =?utf-8?B?RTlJVURPTEZmeHZDQ0lPK3BFelM4eDZWa211WkNQdytYMWtiUVVzcTkrekxh?=
 =?utf-8?B?R0ZBNldTalAvS2s4WWVxdklBbkVxdmNtL3BRQXJ4Um9aVUNBR3VaNFB3ZUk1?=
 =?utf-8?B?OEo1MGZnUXJmTjdkcVU0WmI0SHk4ZGZubGovS3I4WGl6MUF1RnRNMGJod2ZR?=
 =?utf-8?B?U2laNTZLbWliWk9SK2RuSE9nQ3QwWXE2Sm9oQ3JzOGlUTTR3UG43WFErK1E5?=
 =?utf-8?B?WUxWSGxXZ0sxaEE0WFdhSzBnWEZZZHk5S2VDOGdkaEg2aEZ3MVEzbWQ4L0hD?=
 =?utf-8?B?emFUMzgwc29qVlNWVTVyTHR6VGVESzZzeUFiekZIQ3BTemh0aTNXaUZjSVF2?=
 =?utf-8?B?Um1UU09CRCtvVHVSdlJNODg4VVRnNDQxdlo3dWM0VG00TlIyTFNoelRFUzQ5?=
 =?utf-8?B?Z25TckxtMUEwUUwzSGJrNkd1eWtSSFJlZVhNMnBpOWxHSG8rR0VBN0NWY2VB?=
 =?utf-8?B?WlFpMDlrSVkrMS9QRmlJbzdEaGNBWStlZXZ2NkVEbmR4cm5zV0JkVVJJTldM?=
 =?utf-8?B?d2dCZm1FUkZURDYrL0pPaTVaMWFKN0o3cDNlUmlOMkpkdFIremhmOGpEeC9H?=
 =?utf-8?B?eUpOTUx5WUtRY0ZKd0xHT3N0eVFrMDNITTljVm95ZmJidjNVVDZJTUYvOGVh?=
 =?utf-8?B?cnhvTmNPT1A1SjkvcC9kY3liS1FEbU03STB3N1ovak9GdVloeVpYczB0YVN3?=
 =?utf-8?B?QmlwTUR6aWZCT2NPNDRicHg3N1NyMUhNY3RTdzZBdUNmTzE4K1FiSmxnZ1E0?=
 =?utf-8?B?TTVpZUdxenUyOFhlM3MvZmJZTkVndHREdjNZVkdYbG5tV000Z3VqWS9Sbm95?=
 =?utf-8?B?RThmUzBEWnJ5Q1R0K3FHcUZFVGMrOE1UUGNRazJtQ2JhWXhyaHZBZzV0YnJy?=
 =?utf-8?B?ZzdpYjJ2WkhhZDQzZHpGNjVSc0VoQkEyVTlVcHRtZ28zM1JTcTd2Y1hVdlIv?=
 =?utf-8?B?MnRGTUpheEFXZjJKSWRzMjBPb0VuSjZlNCtpK24zcTJBV1NtZ0V1KzRsVTVY?=
 =?utf-8?B?OUtjMGV4MVJ0RTRMNHFoU3R4Qmd3RnQyNDJadUJIMEwvS0YvM1FTTTlZUysx?=
 =?utf-8?B?RXhCSzhkN2NBTy91MExJWDZ1YXg1bzFRUXdDVmR0ZG9SWWVma0ZpblZ1MjdZ?=
 =?utf-8?B?aEVULzZNUmtMcnNJTDVUUldNOVQ5NzFBK0NobU5FSStZczBzWHBKa2NMWkgv?=
 =?utf-8?Q?QPlSGmguQTwxfgDlO4GERxauWqx43zIFWEqc6uM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4db3967-1067-4fd0-e824-08d992aa471e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 02:43:48.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGNV4bi/P2zX3ZsEd5rGq6oKgMg3WLU/ADxZuJVoKlvWmp/3LVCGNZUmEDFx8h4QziwDqoaJBgtb5jhY6xv1MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
X-Proofpoint-GUID: bJJeUM_NbsdLN3u8L2bsoFprKAvxDLt6
X-Proofpoint-ORIG-GUID: bJJeUM_NbsdLN3u8L2bsoFprKAvxDLt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=893 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190013
Content-Type: multipart/alternative;
 boundary="------------8C615A448F857806EE7FF214"
Content-Language: en-US

--------------8C615A448F857806EE7FF214
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 19J2ZK1X025234

On 10/19/21 10:04 AM, Kai wrote:
> On 10/15/21 5:52 PM, Martin Jansa wrote:
>>
>>
>> On Fri, Oct 15, 2021 at 11:37 AM kai <kai.kang@windriver.com=20
>> <mailto:kai.kang@windriver.com>> wrote:
>>
>>     From: Kai Kang <kai.kang@windriver.com
>>     <mailto:kai.kang@windriver.com>>
>>
>>     According to oe-core commit
>>
>>     652fdf8719 sstate: Allow validation of sstate singatures against
>>     list of keys
>>
>>
>> I think you should refer to this oe-core commit instead:
>> https://git.openembedded.org/openembedded-core/commit/?id=3D8e26252b45b7=
660c7c67c702411bdec187a76ffc=20
>> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-c=
ore/commit/?id=3D8e26252b45b7660c7c67c702411bdec187a76ffc__;!!AjveYdw8EvQ!O=
qpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC8R2i6sEg$>

My fault. I referred to wrong commit. Thank you for pointing out.

Regards,
Kai

>>
> Sorry, just ref the commit in Yocto. Will ref to URL link next time.
>
> Regards,
> Kai
>
>>
>>     pkgconfig-native is not deployed in sysroot by default any more.
>>     Inherit
>>     pkgconfig.bbclass to make it work for ceph.
>>
>>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>>     <mailto:kai.kang@windriver.com>>
>>     ---
>>     =C2=A0recipes-extended/ceph/ceph_15.2.12.bb
>>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!=
OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>>     | 2 +-
>>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git a/recipes-extended/ceph/ceph_15.2.12.bb
>>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!=
OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>>     b/recipes-extended/ceph/ceph_15.2.12.bb
>>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!=
OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>>     index 6636d7a..693b525 100644
>>     --- a/recipes-extended/ceph/ceph_15.2.12.bb
>>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!=
OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>>     +++ b/recipes-extended/ceph/ceph_15.2.12.bb
>>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!=
OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>>     @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
>>     "file://COPYING-LGPL2.1;md5=3Dfbc093901857fcd118f065f900982c24
>>     file://COPYING-GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>>     file://COPYING;md5=3D4eb012c221c5fd4b760029a2981a6754 \
>>     =C2=A0"
>>     -inherit cmake python3native python3-dir systemd
>>     +inherit cmake pkgconfig python3native python3-dir systemd
>>     =C2=A0# Disable python pybind support for ceph temporary, when corss
>>     compiling pybind,
>>     =C2=A0# pybind mix cmake and python setup environment, would case a
>>     lot of errors.
>>
>>     --=20
>>     2.17.1
>>
>>
>>    =20
>>
>
> --=20
> Kai Kang
> Wind River Linux


--=20
Kai Kang
Wind River Linux


--------------8C615A448F857806EE7FF214
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/19/21 10:04 AM, Kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6f755656-54b8-9db5-7141-7a7a1de18b80@windriver.com">
      
      <div class="moz-cite-prefix">On 10/15/21 5:52 PM, Martin Jansa
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com">
        <div dir="ltr">
          <div dir="ltr"><br>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Fri, Oct 15, 2021 at
              11:37 AM kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
              <br>
              According to oe-core commit<br>
              <br>
              652fdf8719 sstate: Allow validation of sstate singatures
              against list of keys<br>
            </blockquote>
            <div><br>
            </div>
            <div>I think you should refer to this oe-core commit
              instead:</div>
            <div><a href="https://urldefense.com/v3/__https://git.openembedded.org/openembedded-core/commit/?id=8e26252b45b7660c7c67c702411bdec187a76ffc__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC8R2i6sEg$" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/commit/?id=8e26252b45b7660c7c67c702411bdec187a76ffc</a></div>
          </div>
        </div>
      </blockquote>
    </blockquote>
    <p>My fault. I referred to wrong commit. Thank you for pointing out.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:6f755656-54b8-9db5-7141-7a7a1de18b80@windriver.com">
      <blockquote type="cite" cite="mid:CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com">
        <div dir="ltr">
          <div class="gmail_quote">
            <div> <br>
            </div>
          </div>
        </div>
      </blockquote>
      <p>Sorry, just ref the commit in Yocto. Will ref to URL link next
        time.</p>
      <p>Regards,<br>
        Kai<br>
      </p>
      <blockquote type="cite" cite="mid:CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com">
        <div dir="ltr">
          <div class="gmail_quote">
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex"> pkgconfig-native is
              not deployed in sysroot by default any more. Inherit<br>
              pkgconfig.bbclass to make it work for ceph.<br>
              <br>
              Signed-off-by: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a>
              | 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a>
              b/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a><br>
              index 6636d7a..693b525 100644<br>
              --- a/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a><br>
              +++ b/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a><br>
              @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = &quot;<a class="moz-txt-link-freetext" href="file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24" moz-do-not-send="true">file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24</a><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263" moz-do-not-send="true">file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754" moz-do-not-send="true">file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754</a>
              \<br>
              &nbsp;&quot;<br>
              -inherit cmake python3native python3-dir systemd<br>
              +inherit cmake pkgconfig python3native python3-dir systemd<br>
              &nbsp;# Disable python pybind support for ceph temporary, when
              corss compiling pybind,<br>
              &nbsp;# pybind mix cmake and python setup environment, would
              case a lot of errors.<br>
              <br>
              -- <br>
              2.17.1<br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------8C615A448F857806EE7FF214--
