Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CE7C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 11:18:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.197692.1698319092382337086
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 04:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AJFX8V89;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8663b5f2bc=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39Q6ieH3003237;
	Thu, 26 Oct 2023 11:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=wKRO9o9DhaJdNI58Ze
	rOrHi4ejSNfZzRTjquw/z9mw8=; b=AJFX8V89yBVa4LWIgS3UER9O9YYcrO22MP
	nRqWKhZmvJ5aHoWfAaOPAWNgjLut24vtTHY7I//PVHIA8svemGdsW0xNOMYd/UkX
	LDhHhRSJ1o5jY8DjyCoFjqOaa5+V6hTfMe7cegNMZYmvFSPYxHGebHxlp2gsutqP
	+alKM4f2bKe0vhWJ4zG+btz/B1ibyP/AjPbtrHPsMbcrHEgw08x110tOzM+UaXEd
	5jbbHCs3Pdx6ezLPxMNeI7vVaoz26YgTYoad/QSWnHv+j+y7sj4+4qW/mrFqyos4
	+73WOtxcq+8ZIlxuLLvU8HrBuGIiGNZz/QOd+Whk9uVV19pjcX+g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv5m5wmgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 11:18:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ9xn218Uz+KJSP/Og5hwgwdulC1hRIptISbalSHpc/WNhqeznB2+7N0hdx864Tm99k1G2AtWxcbyVofDEa0WlEnkXk3K1/YSQzW6viZAN6bYIdznWz1CVeKiuvhwgdoznZuzg0irbpAIun1VGz2LnJd83WT+74eakdB63VH9seaN+UxdyuygmLVc1UCI9YVYzJDwVdSlRrvzc28HyUolNhn4ZkaVzxwq848UQnpa7EbopEgEUICOFHy44L2U5S/YuvPGaD53FbfoZ3bMXWhiQXlS6hkzJae1Cgf+XvtMpu98qVsNCoZ1u72xj7g5ASzrF00qOYjndmPh9uJ9xKU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKRO9o9DhaJdNI58ZerOrHi4ejSNfZzRTjquw/z9mw8=;
 b=OyBGpSa2kYFZbUYFQSvj1VfCM5sKpfOdUAojlc0ELJCYrWNfjrkJrbEjHTN6a03Mca6ROw2k2BLZrvKUjKiirZnvgCLQz7esR8WGL0DlreJ+F6d3LxfW9YC6gOKgCVaQu+HOEZTlRcoA5cIJqN3IC22k3/sJnS4e+AKTb2W19EiIR2CC+KzSHGMRqK7B8AtP92AIgJJPrPCjDri4qWYsYy7z77HKDl48LYo9I5l2DnK5nRyFZ3oKyhpjTX3eq1QSkA1so1XCiJx7uYWeGdCYcGQrNDl5dcWbv9taySRFydTjmTYV28us3fUgJ8hZnrZZ/HiHMPMspQMCZd6pvP7HQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by DS0PR11MB7460.namprd11.prod.outlook.com (2603:10b6:8:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Thu, 26 Oct
 2023 11:18:06 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::4c7d:539d:8cef:e4d1]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::4c7d:539d:8cef:e4d1%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 11:18:05 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
        "Sambu, Soumya"
	<Soumya.Sambu@windriver.com>,
        "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][mickledore][PATCH v3 1/1] kubernetes:
 Upgrade v1.27.1 -> v1.27.5
Thread-Topic: [meta-virtualization][mickledore][PATCH v3 1/1] kubernetes:
 Upgrade v1.27.1 -> v1.27.5
Thread-Index: AQHaB/2BIzOgW7ygZ0CzB7SSp87CVrBb6y2c
Date: Thu, 26 Oct 2023 11:18:05 +0000
Message-ID: 
 <BYAPR11MB339736CD2663FA3421CD6FC681DDA@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <1791A3F91AFAC571.20272@lists.yoctoproject.org>
