Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16708.1627886642438104223
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 23:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WfTf3wPJ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3848a07845=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1726i1JB015376;
	Sun, 1 Aug 2021 23:44:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=hIKkL/LD2PpxDK2AI5nulIVGlmKmYPYVvwInyfGc1Hs=;
 b=WfTf3wPJMqBSDqa3oHWTy85bZ3oKxnAEhqewEp8+hRnUXp08/GTz+WfcyWwryk4r4wGb
 /+4Kf4THfDf+4zn+2NUtZ4GSO+jUdonmU3WNvHqAEo0c3jNwQPV/W+zR3AZQJ8w9tWVv
 xH/Qdnt2QgxVlQJWpROdnenmX5/ewmoSK3ilAM6P7Qx7YEpjweP8Jl8j/iFi8mqaxnXQ
 0AXBvnx7Qa04QhAZdBM/hxoZKgwrHPj/hzGEcoyfkPN2Q/8zQmStt5BFh9eVkONUGxRd
 sFUKdzN+sySz+j/g9ws0ov8Sm998ww1FU97qbMq4Fipef1aNnUyy0NF5DrebQ7ABCE4R Og== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a636hr747-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Aug 2021 23:44:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1gvY22ZRmmefVJmL6WCebMXd1uBpsGhKs7mF0J95sSDSOFBb44B+gyWPEv3mpg1voPsiVVajX3pvnN2o50pLQeGa8TH303JQ51A4kGZ+/qoo2Q8gX3OwtDlgyeWV0OvC+pZG/aKGKwuzzWPTapT7fsT6WKW1iOCbZ7xJijtszjpBM3RJ5FmS1x9nMCjo4INJ/FPnccfcpl6juaV/cNIX2h9xSk5pPWeMC2Gw97N6mn8qnuUQ2qSrYjbcq4+XF5WkaVxEB6Gh3A7Vdpzg89y4fi8YWFWahRrwOr0bA/4nvt1O7aadM164Khz9umXKAbvlfpuZ22uz6x299HV2OpKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIKkL/LD2PpxDK2AI5nulIVGlmKmYPYVvwInyfGc1Hs=;
 b=IK0+EieEZE65EBTGycgINYwVkCs0TIWyTupbDHSeWRHHa6ohg1apwfTzedSrv/C5SjM/F53B/wKlVr59WADoLgMN1qx0wbIO0jbzLvZssIqQoVeWt+X1R0KxSP9JjZgWBDdwpqfcXcBdvFOVvyFcjUWbUIEH3E3lJLNw24PaINIC7YPAC4/9c9vbsZnKlrcwCkj0c4NFMRqgnpj51miF1u1XkLCOT6XS4BHEf8iAK7LhsLFp4iboCmDbqf1xcw7eePM6/qrOHjvlG3//aLN1lISDi7rp3lI6Pbpk5bcn915OuMtiTVf9ORaEORu9XLIizTmTDoDMxNCvAf+SPBDHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL0PR11MB3011.namprd11.prod.outlook.com (2603:10b6:208:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Mon, 2 Aug
 2021 06:43:58 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 06:43:58 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH] k8s: update kernel configuration features
Thread-Topic: [meta-virtualization] [PATCH] k8s: update kernel configuration
 features
Thread-Index: AQHXfdpR3cdxy8VsUEukko3y4kcYA6taGWmAgAW+MVU=
Date: Mon, 2 Aug 2021 06:43:58 +0000
Message-ID: 
 <BL1PR11MB5478EF22AC0B955EDBEA267EFFEF9@BL1PR11MB5478.namprd11.prod.outlook.com>
References: 
 <20210721031414.14596-1-qiang.zhang@windriver.com>,<20210729150107.GD40673@gmail.com>
