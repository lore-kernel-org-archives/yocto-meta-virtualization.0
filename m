Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA12C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18340.1677664366718263884
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jN7b+NWg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswM023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=qWyg4053xirWoV5d20nVFGvobKS0Hj07mBCKgkIQ+5k=;
 b=jN7b+NWgc/r7gOfobiCHOhR5gxmGQ3o7xi6hRuqXnXfxs+zS6fOqzn11btWvdGdx+KgF
 6o+LHOdmWNrR0wGMrQagFBFe89P+K8HIHliMObdZCMwTN4GzHiAYugV9m1pzQzO6SyN4
 J32sxAfidODBZCq43Fr6FSCXFWVpv+KWWRJb5B34viytN1K5j/DBG6wVYTs4LTG3lQzH
 TWM/2NHC7vGBClPwTh/HgWNUC2WFkCCZ4aAy5rQP0S/hIStUQD5t1kQqLNqdu/XB+bSC
 eL1hStvK/GGCzthOO51O6DmlTK2BswiH2afyeCmzDgC1z7mobXVqvzPjIt3IovJ4GKkx jw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fzd2CYvBAUscz1TlWEd8bWCV9ve74Ud0V7/TtwmgoSrCQhlynrHlW+gM6nYOvULdujRFKXwxRQ09C67+T5sHz6fR+wvDPukS28TPuXepkQLYx/8VlWbVESe/2LXbBt+ThuWTjclWiPNmB4+hz7y/rGzGiRa4Hla/fegeOgy3jmzcAQ7z4sE8w99uqAxOpZkqm1lZkZNFuyX6aJYC1l9SCmwxeHZxPcM5c70bvPXliYyiV+Q+t1T5xvjFU/odivIld5R4/+0d8KWpjE52OFZ/KDdCDgUcyBisybZpNn5RKBEIxiN5aphZFH0CH9ltgKKv1lJckWtqACqvmV1vPn4sSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWyg4053xirWoV5d20nVFGvobKS0Hj07mBCKgkIQ+5k=;
 b=cOhJEeydsD++Q2tEQbx+AMnX8E2ghuFxFSDtCSJHyhGHobjcgWCQs+EiIMxa87Dlgv2UrPQIDErX7mzdM/sysIlhkz3+FzcFwuCsK1wE4rzAZTkvp2xD5RXCiJjGrKdUOkYYVrmAbFGOoizoCRCborK51Zv9Pr14Zn5ej3LkmmlpTOWkRUFLpXNENK5SvMszkxRf+adFbkCZMq8Zsimen0cZa7XbIb6DeMlwGLMfAHuTBcn4SuyEO5OT/lF+GnnvJrT9swNBCc5e9oqgNGOum2VAHHNWTU9Jbo/PcKpR+5Qu/W5MeKBEIU6/GLJJiAlL7U9sPEhq7jIBIvfa5iGnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:43 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 03/10] cri-o: create /var/lib/crio