In-Reply-To: <1791A3F91AFAC571.20272@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|DS0PR11MB7460:EE_
x-ms-office365-filtering-correlation-id: 2d6d8e4b-c5ed-40ab-b9f3-08dbd61539d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2j1ZlApHZop7klEXMRgDmGuKpDVCiRQIg0RvG18CD99bPmDSCYYC1C/kew44i8Z1cQhbLf7cbFXGm/r4sefNdzZPwZg1rQRqLjYN5qpOXQxhxCnWeg7KQEXQAHo/rjCq9wU5eNRj+Zp8arcxdPcDvOENJASvK6cyrw1d2k9hyxu8W7ITyJ1lNdxUwNxdLAernGM0UaebJSTktCfJ3Lzd6GTsLU+WoO2Hir9X/XpVh4PKOifC1sMdFZGg8I4LdacGn19ltSN6KPgH9ia2CDBFGuBP28boSlHqZMJgTOoiIDa58osPEd8TzrHqQ35FoMSgd+hDGgIvKoTBtctXwEEu5ZZFgokTWtiMk0smNE6I41KonFF3lMSkYr/KaDEaQchzY7PbQ1/Ck6XowifioQtaOhr982kNMZAMFpJl8BA72wuv96pz95kEI9iDwyPULJeOF+Vnkis4hQ16bVIED/kA0NjoJMNTttrF4n5RaTM93LgyNpl1qSyhPrMQf/TlQ6vu2ONLzaDH9HqsEiOS89tqqaOBceEzpGVU+jOQk2Vxe3NHzaZlXdjhITDC8aGpGeVNYjZTPoxBd6vDmb/qE3tvj8eWz47mGRERqNBu84Ynu10=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39850400004)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(19627405001)(38070700009)(55016003)(30864003)(83380400001)(2906002)(38100700002)(26005)(8676002)(52536014)(33656002)(166002)(71200400001)(122000001)(7696005)(86362001)(9686003)(66476007)(8936002)(6506007)(478600001)(316002)(5660300002)(76116006)(110136005)(66556008)(41300700001)(66946007)(64756008)(91956017)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?O8pXyoSYwgGbsEaDiyRr4SImTKJhgzCwdrsxU13V444TL2l7xI7GyJvUJjJX?=
 =?us-ascii?Q?LU6CTlY3RL67v5dIQzn53IR8yq7wxdOC98n/DAuo0eWLRbTvp78PPQy5rWIa?=
 =?us-ascii?Q?W4PDIBfDWG61wiSsn3RkjuWRUknH8wpUZJ8FN8usJ0cGj80tVgSYE5DPKYuL?=
 =?us-ascii?Q?/hSQidD9bYG2xQnk8XwFAofDzGwMipEKvVYJmM5yDJDlvdzoWV4/hD8pTIFu?=
 =?us-ascii?Q?L+0a2dVlGLWtPiPtTCmInGPfLxQ8PTnz8Q/wyHgel+LNZLYfvWi4WUfMJu0b?=
 =?us-ascii?Q?kp3z32w299Id7TYEO1n/42zznCGyo7TdJMHSQcQSYSogZGtbbi7IFrbxMXpA?=
 =?us-ascii?Q?SRjcP1vrnP6IWEHXHU5n5pK3w9T2jPr1FsA+kE+KxOL1HyzNPup0v/l9KAdP?=
 =?us-ascii?Q?v97bTz1ULslofu/ApsA0rdXyMT/+kV9J1Wy91gR6CWeHxjwap2l+T8If1Vor?=
 =?us-ascii?Q?cB0w7KlhD+HX7TeXimQuLx7HPEE6SySyqDwHjMvrPytCvYUQkbwmONa7elhM?=
 =?us-ascii?Q?w9pJAd3kkR8/EbUJXGrtN826WEvTSkyyHB3ujrxhQ1MrLc2hzzOAg/j5tHSN?=
 =?us-ascii?Q?ZHFrdSzJ23rPBbqh2kMY2fIHqGBAkNxjldj6veoQoHamoL8jowzzXsm0W7+i?=
 =?us-ascii?Q?wr8L6Aak7UATCTeUOJvwuI78TEdyxFJMCtO2qJpSaUhxeMtBAwGPajH1j2Tt?=
 =?us-ascii?Q?VUUtmkYsE7hRJ90dBNnv0UOsnYiO7KrbLIlZJhhu9Xu2+zPreRM+HVAvZUgR?=
 =?us-ascii?Q?d5M1rdaqmdugyBPkR/fEOB4Vf33FX/20+kYM3p+c7fJ3luOZfZkiXwcPY+MX?=
 =?us-ascii?Q?UBYiaCujApY3shvVZ0WcyJsVqWI9IfLVseJWdInK53r9WsGEAsQ+t6+2qLrZ?=
 =?us-ascii?Q?IIcTUmk45IGfpblSL+/9pvwuIyR2Ae4Jw4oAk2XZ8l4mygeMeQlBmo0HFeTI?=
 =?us-ascii?Q?jMnm2BUcDDBjC9OPzc0RX8GnGreHCJbd/Dy50Ohk61ozboFXo5QhnnmNvxMJ?=
 =?us-ascii?Q?4oVbVffhZnkLIMxok4xIXALU04xhtZmeKyuNylyg73Qi/+4IjfZn8zlJ1BLF?=
 =?us-ascii?Q?dtJKUpj3j+LVbxA1dR3iQRaP11gAXzwhKLfYVwtPIHyjcrufrCRKwWTeP7+f?=
 =?us-ascii?Q?j7kCM/UwCJbT41lIJD5hrI7vNR03SsAlaRvjFkQ1Mq6u0hNcB3SczhY5KJi/?=
 =?us-ascii?Q?hUNpVb8t5sAZBsYsLzacQ7dFFrYnLp8nzhy8pm8Xxqbgxvew/ERmjnOOmiFd?=
 =?us-ascii?Q?Wf4995uWlsiGxVrXBtNQEofHtpQpc6MCYktg7hFujJmPOskC4Xzc9wS4pSOJ?=
 =?us-ascii?Q?5SXNOmHaj7pRkE+kkzhkqYZWScP0BlNjFq6K/8TePUuYjgW3YxaAHkN8PLr0?=
 =?us-ascii?Q?n5s7k0x5OXEj9sZuFzutFi8Njc1y3dP1hcFlm3zVBea6WR0qmsEkrUKauBFb?=
 =?us-ascii?Q?WiHYNCPQGz+NAjDFwJZWIkKORl8ssBHTfTokGZU/ZnrrisHlsmp30Qc4STcN?=
 =?us-ascii?Q?Qm2g95zwjMvQyhm2WU1Fw9NTrekimPLpsfXZUWlWKjxYmRyz/H2elgsfUE8L?=
 =?us-ascii?Q?liy9bwSgfLs06lY97KXcTU+MS2fCl99bjelN6V3b?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB339736CD2663FA3421CD6FC681DDABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6d8e4b-c5ed-40ab-b9f3-08dbd61539d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 11:18:05.5146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWA2jl1ZLlCaVu+bZYaEneHLiOGWKdyEq28Um9odgbXx3+YeLGGvL0uB9k67zV7kfOgAIQ+6hIjXUCbKbkgrppC0Xp6r8dULc4KyBXV8Y9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7460
