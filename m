Return-Path: <rong.fu.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7246CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 06:06:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13984.1779861979351803817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 May 2026 23:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rqdwchsP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9607859bb9=rong.fu.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R4tl4D2310240
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 May 2026 23:06:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QA79OUrjblKpfeY5hmMd
	4RBOPLln/R773RC4N1PGaGU=; b=rqdwchsPPFIE4Bt7Bhj3MXH8E6iYn6CSCwyi
	pDPsZalz0USFWnjDXMa4QTz/n3SptKG1ORX8ekybbdjCqmzgB3NlRH7v2Io2L8LC
	912u/KzNGcIQZ4XkedA+2wraseTPrxpb4123xycpVId7yjjqmI4qDMFyVh1TcDbU
	fs5ogE83/GBtYEmU4UeJ0yBGZXA7BhvzNeWkwcMHB38THy8cupK5qqFpGw4zFEck
	IwilkraH52e6cMAMND+hLz/K70oxVs5/dx78TXGhh2tLf1ye2gcRn8jESPaLe5MI
	8fMNOmgq9EUNxb5D5jIczGrbfkYXRv6OJf0wEZ4weyuxUVvq1A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb7h1w22d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 May 2026 23:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2nrKLGVavzNuK6bNsciCO4CRWLkkeUYmvCS6FxBDn8f122Gkly8vUk8LX6O4ZzfhQRHVsHHJ1mw0m43f4HdcCEdJTpJX6PG3M/MNl24jzk/h4Fbcu48cTY84PsncSUb1jy3qHBN3nirMuAnQfRP3/J7Z/8uN5giolmUAfeTgsf7Tl9WnMZKwT0l2+zQ/r3jjfP2B81O3rOGv5tjA1/tQtD03ECYmiB7XxKnapIcZwucXoZ7dyCSX5Lz4Qz4F8/YGotvBwU0Uk8SVSX4rBMr5EG3E2+l1/W99x86u5x3j3LtWvVb2pEUpxJ0UrKKo69TeYJjK9oXneiZnWZQkIXUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA79OUrjblKpfeY5hmMd4RBOPLln/R773RC4N1PGaGU=;
 b=zWiLFZT/IUy1spt1opWWf0e4u/pC4qh6oaj/f9sx/swHaKGwXcOdjN09UmXsc3AbMUgHJEvtStduKWhbslLAzEVoHCmYufFuQHujhnhg10cxPlQnUlYyYjLhUsa6J+vR+SYKXBsa+xdxtdbdKXmKsJLa1Z2qpNV42Jci6afe0/8CW0YHZa/JyruVyHtSc5Jj+aJfFQnump3Pnpg/qf6XR/UYD0grImcfei0/GNBsnKudCi/EGAmDPxliBcpis2jHEn6KxKhita0ucA/7S+Wr6qm2ZDoa1sR52nCGwPIhZswiqUwqv/uAmNKwvIPPtWcRx1BWrIBa5IS9y9w7Uh5M3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 06:06:17 +0000
