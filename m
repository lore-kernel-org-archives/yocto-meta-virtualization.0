Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11281.1623336659473826591
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 07:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TFxHZ8By;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17957fbb64=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15AEoXHr019807
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Jun 2021 14:50:58 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 393hwa04vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Jun 2021 14:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JP/bloNEC/RRmRjlZ5qhyV/M5yUwQ6Iz9zRKq/uXE33BTQ1BtTykYypF8Cd9VpWA7014+l5qz6knvw0KA9E6UN6SG/ISLslBt5Kasw0jmAJS2AY07tvW8WnP5pow0ZGMGmM9L2LutqJFxw6AVjvEQR0TeM5cyJWyO85GdVTJQqDy+0FEe8zVQ5I0NMWYnx7Zrl2bJnU5U0oYKWj2Ni6myzZzayOHm6e++hWVQidXq3TS5LW42vRcUEMPRfbb19+KH3x5UH4DxiamH5FGxcATRwg3I47Ssiy6iu/SdUA5Vei4tD2AbM/hB5BBKxEATkA7onkTHOIV6/CffLh+Yrjk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fjnyWFXOYnwbqOBWKYgwPfnqzqAr+qhA3HB3f8K/m4=;
 b=G7K8x5vLCdh4ZkIfr5k3aO42tlt6YsSzs1UuOht5vAhPiEuh90OyKFsp3D/x+nqjzf5KfMPYgt67DRK2+NJh5lTHsJC8LlRUIFDWXM5cM6jcL4019FI4hvF8hT404mX3NibGiXoyWEzsBNGYzg10rd+23u1L9c+SidzspVOd/VNdGVhhVYg1sU0tS5u66PMaujo8S+7jt4KlSrgpiOmi2ipmsWs0vgoXwuGt392+y+ap4YmmIJpfTr4OGM9Eu0UU7q3rCc6OeNkGbTw6EnFrbaf1EmUJUpz/a/OsqB/0RVYS1Xz4Dpyou3jYRXFNkJAKE0Pi6iBk71f8xMSv6P4R6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fjnyWFXOYnwbqOBWKYgwPfnqzqAr+qhA3HB3f8K/m4=;
 b=TFxHZ8By/FgJKl7DB4KvL6Gd28CIYXGUED0P05SJoRFYsF9kUnTGCTy5uY26AEa/NoCG0XubpXXG1cyvIsuQCeL0KbO8gntwjxmTlrdIq8LhAjFgkkD8SpRZOgbnTFFpwyxp9bcIQ1r07teYxiuKt7uxtkiRAf5YBaJ1um1xGR8=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1436.namprd11.prod.outlook.com (2603:10b6:4:8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.29; Thu, 10 Jun 2021 14:50:55 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7158:2b59:3801:af96]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7158:2b59:3801:af96%3]) with mapi id 15.20.4219.021; Thu, 10 Jun 2021
 14:50:55 +0000