X-Proofpoint-GUID: 5kGgbSsOFgdwRl4MCia1UCkuQ-R-_exV
X-Proofpoint-ORIG-GUID: 5kGgbSsOFgdwRl4MCia1UCkuQ-R-_exV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_09,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310260096
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Oct 2023 11:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8398

--_000_BYAPR11MB339736CD2663FA3421CD6FC681DDABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Below are the CVEs which are resolved with this upgrade in mickledore branc=
h, with vulnerable version details:

CVE-2023-2431 :
Affected Versions
v1.27.0 - v1.27.1
v1.26.0 - v1.26.4
v1.25.0 - v1.25.9
<=3D v1.24.13

CVE-2023-2727,  CVE-2023-2728:
Affected Versions
v1.27.0 - v1.27.2
v1.26.0 - v1.26.5
v1.25.0 - v1.25.10
<=3D v1.24.14

CVE-2023-3676, CVE-2023-3955:
Affected Versions
<=3D v1.28.0
<=3D v1.27.4
<=3D v1.26.7
<=3D v1.25.12
<=3D v1.24.16

master-next branch has kubernetes 1.28.2 version [https://git.yoctoproject.=
org/meta-virtualization/commit/?h=3Dmaster-next&id=3Dcfa0c956138814c1dcef26=
879cf240159bb7f097], not impacted by above mentioned CVEs.

kirkstone branch has kubernetes v1.23.17 version, which is impacted by abov=
e CVEs. I am planning to backport fixes for these CVEs on kirkstone branch.

Regards,
Soumya
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Soumya via lists.yoctoproject.org <soumya.s=
ambu=3Dwindriver.com@lists.yoctoproject.org>
Sent: Thursday, October 26, 2023 4:43 PM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: [meta-virtualization][mickledore][PATCH v3 1/1] kubernetes: Upgrad=
e v1.27.1 -> v1.27.5

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses CVE-2023-2431, CVE-2023-2727, CVE-2023-2728, CVE-2023-3676, CVE-2=
023-3955 and few other bugs.

Bumping kubernetes to version v1.27.5, which comprises the following commit=
s:

    38c97fa67ed Merge pull request #120135 from ritazh/cherry-pick-cve-2023=
-3955-1.27
    89048339422 Merge pull request #120130 from ritazh/cherry-pick-cve-2023=
-3676-1.27
    acc29048e6d Use environment varaibles for parameters in Powershell
    172644fb55d Use env varaibles for passing path
    00dfa0634be Merge pull request #119868 from liggitt/automated-cherry-pi=
ck-of-#119835-upstream-release-1.27
    3b6bcaa0b96 Avoid returning nil responseKind in v1beta1 aggregated disc=
overy
    bd722aa3ff5 Merge pull request #119828 from jeremyrickard/go1207-1.27
    94b3e00eef0 [release-1.27] releng/go: Bump images, versions and deps to=
 use Go 1.20.7
    de56018f04a Merge pull request #117269 from tnqn/automated-cherry-pick-=
of-#117245-#117249-upstream-release-1.27
    521580378aa Merge pull request #119363 from jsafrane/automated-cherry-p=
ick-of-#117804-upstream-release-1.27
    d35a1c8a7a7 Merge pull request #119620 from liggitt/automated-cherry-pi=
ck-of-#117710-upstream-release-1.27
    579208d9616 Merge pull request #117486 from TommyStarK/automated-cherry=
-pick-of-#117449-upstream-release-1.27
    2ac615ccde3 Merge pull request #117235 from cvvz/automated-cherry-pick-=
of-#116134-origin-release-1.27
    559f43d49c6 Merge pull request #119466 from mimowo/automated-cherry-pic=
k-of-#119434-upstream-release-1.27
    382c283f339 Merge pull request #119113 from champtar/automated-cherry-p=
ick-of-#118922-upstream-release-1.27
    05b64c6b5e1 Merge pull request #119604 from a7i/automated-cherry-pick-o=
f-#118549-upstream-release-1.27
    ecd45047e45 Merge pull request #119572 from andrewsykim/automated-cherr=
y-pick-of-#118601-origin-release-1.27
    927dba2589a e2e_node: move getSampleDevicePluginPod to device_plugin_te=
st.go
    db832fdfa67 fix 'pod' in kubelet prober metrics
    4c67c5d5e76 priority & fairness: support dynamically configuring work e=
stimator max seats
    6d31f4b31ba Merge pull request #119519 from jingxu97/automated-cherry-p=
ick-of-#118451-upstream-release-1.27
    17c98720e84 Add mininumKubelet tag into ReadWriteOncePod test
    ed0cdc9e0b2 Include ignored pods when computing backoff delay for Job p=
od failures
    ae24a5cf74b Remarks
    9e1050b4d90 Adjust the algorithm for computing the pod finish time
    fa950050cc9 Update CHANGELOG/CHANGELOG-1.27.md for v1.27.4
    fa3d7990104 Release commit for Kubernetes v1.27.4
    d794e0e5cf8 Merge pull request #119366 from xmudrii/go1206-1.27
    a1b127ca7a1 [release-1.27] releng/go: Bump images, versions and deps to=
 use Go 1.20.6
    aefc4d0392a Rename updateReconstructedFromAPIServer
    eeba02fc625 Rename volumesNeedDevicePath
    5eb3b748e8e Update volumesInUse after attachability is confirmed
    f8bb161ab55 Add uncertain state of volume attach-ability
    08b7937d256 Refactor FindAttachablePluginBySpec out of CSI code path
    16fc1c954ce Merge pull request #119262 from HirazawaUi/automated-cherry=