Date: Wed,  1 Mar 2023 01:52:21 -0800
Message-Id: <20230301095228.122562-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f127ae5-bfea-4c87-c0fe-08db1a3ab383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r6OTxWPG5aqgOOT6EOXrzv5vChmIoKltmWX4mHspS0I4ECIMsTuGwoRp9PTHYgeyqLM5+zuKXaNdb9ohgfOwqoK44vVGE2cXNf6jQCbniOD9VTeAH1byXw2lXtiG7MPXyb9j21ttt2JyYg/qnnGMvyGdBdWfgy7xXxEUdbA3Z9KvMm5oSbwyD6uCDm6EwpFNmxMdw0NaM1le6ghLXUIW5tHffujmGGO72ppRwP5lgRysZX0ssnx6vOT2NBT9fPiz1oiPx8NpXKksw6QCpEXmJmFn5twn7QGMXT66ZhtGgLSb3SpJ3G+OKsJ8/TeFbY7y9YIz2OtnAOBM+JQ+2dRwgNd4+PcWuM9xV5uLHgopWK2CTvKm3PuAeh8502j3TOV5EPSG5z+OnjqW4ki0wjQOBVU6zc21BFHYzwXJHlY3BttZT7B1IQSROJUNGLIjqM6dQABmag3kjBwvvjK/DP1YzJReRk8QxauXu9Wfmr8fy7oyVWwtCUWydnkI1cf+3/7H4r9iaoPT4AX5yyH9P8F3xHuT4YJ1iAMvxVrfpBoHruByfH7CEzVzsB2uRdWyKRdHEegAGPEowO3gfUCVYbze+uwyMVlKgqhPNlH1Wpgz8jNfZVyPCnDu8/ZgoZVig+jnRP2HKPq8h0a5FfGcGxR9SVN8+uDgjOUpW3r+ci+2XD7D7+MKLNsaljlQceElomRb90WGNUiEHVKxSphLmybWAg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i0Lpkvx0AVIfkYalEUQ6zXG53H4zTxWbVKU88506Q14Xcw+ddG/rTzxGvLEf?=
 =?us-ascii?Q?rL8zNU/+B9jRtzLZHW3kvHqOdCOyPOt/E1mREagcqhanuqt3Qwtfl2aTm+8W?=
 =?us-ascii?Q?1iPv6SQIXqpJvcbS725p7gIIEAiWESBr23LMKYib22NIKpVNm9duUB24tMED?=
 =?us-ascii?Q?dMvPq5hWjtdFh1KJY1KHe6+TbqPcZSfQUtIqOIBtrf0ulJmca2Udo2WNlzOg?=
 =?us-ascii?Q?c9Xuccrf2TOUkUu46bwDA855h+fkwSY8gmtEGsB78FbwOkhSgqNjK0A2+gyr?=
 =?us-ascii?Q?E4Px8IFGXtX42Y4ztV1s+bf0PuV2YbAgIkj2GoaTW0/d3eJrpe4SFn/6MCHO?=
 =?us-ascii?Q?K+ezLEKc7q/C8nLOagR6/1CODFtTMfqDk2AvPRt+jw8HxCvUv+2WEgtevCfy?=
 =?us-ascii?Q?HmA9MM7qtwFbCMbpV1nwIqEbZDVIVOn+GTdeMApARXPjDgTgcuXboaNJejPQ?=
 =?us-ascii?Q?yQ8fsZ29sNmLi0miWgOn5ES44jVS2M+/3SP/WJX1Mrk0IfawYgKIIOncW87r?=
 =?us-ascii?Q?EIv65NZKcdLkYeMvDcxN8yC7vco741SZDufTBLDjjnBVUCNqqstB1i/kA/2k?=
 =?us-ascii?Q?BgWfjbl4ld6wAljueYFCNsZjlBBTr+nHN1Imi+OSq5t7+YmzjjF1PGBNi4yr?=
 =?us-ascii?Q?ET1IR5jsIweuw9WiU44rn4tofMswNF0UDNotalzX4rkbhwMywiMu4tTY9L2J?=
 =?us-ascii?Q?K5ANH6lBufMXdcER5bHhaAlW6J+9Iju4Yz7ah2yXwmFowoCsqqk48SxkM6KJ?=
 =?us-ascii?Q?XpOhjhH+B3bErMGOq7ATtH1UX3W8zjsnD49vJn/q6vgH8XwFkPFCKX3ZK2wG?=
 =?us-ascii?Q?EMlFaaaHIcMupwACyA+8ifQ3sdcwrcuMPzyfAEExexwCm1IMTehk6I7RMUQM?=
 =?us-ascii?Q?pk0UdLtwb68W5dzwd+vJS+F7B356f1YHUF+EOGRCCIraZMDjsuPX1hPJnf1f?=
 =?us-ascii?Q?SYDL3L36WHDzy/0Mkc114rzB9O4IQqhoiyDhddZrkN+DQtaf/PeRr755/fkC?=
 =?us-ascii?Q?8QB7TQTirtSZEKdFfF5uEqchAVaGHh20R29TRDOJnMa29YVajwZAglg8yG+u?=
 =?us-ascii?Q?fYP4XpEIihfs7fHi61X8a0hDYiF/+PcUgfKrkwJSS2ihbcXt5Ll5jl3UXR7r?=
 =?us-ascii?Q?DIsUXTmOih+Dp9PugdJ6kohTVCd80CU1UfVGc4J8UhzbQ2RDpv99pLDcN1vS?=
 =?us-ascii?Q?viwZGYtYTUWpPNOB6S0NQ6aj7IG9JsJhBS11BW78bbYVJYUFRIbujscc+lES?=
 =?us-ascii?Q?T9HMD6QtMVs4EvabO0S629+m3KpKaTNvU8IKVHzR5ppnRERLulvWdpd2K2jv?=
 =?us-ascii?Q?1GCuDLkPbiZbLPmR7q5Cr7JrS9qFefFjc+jOtFUk+W4bDOq9u8xKYitmhqVC?=
 =?us-ascii?Q?IjUpJpuo/Mj4BgPA7h0PvECVPFYzgU4Qkbt71mSGCeLTyNUXQSIG+nbzztcX?=
 =?us-ascii?Q?LrfSJRdv8xWGOeknLDyUHC8Dy+xj69npOk28mNbBtg81m3lI3jcKROA49Rw2?=
 =?us-ascii?Q?JCleTzoU+1BC9QH0kLCMXOTzqziaMIsQnxkhuwQsVswfNUbc/Jkwqx/7WkOP?=
 =?us-ascii?Q?tmlZgA0AuV37mX00mFyK7RlKlTSaL7lKIOHPDT/MdIT0/z9+zpK+GbXE4/wb?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f127ae5-bfea-4c87-c0fe-08db1a3ab383
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:42.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Se6R8whZnYBbLkn77axriHq4WKlAzIWC+60jxjfgIY7FXQyHtu+XXIvhtzybN8DaQhllOj1aiX8ZFaxo2ZS+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: yQz0SGsZ1DbsHE55CBP3-opWHcbKr6_J
X-Proofpoint-GUID: yQz0SGsZ1DbsHE55CBP3-opWHcbKr6_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=729 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7913

crio.service now reports the following error messages:

  level=error msg="Writing clean shutdown supported file: \
      open /var/lib/crio/clean.shutdown.supported: no such file or directory"
  level=error msg="Failed to sync parent directory of clean \
      shutdown file: open /var/lib/crio: no such file or directory"

Create /var/lib/crio to avoid such error message.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index ca155a7..2597942 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -96,6 +96,8 @@ do_install() {
     install -m 0644 ${S}/src/import/contrib/systemd/crio.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/contrib/systemd/crio-shutdown.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
+
+    install -d ${D}${localstatedir}/lib/crio
 }
 
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
-- 
2.37.1