Received: from LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36]) by LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 06:06:17 +0000
From: rong.fu.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] containerd: update to v2.2.3
Date: Wed, 27 May 2026 14:06:05 +0800
Message-ID: <20260527060605.3035717-1-rong.fu.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::16) To LV2PR11MB6069.namprd11.prod.outlook.com
 (2603:10b6:408:17a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6069:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 69cda5a5-94cf-48fb-ec72-08debbb61073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007|56012099006|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	3deFnVr7hrCVhCAtB7ccymEsFyWO21ovjqcfWt/F3k5xbHkkW1vA6MgCsykvar6BKEFkgJ42a6IFJhARNu/3tqsJ7s8zqortNNoHbrwdCRHSHFeDwdCDk1DPa4UnLMN9c2fRdymcMOfJ9XYc49Vx9Zqh48K7CJdaGDW1+F6oIaGlmYHcRloddPoMZ49xD/qbrkaUtLOEeWbKzd9F2+vI9IVR4BjUnw5GbH8H1pQtcV4gBhn1PFutajhjTX+IOKBAyKW5AdAsVu5AGjeSFlLp0qwakTqFSHBIBkfrukxdj9wEt8GIukXKFS7REaT/v8NZnMsatmc7e8cMFQwkivwGsxKO9gYchSf3T6CZh1fHg61Uita7WlmKRd24Dbhzd4w3ayRnSDRLMTZNa3dCPDfpCXkCIsKlX6E1KZzNfxQV+hsvYcK+VyJf02gVtwIxQfVodap6RXjD9dtMJjcj4i8E641wYOcWxZD17i9ikds/gpa9xETMeCExhdmj93NDC8tH2I0THLBlxtj6NoZjKwlN//dkjvuFEaY41z3pRxcsGuAR3D+vZCyMUmLHYrWFg+tXuBvX/XV05WbOO2HJTkTdkeRKkEXXOIzFK2OF4piYpmmsfI4KHB1VGxtgY1JfqA9lBdhqHtmXn3I9LdtADCzHxrybvcHVDhLAKEUJx2d3VFAms943X+RAKS2DNfE8uKvOTYyCSkxnyyVsw4Hg3dTdpYsS16LXPrvLKs4U0YBnF8264piTo0x9y6t9WhI9mLIK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6069.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007)(56012099006)(18002099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0WDI9micm2JXvZE9NEgrMmwvPzaIKwR21C73bt8snsKkC2+XN6af1hXf2ciP?=
 =?us-ascii?Q?BKKC77lDny7stpwUdaS9PQmDYLno4as9BoOH1VvXtG2cz+Rl3+MuhDhoTCj3?=
 =?us-ascii?Q?E4Jp1nRc6yhbidC47Nt2/vx6qOo7HrqHHEsZUnqh0nPhEdrd9BhjOBmsBfTR?=
 =?us-ascii?Q?axCURl/WS9DpSMF2sSOrWTpsEN5oDD/ZpThSoxdRF4HQN/paBnn7DQ58xxgZ?=
 =?us-ascii?Q?zWu8dGZHhotur70AEqSFv3eRYQNE591z4j5n2I63YBQ+nTNCRfpIzgops42U?=
 =?us-ascii?Q?LScmV9IwpEl+M7jUh8y+lLZrlTDL0p6TDrPFIcH9TpaQAsXanV0vE+HFS3fy?=
 =?us-ascii?Q?PSolqHbOU9BAuWAU10TlThabDjh8Y7X+l58Qk7T4y7iLcxYCx+v4SjuSpbeu?=
 =?us-ascii?Q?kcURppTXAroEbdYpMrzwSdHlJlCQqVPTEmoOz3u4icXLRn356dQVjSRPLpmH?=
 =?us-ascii?Q?1xU2J7QML3ACFdo0P+TNOlXln09BDmialO/B1XzfL4P1r7o/+svR8ugq+rh6?=
 =?us-ascii?Q?OznNKymqNOf22qOj2lCWkedMByO8SCIArGhM5NHG8aR4ZOYgYNaxSTVnfCQX?=
 =?us-ascii?Q?0oTd7jZ/Ig2tWUR58a1kb1F3yoxOn0LNyQAj2eOyUP278weNcNXorvqR2zSk?=
 =?us-ascii?Q?SswmczdXtieg5fpIJoTih1kSwO7kQzuXorhx8p9KHieac3I3mzPX7o7NCN8M?=
 =?us-ascii?Q?hhCq1166Om9shXf+XVcO0DfEeA4GcMPbSEvLLn0W8PTXOuj48JYIAfA8Sypc?=
 =?us-ascii?Q?jHVxinFniFetNOKw95c2J+7VQgrs05v2S0OhlQZC5zZvO40yIau4GQMYcPni?=
 =?us-ascii?Q?R+Blt4V8r/EPfwOICzUWBY/X1VlWz9Dn59ggUNUCrrV5S8ZqYvp9ue4FPGuE?=
 =?us-ascii?Q?OBRl9VO6xCUZeRXcUL4d6aeTSNG79Qigay/799VCOVN9enAq7bLC1aFFQErL?=
 =?us-ascii?Q?hhQ9XKxmYsRcwe9/4JEuuLFyQxz1l9sGQeZNEFEX/JrtGSd2i1kyk2kUiTmh?=
 =?us-ascii?Q?3etFm1wMuKeyLa68uSgcuLAsEqaR0yCEuxK+CwYDrO46fIHDbGEg2fMAt8wP?=
 =?us-ascii?Q?i/lEHX1LQ7t1XDYOAVpK6eqhlz91/J27bY0A3ctTD1P/gShlpet8kk9SGW7q?=
 =?us-ascii?Q?WFBGcv4YRUpUAXJLQ0BtdnjAmLCcHIz8b6AEcJKlsAQoaonKprU4MZz4/hw3?=
 =?us-ascii?Q?NlENFhL7qxbSXnWXscDvrOr/RSsfJ/wzL/wvsCXrcpna07eH5R2Agv138Mjr?=
 =?us-ascii?Q?fCuMvxdK7FFv8sYElt+OTIBAlQysdFxFNmI2mraNB1bjBCH2Pe+q0QKyKriE?=
 =?us-ascii?Q?ZANX0zFoLsbcFrV/ogKKadKcqU88uP0KhYH7fogjMzJ/vN0JiY+H6jjOC9Wn?=
 =?us-ascii?Q?sQ8+LFabHgyWF2qP7eV5MYT7uTr2b/Eutb+TYsMRIoukSgFGOFMMTih5Jd3y?=
 =?us-ascii?Q?65YEMuAPbIo4hnF1ldzJRS1VcsV2f9oOkfvOVmddW2/l685Ww3eE08oLhtwI?=
 =?us-ascii?Q?9ul19mEGDF1aN74pW3OZ11W2z1xC1US/3xhHGZSt5NLtJlF7XJKlLpnZaFiq?=
 =?us-ascii?Q?Wj1Sgz2+WQ4E5flCKK4IUZ2w1qLiqnjSK9sC1/amVRO0vJlNiLfoBgHaUGYJ?=
 =?us-ascii?Q?xvwdZy/+Ys9q4v1ln34dbIg24/ETFY3IELO7yompHK9ossnmBLefrZFRl50q?=
 =?us-ascii?Q?0wWRSrzAr1EHOS8oUcypD44hqi3sHweIPUCHP/1XWdwv8ZenCYbpsbSt1gNF?=
 =?us-ascii?Q?Dn/OM6IHiA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	O+KSxHnSTyu0mDchDMeGuNtOhL3z9k4Fs4AZ7JFjaMxrpZ8GlJol2xteW8jBn0BD7U3pVudiQaFuyquLPeG/oidvC7yyZSVCHyPrPI81vx7JtrCzCDURxlnwbwq/+oCInz0tenFGzofDTdXivwno1Ol9J9766min7umLVQPtEhEKp2ICSPmiT15YGEB3WGMJuIK8RNE6peG+p9JXkljUALZab6GPbHSs19p8iEXAYNziZP3AY2nLv5CPg8eUXfccG+8ZQuK2jlEvrM6xQpLVUxjjwGcxvfHxvkGkmdf7ok0srSSjyT5F7aW/gDBk7PzQ886EL6XZFZhrkV81FRT+AA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cda5a5-94cf-48fb-ec72-08debbb61073
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6069.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 06:06:17.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I12fC7m6DLmIsiAdQdmpxlONqhys6nMQWvtP2Rha5IVjPZB4uaijnLf2O252VrxqXOY2GnmzCKPbzJ1G2Hi+4LB/ByNTPNwxF5AqabcNc/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-Proofpoint-GUID: BRoT4K6ybjEPQL9rNY0OWClUBut7Q70Z
X-Proofpoint-ORIG-GUID: BRoT4K6ybjEPQL9rNY0OWClUBut7Q70Z
X-Authority-Analysis: v=2.4 cv=OuB/DS/t c=1 sm=1 tr=0 ts=6a1689da cx=c_pps
 a=xqIz4pcv3YTcvFGvps39jg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=qtKB1SZKmkC5mqyP2_AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1NiBTYWx0ZWRfX5yLrwy0kFFmK
 WteylyuyJYNmBe/uHhcayD726pWJ07DrFUJ5GfBPdVKiAHlwBIU07sN88M7OavntEMXU8+BqY5y
 KUew/3MtgVyUK2i/AEHIt+Rhona54Q4mbd1vImqUmtOY/BQ/W4qmlmDBGCRSsFstdsBcOqPV9lB
 puJZ0NQoBomPZGCMdN3lJBAaMZ6tT55j0CXDN3ZvdpiMUh3KWtPIaGGIdhgkBcLfsdkbhTIwPCQ
 p+SyIqD+PUufTzYyeirDu0IX+rFgfKQyoo5ZUCg8AYggYG3Fk8J/uy+1E632yo9NSfNO8fO0/r3
 WTZ0Czh9mCosn3IhCwi5Xa4TEGOIE7ENPKK4yHHXj4GpQwCq9HhYRDKqjCATEBCo0+nyrB9Hyr3
 4KvsvyfpqOte7Ftqim3Oq7RgB2qyFzIZ3CB2/jdiAMYdDhpwrvHdn5vxQ4rC/ZlwFWionwkJUco
 2+/Op0eD0rctvAxpWaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 06:06:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9818

From: Rong Fu <rong.fu.cn@windriver.com>

Bumping containerd to version v2.2.3, which comprises the following commits:

    8a0f4ed5d Prepare release notes for v2.2.3
    31bd34a06 update github.com/moby/spdystream v0.5.1
    409f75be8 diff/walking: enable mount manager
    1336f6c45 vendor: github.com/klauspost/compress v1.18.5
    3f33146c1 update runhcs to v0.14.1
    8bd1b74e5 vendor: github.com/Microsoft/hcsshim v0.14.1
    c6b0be8e1 vendor: github.com/Microsoft/hcsshim v0.14.0
    2ecde8cfe update to Go 1.25.9, 1.26.2
    be554f478 Skip TestExportAndImportMultiLayer on s390x
    660de195b Tweak mount info for overlayfs in case of parallel unpack
    bc9274a4b Add integration test for issue 13030
    c387890b5 Add integration test for privileged container cgroup mounts
    047a335a6 Forward RUNC_FLAVOR env var down to integration tests
    9b2d72ee0 Preserve host cgroup mount options for privileged containers
    5b66cd6a0 Move cgroup namespace placement higher in spec builder
    584205c2f [release/2.2] update runc binary to v1.3.5
    77c6886df Ignore NOCHANGE error

Signed-off-by: Rong Fu <rong.fu.cn@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 51d7c2e2..b5fa5b94 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "5957d3334bcaeddc2bd8e665f53cee318c298a2c"
+SRCREV = "77c84241c7cbdd9b4eca2591793e3d4f4317c590"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "2.2.2"
+CONTAINERD_VERSION = "2.2.3"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.43.0