-pick-of-#119229-upstream-release-1.27
    3ca3e0ad484 Merge pull request #118947 from Evan-Reilly/automated-cherr=
y-pick-of-#118237-upstream-release-1.27
    5ee5d7346e1 Merge pull request #119096 from aleksandra-malinowska/autom=
ated-cherry-pick-of-#117865-upstream-release-1.27
    1484a5c32f0 Fix the converts an empty string to nil.
    b5c876a05b7 Merge pull request #117226 from princepereira/automated-che=
rry-pick-of-#116749-upstream-release-1.27
    d98c5b8a026 Merge pull request #119160 from alculquicondor/automated-ch=
erry-pick-of-#119159-upstream-release-1.27
    28c79be6747 Add unit tests for parallel StatefulSet create & delete
    66f980be120 Parallel StatefulSet pod create & delete
    288504fbf8d Refactor StatefulSet controller update logic
    92a0f58e2bf Only declare job as finished after removing all finalizers
    c655001fa48 Automated cherry pick of #118716 upstream release 1.27 (#11=
8911)
    052ac3eb1bf Merge pull request #119065 from xmudrii/automated-cherry-pi=
ck-of-#118899-upstream-release-1.27
    b667da8e08a Merge pull request #118683 from serathius/automated-cherry-=
pick-of-#118460-origin-release-1.27
    f8c1cc33cb6 Merge pull request #119139 from kmala/1.27
    5bbacb11989 Merge pull request #118290 from HirazawaUi/automated-cherry=
-pick-of-#118177-upstream-release-1.27
    b383755e462 Hide numberOfMissedSchedules as an algorithm internal numbe=
r
    26db84e04c7 Update schedule logic to properly calculate missed schedule=
s
    fe4e288bcdd Merge pull request #118855 from aojea/automated-cherry-pick=
-of-#118686-upstream-release-1.27
    a54590f218d Merge pull request #117936 from jsafrane/automated-cherry-p=
ick-of-#117243-upstream-release-1.27
    ad569aec159 kubeadm: backdate generated CAs by 5 minutes
    0fc5c972129 client-go: allow to set NotBefore in NewSelfSignedCACert()
    0ed276fb568 Merge pull request #118199 from aleskandro/automated-cherry=
-pick-of-#118053-origin-release-1.27
    04e86095d38 Merge pull request #118930 from atiratree/automated-cherry-=