In-Reply-To: <20210729150107.GD40673@gmail.com>
Accept-Language: en-001, zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2669271-878a-4c44-aaf1-08d95580e808
x-ms-traffictypediagnostic: BL0PR11MB3011:
x-microsoft-antispam-prvs: 
 <BL0PR11MB30115935667C716206347023FFEF9@BL0PR11MB3011.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T4lSQDlilV3tX+OQbw4gxX9GzzNREwbcGeWDIkHVNp416K9kKcGwhE1K1XS6EoNXQ7LSd6p4DKSQ81YgdIrX8vosqqHSa2BGLqptEpXvXv0EVCnzwJ/AHubQ1MkCXlDVXk4Bi5zCrI+YxHDfv1QFZF5NcL3dDyMaECfH/DRtu8puJ/kC0Apk0Hd3v2+BcdnLhdz6OQ5A3lc6xFneZoPMtuxA8f8wgFT5F6fx/V5MwL9NFeAWNJWtcsOMucTT1sdmHZhDVSUuwfpF+fX5cvzTryC5Pq8qI6Y68VEtsPycP7MkoP51c8sQ67zDV0jm3AODjTZ4GO00TZRGz5gDrGRrw0hFvYC6N54tzlXlrCokiuoIjHXcOZUi3P8N5Jpx5lIIAdCxBG7YdOmcBOiKpeWvQ05Zn1AnNjv7UAOl7J4v4aI2EuSF6MKp0lgJakGcUjbkAITt2T2v+34aJjqHgc8TxGmATQUcWVNgJGN1GmUEuVOyGDzd5PO8umcL4i26ZPB8E+/sO0Lb0/u737rvPjps8KR/4ES26Y53td1t9hWYVgaINUevh1HLocXUnVIxfCc0BczIpzGH903zdTVCieRZT90EBCPxv4MsWHHV2ST88HlN+v0/Jh6W7A5q1k2fjg3sEJ0wkHRjA35X/J5zINu6ahYxkGLsCCSHkLX8NJIR0BEGKmZzjI3E2MxhUC+yvpcAMm9usiQ0hva7aaBAp++py2WyxzU/bu/74t2OasjnEb4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39840400004)(136003)(396003)(366004)(478600001)(76116006)(91956017)(55016002)(71200400001)(7696005)(15650500001)(38070700005)(122000001)(38100700002)(2906002)(316002)(26005)(33656002)(83380400001)(6506007)(4326008)(53546011)(8676002)(186003)(6916009)(8936002)(52536014)(5660300002)(66446008)(66946007)(66556008)(86362001)(9686003)(64756008)(66476007)(586874002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hO//69Acuys60cCtkkyscfsYH+qb28Z+7azBPG4awdWIk4CI0E/s2Xf8gRA4?=
 =?us-ascii?Q?SfMhKXsd/4R+3yt7ajOPTbswL7Ot5b6Uf+MxhjhwO8QGfYj5peKpdCCCKf/u?=
 =?us-ascii?Q?zmov5r+4KvEtEOb4qNsE6cQRWcCRfEArnZpeeKywklb3pBW1UYrLPD040t05?=
 =?us-ascii?Q?WoxDbtb9uu88CMPbsd6ZA6RRhsu+AroyZYOB2mpYQTIlUFg62f/alsii/L4t?=
 =?us-ascii?Q?3Bh5plv+XOOnAzrUd6yEBouZnvC1WyTJq5dVxR+UKI0FI1dz7RKYWBlLqfwD?=
 =?us-ascii?Q?iiAfdTPMapgukHv9jGPnJfvS631A2OUurPobSCkKfZBe63Wf/mfrAp1SZKOT?=
 =?us-ascii?Q?Hn9YiQTOAC4YO+1CKQ+HIBVObqlR4AI7qznIYVIfztEFR8dOxgQESOm2Llp0?=
 =?us-ascii?Q?qYk0RR3TzWmZUKv1dEl1n23oHsgLUW4TBDQq30L3jnfjbK84Pm2Xc0CuPLw0?=
 =?us-ascii?Q?qvXrMxu192EO89t8al/rm+lbfqnkJJqOHfQ0M4f3laNMHjM+5YEjhbWO7fyB?=
 =?us-ascii?Q?6RmXjJso6mMdrArUTBVuz/c7FsvtxVutN2gKVJUKIMshd+ANfuDGvcpvJ5Dx?=
 =?us-ascii?Q?3DmN9NdT6xt1ZRjAiMjWI4dlQcAnB0VjnyPcxQ30Wl/d3dl9gu2gDCdY8jIU?=
 =?us-ascii?Q?+am8eZmENpEso7ZiMkr5JfHiMiMDa1KoFIIdSq3ruPPRHISXQ5KTAvhaSOUm?=
 =?us-ascii?Q?cYh0sloK3z3U2xO9gQqobTCUpjCAMOx1zOm+rlXU4zJwZb8wyF5prcQTe4/H?=
 =?us-ascii?Q?ghLqrPbhZ9DoWSgvzELbxqJLkANUXOO/HeEUKWpLLXXTWXtejDTHEZb4O+4o?=
 =?us-ascii?Q?c3FU0GnJqj64fpyWZqV2Kxu8/WIuvqCRM4SIS3NsSwxxt46PSzjQB9uH4qsZ?=
 =?us-ascii?Q?YLzqsdNNjXNeXLr6KgpVndctKpfmLr2CwDhirfOtD/aOs1QFWiGQceooqPfZ?=
 =?us-ascii?Q?SHDxIbkbzalYzmMaxD2HGgB5U/YQWHzkURSkZE6bsgjV8Ec5/LfdJ/YkOW3X?=
 =?us-ascii?Q?txcFI3JTEhVjCFZ0kmfZQ+C6iGubap8XYgVim46aJICupBmrl31lU3rI2hXK?=
 =?us-ascii?Q?8CarSrJjVhYb0gBJOOr40u/HvDJNCWQWIumquF5IZ982HYO6FkMGnSSHN+ri?=
 =?us-ascii?Q?1OUIRaxhxWAn3oQRttcGbL+zvrQgZW6LFiW14sRo1KswAOPdEOuuU65ZqEgU?=
 =?us-ascii?Q?vUkXQEw7WrT2vkYdhqfTzze03pKDTxcu7nulk6QjhOQVGpVUswAIT5txzDVz?=
 =?us-ascii?Q?rqEmhmxtXhVIAOErIMObbNboPAojv6/n3n/J80KjnNAPVxwL0KLGyVkISomO?=
 =?us-ascii?Q?FpA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2669271-878a-4c44-aaf1-08d95580e808
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 06:43:58.5318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2FnC026hAOdE+nmmMpFBX2CkN1mwl+34MC/Sq2YzslS2IgNjYrJGBmgnVB+heIe3Jhiranmdqfztl7ulUb6zBI1hZDkWDIE41LVD8tHohs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3011
X-Proofpoint-GUID: qNy4vNzZXaxZziI5oXwbqZhJoa4Y7S4j
X-Proofpoint-ORIG-GUID: qNy4vNzZXaxZziI5oXwbqZhJoa4Y7S4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_01,2021-08-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020047
Content-Language: aa
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
=0A=
________________________________________=0A=
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Bruce Ashfield <bruce.ashfield@gmail.com>=
=0A=
Sent: Thursday, 29 July 2021 23:01=0A=
To: Zhang, Qiang=0A=
Cc: meta-virtualization@lists.yoctoproject.org=0A=
Subject: Re: [meta-virtualization] [PATCH] k8s: update kernel configuration=
 features=0A=
=0A=
[Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
=0A=
>I've merged this for now, but in the next month, I'll be moving all of=0A=
>the layer fragments to the kernel-cache, and at that time, we should=0A=
>be re-using fragments that already provide similar options, versus simply=
=0A=
>listing them all in the k8s fragment.=0A=
>=0A=
>I'll take care of those changes, but I just wanted to give a heads up.=0A=
>=0A=
=0A=
Thanks Bruce=0A=
=0A=
>Bruce=0A=
=0A=
>In message: [meta-virtualization] [PATCH] k8s: update kernel configuration=
 >features=0A=
>on 21/07/2021 qiang.zhang@windriver.com wrote:=0A=
=0A=
> From: Zqiang <qiang.zhang@windriver.com>=0A=
>=0A=
> Add kernel config fragment according to the requirement from the file=0A=
> types_unix.go in source codes of kubernetes.=0A=
>=0A=
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>=0A=
> ---=0A=
>  .../linux/linux-yocto/kubernetes.cfg           | 18 +++++++++++++++++-=
=0A=
>  1 file changed, 17 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-ke=
rnel/linux/linux-yocto/kubernetes.cfg=0A=
> index c3e90d43..2d4e1f54 100644=0A=
> --- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg=0A=
> +++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg=0A=
> @@ -16,4 +16,20 @@ CONFIG_IP_VS_RR=3Dm=0A=
>  CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm=0A=
>  CONFIG_NETFILTER_XT_MATCH_MARK=3Dm=0A=
>  CONFIG_NETFILTER_XT_CONNMARK=3Dm=0A=
> -=0A=
> +CONFIG_NAMESPACES=3Dy=0A=
> +CONFIG_NET_NS=3Dy=0A=
> +CONFIG_PID_NS=3Dy=0A=
> +CONFIG_IPC_NS=3Dy=0A=
> +CONFIG_UTS_NS=3Dy=0A=
> +CONFIG_CGROUPS=3Dy=0A=
> +CONFIG_CGROUP_CPUACCT=3Dy=0A=
> +CONFIG_CGROUP_DEVICE=3Dy=0A=
> +CONFIG_CGROUP_FREEZER=3Dy=0A=
> +CONFIG_CGROUP_SCHED=3Dy=0A=
> +CONFIG_SMP=3Dy=0A=
> +CONFIG_CPUSETS=3Dy=0A=
> +CONFIG_MEMCG=3Dy=0A=
> +CONFIG_INET=3Dy=0A=
> +CONFIG_EXT4_FS=3Dy=0A=
> +CONFIG_PROC_FS=3Dy=0A=
> +CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm=0A=
> --=0A=
> 2.29.2=0A=
>=0A=