Subject: Re: [meta-virtualization][hardnott][PATCH] kubernetes: fix CVE-2021-20206
To: meta-virtualization@lists.yoctoproject.org
References: <16873EBBA86BEE9D.24733@lists.yoctoproject.org>
From: sakib.sajal@windriver.com
Message-ID: <c6ad1945-45cc-88ec-473f-45e05ae4a923@windriver.com>
Date: Thu, 10 Jun 2021 10:50:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <16873EBBA86BEE9D.24733@lists.yoctoproject.org>
X-Originating-IP: [70.49.163.59]
X-ClientProxiedBy: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.20] (70.49.163.59) by YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 14:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dd80d4b-8186-4915-47fa-08d92c1f26c3
X-MS-TrafficTypeDiagnostic: DM5PR11MB1436:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB143658D6B9A6B6084297555EF2359@DM5PR11MB1436.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SkddAitFiFKi0sCCi9x/+DH7JJv7G/PigAWnfjcE94Ijra4wNaSyjDNFUzQqtdxc+yBzYIPQfEX4Xjd5dShS+OFGXyQ9FkOpKYPMEMHhReXjd+e1itE8I5a7w9HypOod9Rm7NITWqwaUIClsymkBEm3eh5jr8v7XWZ886MEzr4QJaEhyxiJHraR+F9/8memX9xSXfZJNxLzNJqssGZsLB5PC/x2m5Y1yWST3Jxug15WWrwbxQ45eDX59tEVMIsIij28SBWCekUyFC1uFphjBJs6Tg6vHCk/MefRQTFF/YTaDy2lnmOQ0Covt6tLyGAtQeuioAKOfRBtxBSSPdzoPRiutOP/3iGOdMQc4ZTKhckluMEcTe1vV33z07xCSmI5HbJyzRu0KjX8PmTKjyrMNxsv+4IC20rh6hTwA3LVKFcRt6vTgBiWmgr7aw6jfCnVZWrvTqkS2nzsn3xma2YpRJdIo/DJAmr/PpQ1UuwfTh5jIvCGux2gDtgE26XQ3NT9/VaFg4oUpD67rTFOgOD3fs0cBFTgdH3BrbNzGchKhJ35vxjQvZEtH+uibS8shn9s7bwIzyKhG0Ae6ZHsrrP+36uBjF6xE/CLh/NB4YiiSgMXeJtNQdNUxAEqp+tLN52Cs9D7ouT5bPn75oA6uwSGiHi0hSyduQDV/hJmUV9B9WR2Idl19Q8OBh9F8kaz6uL1NN5BK2+Mm6l2LfDRXySzIOiU9P4FwCYMCH5PykB9zRwRCu2+CYoSSNve210atGstsP7SgPolvBYUUkJhtp8MiioP9YIFR7IApk1PkbopQJNdNoNQYBB+UiQsQrDO7qSut4UGzMLb1vcd4ERqyv40Shqz5Prx9w9Zhhn1Zwsi4pfqL/ZvIvzz1vEDvnZ4G4bnG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39840400004)(396003)(166002)(33964004)(2616005)(38100700002)(186003)(16576012)(30864003)(8936002)(316002)(956004)(83380400001)(966005)(2906002)(38350700002)(52116002)(44832011)(53546011)(5660300002)(8676002)(16526019)(26005)(86362001)(36756003)(6666004)(6486002)(31686004)(478600001)(6916009)(31696002)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmxmclU2WGl5Y0srTHRUL2NKbi9BQzJlcmpNSW15UUNrRy9lM1VWMFoxRFZP?=
 =?utf-8?B?cGk5akJ2b3ZqYmdneEl1SGhCakpST1hvL0M5QXJXTGIwdWRGTXhFOHlVSXZW?=
 =?utf-8?B?YnJ2dzlxVmQzMjNHOXkxNEtNNGg3WVJOSlRKUm42cGlYWmhJbmtaMDJSUm1Y?=
 =?utf-8?B?SHY5d3pGZzIrYUZlREh4Kzh2eWRxVmcrSlZVZm51b3Q4MTNzaVFGTnJqN1Yr?=
 =?utf-8?B?bXB4SU4zVllOb3l2STZZVk56SWRjQVViUEl0MEZpcGZyVUFqN2RoUzFjd0pa?=
 =?utf-8?B?M0RCUnpyaTVGbFFDMjlUc2ZuS0dWMTNsNm9sdy9GV3RmdEthOStGVEZLMFNQ?=
 =?utf-8?B?TWZGdlRBbEtzQk5aYVE1MzRCeWpoZXNlZE5SNmx3K2Zzdks5eGhnSndpRjVK?=
 =?utf-8?B?UFYyaVBvemI2cXE2cnRHMk41clpIM2RMS29UZ0czNW40OXFoKzg2YTNIeE1P?=
 =?utf-8?B?aGltZmJuSlJUQnMvbXp1K3p1WDBhR3ZOaWtvc2QyUGo1aUtYK0xtMnlVKzFH?=
 =?utf-8?B?RnRsMzEwbWg0ci8vSUxXc3lGSnkyN3hvUkFqTEFiRkh4TmhqMThqbEdUcE9J?=
 =?utf-8?B?a2dsUmNRZVNOZUVla0hkYXMrd1o2R2p2ang5QVBzYmsyS01iOGgxdVc5WnJ5?=
 =?utf-8?B?cXJ1TXV5cUlmOUVJU2dacFVXeEdlajlnRk43U1pNalpjVDlCcklkWVVKS2U1?=
 =?utf-8?B?YTk3UG8zM3B4THBiaVBhTnBSV0Q2VTcvYkU1a0JUeWdBdENySDI4OVJiZDA2?=
 =?utf-8?B?ZW9vemZTTVNLSlJvWWZubml0aFFtdFI1Vkg0VXNMN2NzMm5GS0NYeEpnOGV2?=
 =?utf-8?B?L1c4WE52UXBnYU1kS2pVbVByZXdOdHdnSksrRXlwTENpZzUwWC9INyt6a3E0?=
 =?utf-8?B?QXJWWUJ0ejZJczF5WVFsN09xWFcwQ2VkdWRiQ2NKeWF2WGo3YkpwOVdJSVhn?=
 =?utf-8?B?bEFCWkhxM0M1cTYwdjBBUGZXcGtraEo3RjVpeThJS1JuY1RreDFMdkFKWnEw?=
 =?utf-8?B?U1J1dysycGh2d1IvblFyNlUyR3RhazFTeHU3NFZjTXBqNmI2UUp2MVo1bkV2?=
 =?utf-8?B?R2thL2JFdktUSkM2YVZ4SjVBaFUwbTRzVFY3a3lvU2V6THZCQXpETmVqYkVS?=
 =?utf-8?B?RndwTmlCNWRST3kydWJhdW1LaVYyQW9GV01IQ1JqUEE2U3N1Z09JZW54OFBW?=
 =?utf-8?B?clYvK3BTRlRpWTJSNFJvOFdjZmMzcjcyL0tQRVpkb1R3bTZpR2lrTS8vZlN5?=
 =?utf-8?B?VXB4RTZrZVhEMWFka0VPZmtiYXVCL1ovNm1OcFJWT0JkUm5VQ2s2MncwWFl6?=
 =?utf-8?B?bzNDUDhJZ294bTV1TkhJOXg0NkVXUXRlUkpXamtIWGpwN3UyOEFtM0QrVnIv?=
 =?utf-8?B?OWZVc0FvRjFRQ0lPUUZMM0tXRGtHOElHRlhEcDVKQ2t6V3N2Q1RtbHFkakJT?=
 =?utf-8?B?bTFPcVhIbWhMUlhOakw3NjNjbFpYZUZ6eTBONm9wVzY5QU1sYXFxOEZWNWFm?=
 =?utf-8?B?S1gxTGE4VDBwNDlpK0hrYTVjVjNqdXM4cStYM2RhQmxaMjkzUThUdlpDY1hu?=
 =?utf-8?B?ODBTTC9WQzB1alNHYU1zcndiUEpXWk9kVWRwZ0loVGt4ekpoeHo1SUc4dUNM?=
 =?utf-8?B?QjJZZWorNS9Ed0RMZUdpZkVjQ201dUgzdURaeUJUUHYxRDVZY1pRZm5GQTdq?=
 =?utf-8?B?djlGbUVmWmxmOStCU09iL2hzR1c0MVdMb2QrdWtUcEZ1TnBXRVNPOU9ORDBD?=
 =?utf-8?Q?FU6bxAIaAyvj1okLBKtBFk8J7n0KQquhDND60aU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd80d4b-8186-4915-47fa-08d92c1f26c3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 14:50:55.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdOsZGsvgxP2IWtTg9CtAP5eRQGqpqaZZp4trsV5I0N6SQJl1ucrZDjNzlbPqK2PDYpk/XiuoygcrsUtrzv8uJOUCLNRCq8tHVxvh6Lz0xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1436