pick-of-#118876-upstream-release-1.27
    3c115eec0b9 Automated cherry pick of #118805: test comment should match=
 the code in podgc (#118913)
    db247e1df34 Merge pull request #118969 from champtar/automated-cherry-p=
ick-of-#117791-upstream-release-1.27
    55872a8eb12 Merge pull request #119086 from neolit123/automated-cherry-=
pick-of-#118150-origin-release-1.27
    39a4cd1a083 call ./hack/update-vendor.sh
    33af2a45f53 kubeadm: remove function pointer comparison in phase test
    3f4643682e3 CHANGELOG-1.27: Add note for AWS in-tree provider removal
    703edddae4e Updating the nodeAffinity of gated pods having nil affinity=
 should be allowed
    3b874af3878 Merge pull request #118662 from mkowalski/automated-cherry-=
pick-of-#118329-upstream-release-1.27
    d936e6669bb Merge pull request #118841 from bobbypage/automated-cherry-=
pick-of-#118497-upstream-release-1.27
    3aa21cec0ec fix the existing problem (0 SerialNumber in all certificate=
) as part of this PR in a separate commit
    cd08820ba9a update serial number to a valid non-zero number in ca certi=
ficate
    5253d8e02c7 Merge pull request #118664 from pohly/automated-cherry-pick=
-of-#118524-origin-release-1.27
    76b9400cea3 Merge pull request #118283 from pohly/automated-cherry-pick=
-of-#118257-origin-release-1.27
    1260b845752 Delete CRDs created during field validation tests.
    f689046fb6b kubectl explain should work for both cluster and namespace =
resources and without a GET method
    f7d82bfdffe Merge pull request #118797 from harche/1.27_cadvisor_bump
    59cd1d0b3bb always execute condition for wait.PollUntilContextTimeout w=
ith immediate=3Dtrue
    5423fffca9d Review remarks to improve HandlePodCleanups in kubelet
    24c67c15240 Fix the deletion of rejected pods
    0539a6a194a Merge pull request #118821 from helayoty/automated-cherry-p=
ick-of-#118049-upstream-release-1.27
    62cf5ee1cdb Unset gated pod info timestamp in addToActiveQ
    027b4632bbb deps: Bump to cAdvisor v0.47.2
    ea2af58b5bd Make etcd component status consistent with health probes
    f2548642c4e e2e storage: terminate worker quietly on test completion
    9a001cea215 Fix flaky persistent volumes e2e test
    eb5825b3a3c Set the node-ips annotation correctly with CloudDualStackNo=
deIPs
    a2ba2626e85 Update CHANGELOG/CHANGELOG-1.27.md for v1.27.3
    25b4e43193b Release commit for Kubernetes v1.27.3
    aae883e5fa7 Merge pull request #118553 from puerco/bump-1.27-go1.20.5
    e13e5915a78 Merge pull request #118307 from SataQiu/automated-cherry-pi=
ck-of-#117169-upstream-release-1.27
    e0a2a6efdd1 update-vendor: update vendored go.sums
    82b2c5aefa3 releng/go: Update images, dependencies and version to Go 1.=
20.5
    e2cc1a3b21b Merge pull request #118515 from aojea/automated-cherry-pick=
-of-#118499-upstream-release-1.27
    3a77d5a59f0 Merge pull request #118471 from ritazh/automated-cherry-pic=
k-of-#118356-upstream-release-1.27
    b30e94b1253 kube-proxy avoid race condition using LocalModeNodeCIDR
    5e00018fccf Merge pull request #117948 from dlipovetsky/automated-cherr=
y-pick-of-#117792-#117724-upstream-release-1.27
    76f14499624 Merge pull request #118281 from aojea/automated-cherry-pick=
-of-#118256-upstream-release-1.27
    d59b91d97b4 Add ephemeralcontainer to imagepolicy securityaccount admis=
sion plugin
    d71d96a5d24 Merge pull request #118219 from mimowo/automated-cherry-pic=
k-of-#117586-upstream-release-1.27
    c48bdec2ced Merge pull request #118279 from aojea/automated-cherry-pick=
-of-#118200-upstream-release-1.27
    c345ce91a03 supported version of etcd 3.5.7-0 for Kubernetes v1.27.0-rc=
.0
    22e8a99ec6e Fix the git-repo test error caused by the correct use of lo=
op variables
    009a7a6fb9f dra scheduler plugin test: fix loopvar bug and "reserve" ex=
pected data
    7888798873e e2e framework retry on Service unavailable errors
    f41a169a354 e2e: apply timeout for CSI Storage Capacity test only to no=
de
    916bc55a7bf Merge pull request #118178 from HirazawaUi/automated-cherry=
-pick-of-#118156-upstream-release-1.27
    e407c2b4b02 Add DisruptionTarget condition when preempting for critical=
 pod
    d2bd738e274 update webhook test to go 1.21
    4025005877a Merge pull request #118105 from SataQiu/automated-cherry-pi=
ck-of-#118069-upstream-release-1.27
    af024b2a086 Merge pull request #118111 from liggitt/automated-cherry-pi=
ck-of-#118104-upstream-release-1.27
    9107eee6583 Test APIService safe handling at startup
    0bff4e35669 Fix waiting for CRD sync at server start
    1ae728f4344 kubeadm: fix a bug where the static pod changes detection l=
ogic is inconsistent with kubelet
    f404d1c4d3c Update CHANGELOG/CHANGELOG-1.27.md for v1.27.2
    7f6f68fdabc Release commit for Kubernetes v1.27.2

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-cont=
ainers/kubernetes/kubernetes_git.bb
index 3a6e7119..560fd8b7 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechani=
sms for deployment, \
 maintenance, and scaling of applications. \
 "

-PV =3D "v1.27.1+git${SRCREV_kubernetes}"
-SRCREV_kubernetes =3D "2555e0f90e80a13628f47eca5cde34decc89babb"
+PV =3D "v1.27.5+git${SRCREV_kubernetes}"
+SRCREV_kubernetes =3D "93e0d7146fb9c3e9f68aa41b2b4265b2fcdb0a4c"
 SRCREV_kubernetes-release =3D "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE =3D "1"

--
2.40.0


--_000_BYAPR11MB339736CD2663FA3421CD6FC681DDABYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">Hi Bruce,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">Below are the CVEs which are resolved =
with this upgrade in mickledore branch, with vulnerable version details:</s=
pan></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><b>CVE-2023-2431 :</b></span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">Affected Versions</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">v1.27.0 - v1.27.1</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">v1.26.0 - v1.26.4</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">v1.25.0 - v1.25.9</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.24.13</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><b>CVE-2023-2727,&nbsp; CVE-2023-2728:=
</b></span></div>
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Calibri, Helvetica, sans-serif; font-size: 12pt; font-weight: 400; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Affected Version=
s</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">v1.27.0 - v1.27.2</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">v1.26.0 - v1.26.5</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">v1.25.0 - v1.25.10</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.24.14</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><b>CVE-2023-3676, CVE-2023-3955:</b></=
span></div>
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Calibri, Helvetica, sans-serif; font-size: 16px; font-weight: 400; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Affected Version=
s</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.28.0</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.27.4</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.26.7</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.25.12</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">&lt;=3D v1.24.16</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><b>master-next</b>&nbsp;branch has kub=
ernetes 1.28.2 version [<a href=3D"https://git.yoctoproject.org/meta-virtua=
lization/commit/?h=3Dmaster-next&amp;id=3Dcfa0c956138814c1dcef26879cf240159=
bb7f097" id=3D"LPlnk833555">https://git.yoctoproject.org/meta-virtualizatio=
n/commit/?h=3Dmaster-next&amp;id=3Dcfa0c956138814c1dcef26879cf240159bb7f097=
</a>],
<b>not impacted </b>by above mentioned CVEs.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);"><b>kirkstone</b>&nbsp;branch has kuber=
netes v1.23.17 version, which is
<b>impacted</b>&nbsp;by above CVEs. I am planning to backport fixes for the=
se CVEs on kirkstone branch.<br>
<br>
Regards,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">Soumya</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Soumya via lists.yoctoproject.org &lt;soumya.sambu=3Dwindriver.c=
om@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> Thursday, October 26, 2023 4:43 PM<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> [meta-virtualization][mickledore][PATCH v3 1/1] kubernetes:=
 Upgrade v1.27.1 -&gt; v1.27.5</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Soumya Sambu &lt;soumya.sambu@windriver.com&=
gt;<br>
<br>
Addresses CVE-2023-2431, CVE-2023-2727, CVE-2023-2728, CVE-2023-3676, CVE-2=
023-3955 and few other bugs.<br>
<br>
Bumping kubernetes to version v1.27.5, which comprises the following commit=
s:<br>
<br>
&nbsp;&nbsp;&nbsp; 38c97fa67ed Merge pull request #120135 from ritazh/cherr=
y-pick-cve-2023-3955-1.27<br>
&nbsp;&nbsp;&nbsp; 89048339422 Merge pull request #120130 from ritazh/cherr=
y-pick-cve-2023-3676-1.27<br>
&nbsp;&nbsp;&nbsp; acc29048e6d Use environment varaibles for parameters in =
Powershell<br>
&nbsp;&nbsp;&nbsp; 172644fb55d Use env varaibles for passing path<br>
&nbsp;&nbsp;&nbsp; 00dfa0634be Merge pull request #119868 from liggitt/auto=
mated-cherry-pick-of-#119835-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 3b6bcaa0b96 Avoid returning nil responseKind in v1beta1 =
aggregated discovery<br>
&nbsp;&nbsp;&nbsp; bd722aa3ff5 Merge pull request #119828 from jeremyrickar=
d/go1207-1.27<br>
&nbsp;&nbsp;&nbsp; 94b3e00eef0 [release-1.27] releng/go: Bump images, versi=
ons and deps to use Go 1.20.7<br>
&nbsp;&nbsp;&nbsp; de56018f04a Merge pull request #117269 from tnqn/automat=
ed-cherry-pick-of-#117245-#117249-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 521580378aa Merge pull request #119363 from jsafrane/aut=
omated-cherry-pick-of-#117804-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; d35a1c8a7a7 Merge pull request #119620 from liggitt/auto=
mated-cherry-pick-of-#117710-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 579208d9616 Merge pull request #117486 from TommyStarK/a=
utomated-cherry-pick-of-#117449-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 2ac615ccde3 Merge pull request #117235 from cvvz/automat=
ed-cherry-pick-of-#116134-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; 559f43d49c6 Merge pull request #119466 from mimowo/autom=
ated-cherry-pick-of-#119434-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 382c283f339 Merge pull request #119113 from champtar/aut=
omated-cherry-pick-of-#118922-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 05b64c6b5e1 Merge pull request #119604 from a7i/automate=
d-cherry-pick-of-#118549-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; ecd45047e45 Merge pull request #119572 from andrewsykim/=
automated-cherry-pick-of-#118601-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; 927dba2589a e2e_node: move getSampleDevicePluginPod to d=
evice_plugin_test.go<br>
&nbsp;&nbsp;&nbsp; db832fdfa67 fix 'pod' in kubelet prober metrics<br>
&nbsp;&nbsp;&nbsp; 4c67c5d5e76 priority &amp; fairness: support dynamically=
 configuring work estimator max seats<br>
&nbsp;&nbsp;&nbsp; 6d31f4b31ba Merge pull request #119519 from jingxu97/aut=
omated-cherry-pick-of-#118451-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 17c98720e84 Add mininumKubelet tag into ReadWriteOncePod=
 test<br>