X-Proofpoint-GUID: ILcA82kntbe0dipk49qmb6-W2-Gg9qzk
X-Proofpoint-ORIG-GUID: ILcA82kntbe0dipk49qmb6-W2-Gg9qzk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-10_10:2021-06-10,2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100095
Content-Type: multipart/alternative;
 boundary="------------AB3E94F5A8242F104820C134"
Content-Language: en-US

--------------AB3E94F5A8242F104820C134
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

disregard this please!

On 2021-06-10 10:26 a.m., sakib.sajal@windriver.com wrote:
> Bump containernetworking/cni to v0.8.1
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   .../kubernetes/CVE-2021-20206.patch           | 97 +++++++++++++++++++
>   .../kubernetes/kubernetes_git.bb              |  1 +
>   2 files changed, 98 insertions(+)
>   create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> new file mode 100644
> index 0000000..7bdd735
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> @@ -0,0 +1,97 @@
> +From 1ff7fc0a0b8e5ee0bff0c7ba979efcd1ecdb9a39 Mon Sep 17 00:00:00 2001
> +From: Navid Shaikh <navids@vmware.com>
> +Date: Thu, 6 May 2021 15:41:08 +0530
> +Subject: [PATCH] Bump containernetworking/cni to v0.8.1
> +
> + Fix CVE-2021-20206
> +
> +Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
> +CVE: CVE-2021-20206
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + go.mod                                                       | 4 ++--
> + go.sum                                                       | 4 ++--
> + vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 +++++
> + vendor/modules.txt                                           | 4 ++--
> + 4 files changed, 11 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/import/go.mod b/src/import/go.mod
> +index e0ba549ab40..d4cc9ce01a9 100644
> +--- a/src/import/go.mod
> ++++ b/src/import/go.mod
> +@@ -28,7 +28,7 @@ require (
> + 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
> + 	github.com/codegangsta/negroni v1.0.0 // indirect
> + 	github.com/container-storage-interface/spec v1.2.0
> +-	github.com/containernetworking/cni v0.8.0
> ++	github.com/containernetworking/cni v0.8.1
> + 	github.com/coredns/corefile-migration v1.0.10
> + 	github.com/coreos/go-oidc v2.1.0+incompatible
> + 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
> +@@ -214,7 +214,7 @@ replace (
> + 	github.com/containerd/go-runc => github.com/containerd/go-runc v0.0.0-20180907222934-5a6d9f37cfa3
> + 	github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
> + 	github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
> +-	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
> ++	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.1
> + 	github.com/coredns/corefile-migration => github.com/coredns/corefile-migration v1.0.10
> + 	github.com/coreos/bbolt => github.com/coreos/bbolt v1.3.2
> + 	github.com/coreos/etcd => github.com/coreos/etcd v3.3.13+incompatible
> +diff --git a/src/import/go.sum b/src/import/go.sum
> +index 288f4554b1f..9168f49c859 100644
> +--- a/src/import/go.sum
> ++++ b/src/import/go.sum
> +@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2 h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
> + github.com/containerd/ttrpc v1.0.2/go.mod h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=
> + github.com/containerd/typeurl v1.0.1 h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=
> + github.com/containerd/typeurl v1.0.1/go.mod h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=
> +-github.com/containernetworking/cni v0.8.0 h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=
> +-github.com/containernetworking/cni v0.8.0/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
> ++github.com/containernetworking/cni v0.8.1 h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=
> ++github.com/containernetworking/cni v0.8.1/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
> + github.com/coredns/corefile-migration v1.0.10 h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=
> + github.com/coredns/corefile-migration v1.0.10/go.mod h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=
> + github.com/coreos/bbolt v1.3.2 h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=
> +diff --git a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
> +index e815404c859..e62029eb788 100644
> +--- a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
> ++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
> +@@ -18,6 +18,7 @@ import (
> + 	"fmt"
> + 	"os"
> + 	"path/filepath"
> ++	"strings"
> + )
> +
> + // FindInPath returns the full path of the plugin by searching in the provided path
> +@@ -26,6 +27,10 @@ func FindInPath(plugin string, paths []string) (string, error) {
> + 		return "", fmt.Errorf("no plugin name provided")
> + 	}
> +
> ++	if strings.ContainsRune(plugin, os.PathSeparator) {
> ++		return "", fmt.Errorf("invalid plugin name: %s", plugin)
> ++	}
> ++
> + 	if len(paths) == 0 {
> + 		return "", fmt.Errorf("no paths provided")
> + 	}
> +diff --git a/src/import/vendor/modules.txt b/src/import/vendor/modules.txt
> +index 6a263b51686..f549467e77d 100644
> +--- a/src/import/vendor/modules.txt
> ++++ b/src/import/vendor/modules.txt
> +@@ -257,9 +257,9 @@ github.com/containerd/containerd/pkg/dialer
> + github.com/containerd/ttrpc
> + # github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
> + # github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
> +-# github.com/containernetworking/cni v0.8.0 => github.com/containernetworking/cni v0.8.0
> ++# github.com/containernetworking/cni v0.8.1 => github.com/containernetworking/cni v0.8.1
> + ## explicit
> +-# github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
> ++# github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.1
> + github.com/containernetworking/cni/libcni
> + github.com/containernetworking/cni/pkg/invoke
> + github.com/containernetworking/cni/pkg/types
> +--
> +2.25.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 57cadfe..6120116 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=k
>              file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
>              file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
>              file://CVE-2021-25737.patch \
> +           file://CVE-2021-20206.patch \
>             "
>   
>   DEPENDS += "rsync-native \
>
> 
>

--------------AB3E94F5A8242F104820C134
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>disregard this please!<br>
    </p>
    <div class="moz-cite-prefix">On 2021-06-10 10:26 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16873EBBA86BEE9D.24733@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">Bump containernetworking/cni to v0.8.1

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 .../kubernetes/CVE-2021-20206.patch           | 97 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
new file mode 100644
index 0000000..7bdd735
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
@@ -0,0 +1,97 @@
+From 1ff7fc0a0b8e5ee0bff0c7ba979efcd1ecdb9a39 Mon Sep 17 00:00:00 2001
+From: Navid Shaikh <a class="moz-txt-link-rfc2396E" href="mailto:navids@vmware.com">&lt;navids@vmware.com&gt;</a>
+Date: Thu, 6 May 2021 15:41:08 +0530
+Subject: [PATCH] Bump containernetworking/cni to v0.8.1
+
+ Fix CVE-2021-20206
+
+Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
+CVE: CVE-2021-20206
+
+Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ go.mod                                                       | 4 ++--
+ go.sum                                                       | 4 ++--
+ vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 +++++
+ vendor/modules.txt                                           | 4 ++--
+ 4 files changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/src/import/go.mod b/src/import/go.mod
+index e0ba549ab40..d4cc9ce01a9 100644
+--- a/src/import/go.mod
++++ b/src/import/go.mod
+@@ -28,7 +28,7 @@ require (
+ 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
+ 	github.com/codegangsta/negroni v1.0.0 // indirect
+ 	github.com/container-storage-interface/spec v1.2.0
+-	github.com/containernetworking/cni v0.8.0
++	github.com/containernetworking/cni v0.8.1
+ 	github.com/coredns/corefile-migration v1.0.10
+ 	github.com/coreos/go-oidc v2.1.0+incompatible
+ 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
+@@ -214,7 +214,7 @@ replace (
+ 	github.com/containerd/go-runc =&gt; github.com/containerd/go-runc v0.0.0-20180907222934-5a6d9f37cfa3
+ 	github.com/containerd/ttrpc =&gt; github.com/containerd/ttrpc v1.0.2
+ 	github.com/containerd/typeurl =&gt; github.com/containerd/typeurl v1.0.1
+-	github.com/containernetworking/cni =&gt; github.com/containernetworking/cni v0.8.0
++	github.com/containernetworking/cni =&gt; github.com/containernetworking/cni v0.8.1
+ 	github.com/coredns/corefile-migration =&gt; github.com/coredns/corefile-migration v1.0.10
+ 	github.com/coreos/bbolt =&gt; github.com/coreos/bbolt v1.3.2
+ 	github.com/coreos/etcd =&gt; github.com/coreos/etcd v3.3.13+incompatible
+diff --git a/src/import/go.sum b/src/import/go.sum
+index 288f4554b1f..9168f49c859 100644
+--- a/src/import/go.sum
++++ b/src/import/go.sum
+@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2 h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
+ github.com/containerd/ttrpc v1.0.2/go.mod h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=
+ github.com/containerd/typeurl v1.0.1 h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=
+ github.com/containerd/typeurl v1.0.1/go.mod h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=
+-github.com/containernetworking/cni v0.8.0 h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=
+-github.com/containernetworking/cni v0.8.0/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
++github.com/containernetworking/cni v0.8.1 h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=
++github.com/containernetworking/cni v0.8.1/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
+ github.com/coredns/corefile-migration v1.0.10 h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=
+ github.com/coredns/corefile-migration v1.0.10/go.mod h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=
+ github.com/coreos/bbolt v1.3.2 h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=
+diff --git a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
+index e815404c859..e62029eb788 100644
+--- a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
+@@ -18,6 +18,7 @@ import (
+ 	&quot;fmt&quot;
+ 	&quot;os&quot;
+ 	&quot;path/filepath&quot;
++	&quot;strings&quot;
+ )
+ 
+ // FindInPath returns the full path of the plugin by searching in the provided path
+@@ -26,6 +27,10 @@ func FindInPath(plugin string, paths []string) (string, error) {
+ 		return &quot;&quot;, fmt.Errorf(&quot;no plugin name provided&quot;)
+ 	}
+ 
++	if strings.ContainsRune(plugin, os.PathSeparator) {
++		return &quot;&quot;, fmt.Errorf(&quot;invalid plugin name: %s&quot;, plugin)
++	}
++
+ 	if len(paths) == 0 {
+ 		return &quot;&quot;, fmt.Errorf(&quot;no paths provided&quot;)
+ 	}
+diff --git a/src/import/vendor/modules.txt b/src/import/vendor/modules.txt
+index 6a263b51686..f549467e77d 100644
+--- a/src/import/vendor/modules.txt
++++ b/src/import/vendor/modules.txt
+@@ -257,9 +257,9 @@ github.com/containerd/containerd/pkg/dialer
+ github.com/containerd/ttrpc
+ # github.com/containerd/ttrpc =&gt; github.com/containerd/ttrpc v1.0.2
+ # github.com/containerd/typeurl =&gt; github.com/containerd/typeurl v1.0.1
+-# github.com/containernetworking/cni v0.8.0 =&gt; github.com/containernetworking/cni v0.8.0
++# github.com/containernetworking/cni v0.8.1 =&gt; github.com/containernetworking/cni v0.8.1
+ ## explicit
+-# github.com/containernetworking/cni =&gt; github.com/containernetworking/cni v0.8.0
++# github.com/containernetworking/cni =&gt; github.com/containernetworking/cni v0.8.1
+ github.com/containernetworking/cni/libcni
+ github.com/containernetworking/cni/pkg/invoke
+ github.com/containernetworking/cni/pkg/types
+-- 
+2.25.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 57cadfe..6120116 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -17,6 +17,7 @@ SRC_URI = &quot;git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=k
            <a class="moz-txt-link-freetext" href="file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch">file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch">file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2021-25737.patch">file://CVE-2021-25737.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2021-20206.patch">file://CVE-2021-20206.patch</a> \
           &quot;
 
 DEPENDS += &quot;rsync-native \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AB3E94F5A8242F104820C134--