&nbsp;&nbsp;&nbsp; ed0cdc9e0b2 Include ignored pods when computing backoff =
delay for Job pod failures<br>
&nbsp;&nbsp;&nbsp; ae24a5cf74b Remarks<br>
&nbsp;&nbsp;&nbsp; 9e1050b4d90 Adjust the algorithm for computing the pod f=
inish time<br>
&nbsp;&nbsp;&nbsp; fa950050cc9 Update CHANGELOG/CHANGELOG-1.27.md for v1.27=
.4<br>
&nbsp;&nbsp;&nbsp; fa3d7990104 Release commit for Kubernetes v1.27.4<br>
&nbsp;&nbsp;&nbsp; d794e0e5cf8 Merge pull request #119366 from xmudrii/go12=
06-1.27<br>
&nbsp;&nbsp;&nbsp; a1b127ca7a1 [release-1.27] releng/go: Bump images, versi=
ons and deps to use Go 1.20.6<br>
&nbsp;&nbsp;&nbsp; aefc4d0392a Rename updateReconstructedFromAPIServer<br>
&nbsp;&nbsp;&nbsp; eeba02fc625 Rename volumesNeedDevicePath<br>
&nbsp;&nbsp;&nbsp; 5eb3b748e8e Update volumesInUse after attachability is c=
onfirmed<br>
&nbsp;&nbsp;&nbsp; f8bb161ab55 Add uncertain state of volume attach-ability=
<br>
&nbsp;&nbsp;&nbsp; 08b7937d256 Refactor FindAttachablePluginBySpec out of C=
SI code path<br>
&nbsp;&nbsp;&nbsp; 16fc1c954ce Merge pull request #119262 from HirazawaUi/a=
utomated-cherry-pick-of-#119229-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 3ca3e0ad484 Merge pull request #118947 from Evan-Reilly/=
automated-cherry-pick-of-#118237-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 5ee5d7346e1 Merge pull request #119096 from aleksandra-m=
alinowska/automated-cherry-pick-of-#117865-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 1484a5c32f0 Fix the converts an empty string to nil.<br>
&nbsp;&nbsp;&nbsp; b5c876a05b7 Merge pull request #117226 from princepereir=
a/automated-cherry-pick-of-#116749-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; d98c5b8a026 Merge pull request #119160 from alculquicond=
or/automated-cherry-pick-of-#119159-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 28c79be6747 Add unit tests for parallel StatefulSet crea=
te &amp; delete<br>
&nbsp;&nbsp;&nbsp; 66f980be120 Parallel StatefulSet pod create &amp; delete=
<br>
&nbsp;&nbsp;&nbsp; 288504fbf8d Refactor StatefulSet controller update logic=
<br>
&nbsp;&nbsp;&nbsp; 92a0f58e2bf Only declare job as finished after removing =
all finalizers<br>
&nbsp;&nbsp;&nbsp; c655001fa48 Automated cherry pick of #118716 upstream re=
lease 1.27 (#118911)<br>
&nbsp;&nbsp;&nbsp; 052ac3eb1bf Merge pull request #119065 from xmudrii/auto=
mated-cherry-pick-of-#118899-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; b667da8e08a Merge pull request #118683 from serathius/au=
tomated-cherry-pick-of-#118460-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; f8c1cc33cb6 Merge pull request #119139 from kmala/1.27<b=
r>
&nbsp;&nbsp;&nbsp; 5bbacb11989 Merge pull request #118290 from HirazawaUi/a=
utomated-cherry-pick-of-#118177-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; b383755e462 Hide numberOfMissedSchedules as an algorithm=
 internal number<br>
&nbsp;&nbsp;&nbsp; 26db84e04c7 Update schedule logic to properly calculate =
missed schedules<br>
&nbsp;&nbsp;&nbsp; fe4e288bcdd Merge pull request #118855 from aojea/automa=
ted-cherry-pick-of-#118686-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; a54590f218d Merge pull request #117936 from jsafrane/aut=
omated-cherry-pick-of-#117243-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; ad569aec159 kubeadm: backdate generated CAs by 5 minutes=
<br>
&nbsp;&nbsp;&nbsp; 0fc5c972129 client-go: allow to set NotBefore in NewSelf=
SignedCACert()<br>
&nbsp;&nbsp;&nbsp; 0ed276fb568 Merge pull request #118199 from aleskandro/a=
utomated-cherry-pick-of-#118053-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; 04e86095d38 Merge pull request #118930 from atiratree/au=
tomated-cherry-pick-of-#118876-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 3c115eec0b9 Automated cherry pick of #118805: test comme=
nt should match the code in podgc (#118913)<br>
&nbsp;&nbsp;&nbsp; db247e1df34 Merge pull request #118969 from champtar/aut=
omated-cherry-pick-of-#117791-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 55872a8eb12 Merge pull request #119086 from neolit123/au=
tomated-cherry-pick-of-#118150-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; 39a4cd1a083 call ./hack/update-vendor.sh<br>
&nbsp;&nbsp;&nbsp; 33af2a45f53 kubeadm: remove function pointer comparison =
in phase test<br>
&nbsp;&nbsp;&nbsp; 3f4643682e3 CHANGELOG-1.27: Add note for AWS in-tree pro=
vider removal<br>
&nbsp;&nbsp;&nbsp; 703edddae4e Updating the nodeAffinity of gated pods havi=
ng nil affinity should be allowed<br>
&nbsp;&nbsp;&nbsp; 3b874af3878 Merge pull request #118662 from mkowalski/au=
tomated-cherry-pick-of-#118329-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; d936e6669bb Merge pull request #118841 from bobbypage/au=
tomated-cherry-pick-of-#118497-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 3aa21cec0ec fix the existing problem (0 SerialNumber in =
all certificate) as part of this PR in a separate commit<br>
&nbsp;&nbsp;&nbsp; cd08820ba9a update serial number to a valid non-zero num=
ber in ca certificate<br>
&nbsp;&nbsp;&nbsp; 5253d8e02c7 Merge pull request #118664 from pohly/automa=
ted-cherry-pick-of-#118524-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; 76b9400cea3 Merge pull request #118283 from pohly/automa=
ted-cherry-pick-of-#118257-origin-release-1.27<br>
&nbsp;&nbsp;&nbsp; 1260b845752 Delete CRDs created during field validation =
tests.<br>
&nbsp;&nbsp;&nbsp; f689046fb6b kubectl explain should work for both cluster=
 and namespace resources and without a GET method<br>
&nbsp;&nbsp;&nbsp; f7d82bfdffe Merge pull request #118797 from harche/1.27_=
cadvisor_bump<br>
&nbsp;&nbsp;&nbsp; 59cd1d0b3bb always execute condition for wait.PollUntilC=
ontextTimeout with immediate=3Dtrue<br>
&nbsp;&nbsp;&nbsp; 5423fffca9d Review remarks to improve HandlePodCleanups =
in kubelet<br>
&nbsp;&nbsp;&nbsp; 24c67c15240 Fix the deletion of rejected pods<br>
&nbsp;&nbsp;&nbsp; 0539a6a194a Merge pull request #118821 from helayoty/aut=
omated-cherry-pick-of-#118049-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 62cf5ee1cdb Unset gated pod info timestamp in addToActiv=
eQ<br>
&nbsp;&nbsp;&nbsp; 027b4632bbb deps: Bump to cAdvisor v0.47.2<br>
&nbsp;&nbsp;&nbsp; ea2af58b5bd Make etcd component status consistent with h=
ealth probes<br>
&nbsp;&nbsp;&nbsp; f2548642c4e e2e storage: terminate worker quietly on tes=
t completion<br>
&nbsp;&nbsp;&nbsp; 9a001cea215 Fix flaky persistent volumes e2e test<br>
&nbsp;&nbsp;&nbsp; eb5825b3a3c Set the node-ips annotation correctly with C=
loudDualStackNodeIPs<br>
&nbsp;&nbsp;&nbsp; a2ba2626e85 Update CHANGELOG/CHANGELOG-1.27.md for v1.27=
.3<br>
&nbsp;&nbsp;&nbsp; 25b4e43193b Release commit for Kubernetes v1.27.3<br>
&nbsp;&nbsp;&nbsp; aae883e5fa7 Merge pull request #118553 from puerco/bump-=
1.27-go1.20.5<br>
&nbsp;&nbsp;&nbsp; e13e5915a78 Merge pull request #118307 from SataQiu/auto=
mated-cherry-pick-of-#117169-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; e0a2a6efdd1 update-vendor: update vendored go.sums<br>
&nbsp;&nbsp;&nbsp; 82b2c5aefa3 releng/go: Update images, dependencies and v=
ersion to Go 1.20.5<br>
&nbsp;&nbsp;&nbsp; e2cc1a3b21b Merge pull request #118515 from aojea/automa=
ted-cherry-pick-of-#118499-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 3a77d5a59f0 Merge pull request #118471 from ritazh/autom=
ated-cherry-pick-of-#118356-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; b30e94b1253 kube-proxy avoid race condition using LocalM=
odeNodeCIDR<br>
&nbsp;&nbsp;&nbsp; 5e00018fccf Merge pull request #117948 from dlipovetsky/=
automated-cherry-pick-of-#117792-#117724-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 76f14499624 Merge pull request #118281 from aojea/automa=
ted-cherry-pick-of-#118256-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; d59b91d97b4 Add ephemeralcontainer to imagepolicy securi=
tyaccount admission plugin<br>
&nbsp;&nbsp;&nbsp; d71d96a5d24 Merge pull request #118219 from mimowo/autom=
ated-cherry-pick-of-#117586-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; c48bdec2ced Merge pull request #118279 from aojea/automa=
ted-cherry-pick-of-#118200-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; c345ce91a03 supported version of etcd 3.5.7-0 for Kubern=
etes v1.27.0-rc.0<br>
&nbsp;&nbsp;&nbsp; 22e8a99ec6e Fix the git-repo test error caused by the co=
rrect use of loop variables<br>
&nbsp;&nbsp;&nbsp; 009a7a6fb9f dra scheduler plugin test: fix loopvar bug a=
nd &quot;reserve&quot; expected data<br>
&nbsp;&nbsp;&nbsp; 7888798873e e2e framework retry on Service unavailable e=
rrors<br>
&nbsp;&nbsp;&nbsp; f41a169a354 e2e: apply timeout for CSI Storage Capacity =
test only to node<br>
&nbsp;&nbsp;&nbsp; 916bc55a7bf Merge pull request #118178 from HirazawaUi/a=
utomated-cherry-pick-of-#118156-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; e407c2b4b02 Add DisruptionTarget condition when preempti=
ng for critical pod<br>
&nbsp;&nbsp;&nbsp; d2bd738e274 update webhook test to go 1.21<br>
&nbsp;&nbsp;&nbsp; 4025005877a Merge pull request #118105 from SataQiu/auto=
mated-cherry-pick-of-#118069-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; af024b2a086 Merge pull request #118111 from liggitt/auto=
mated-cherry-pick-of-#118104-upstream-release-1.27<br>
&nbsp;&nbsp;&nbsp; 9107eee6583 Test APIService safe handling at startup<br>
&nbsp;&nbsp;&nbsp; 0bff4e35669 Fix waiting for CRD sync at server start<br>
&nbsp;&nbsp;&nbsp; 1ae728f4344 kubeadm: fix a bug where the static pod chan=
ges detection logic is inconsistent with kubelet<br>
&nbsp;&nbsp;&nbsp; f404d1c4d3c Update CHANGELOG/CHANGELOG-1.27.md for v1.27=
.2<br>
&nbsp;&nbsp;&nbsp; 7f6f68fdabc Release commit for Kubernetes v1.27.2<br>
<br>
Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
---<br>
&nbsp;recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-cont=
ainers/kubernetes/kubernetes_git.bb<br>
index 3a6e7119..560fd8b7 100644<br>
--- a/recipes-containers/kubernetes/kubernetes_git.bb<br>
+++ b/recipes-containers/kubernetes/kubernetes_git.bb<br>
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechani=
sms for deployment, \<br>
&nbsp;maintenance, and scaling of applications. \<br>
&nbsp;&quot;<br>
&nbsp;<br>
-PV =3D &quot;v1.27.1+git${SRCREV_kubernetes}&quot;<br>
-SRCREV_kubernetes =3D &quot;2555e0f90e80a13628f47eca5cde34decc89babb&quot;=
<br>
+PV =3D &quot;v1.27.5+git${SRCREV_kubernetes}&quot;<br>
+SRCREV_kubernetes =3D &quot;93e0d7146fb9c3e9f68aa41b2b4265b2fcdb0a4c&quot;=
<br>
&nbsp;SRCREV_kubernetes-release =3D &quot;21382abdbfa8e6a43fd417306fa649cb6=
51cc06e&quot;<br>
&nbsp;PE =3D &quot;1&quot;<br>
&nbsp;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB339736CD2663FA3421CD6FC681DDABYAPR11MB3397namp_--

