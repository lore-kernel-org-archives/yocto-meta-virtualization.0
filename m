Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.68])
 by mx.groups.io with SMTP id smtpd.web10.8714.1619450673379903305
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 08:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PZTD5j5v;
 spf=pass (domain: windriver.com, ip: 40.107.95.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2yA+kH8qCn5FWU/+uXzjJGp4iY+9c1ZshA3iBYSeBXGGNWov9IDQO39RAsg2a/7i+Hhb50yFZnJjx+6ZY12cm4hZDAkPdYHQZ54tjgmJVyAbAjbGI3dAqdL7Qk33zEq4HLL9YH4wKka+VPWFRxD/V4yMX+HuVdN4o6KhFpIUVdX9eosbMYFiEPi50ve6a7eAKEjvQhXmgYxHNIKDf5Xk7RI3ljnY1VjjmXe17Vx0H2BNhgUvdPV0ZCJbEMzzdHmE96MFYO34k0OssALUUV3lQKS7a7GKN+XEKQXnecQV3eTUIGkAHVdY8eaxQzLmfGX//Vau6OOnTAb3aEjV82TNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzjH6jcIEHpL94Q5YT8zYjYECSP2NLap9kLbz3c/RL4=;
 b=lU7yyxQHqShfwGzJzwDpKXFdYpoYMxgMa8NaM1qO3+7eeXzTJyiposGDs8bix6FuB4bfsROTS+9z2xeCykh+STOzhLmJtOhhUPFFmYQiGqFml2SmuFWMsI0k0mIDf/OBpNQOlSA/JmESjbSRu0f6FvJ/kdt67wqjh9leDzkENfb5k1Cr7ehbbeAJXd5eSBuZfhceJpibfnOOisAnAcYv1NH/FvrYmbnI6YPPtxhPV4jsKIqG+v+BZSiqy50lRt3xm2LelujO2LD21Jhu75whJ0k7OofImF5VE1/SqW/KzbEwah6UH3r3AQqwurZSG/JQOt4TLJjH/vlInb6obX4lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzjH6jcIEHpL94Q5YT8zYjYECSP2NLap9kLbz3c/RL4=;
 b=PZTD5j5vgP48ekmg/ruJXPtJLFTsJyAoU9hmKXbyA3hc84u2nHnabuSxFFL6MwroJoGjEFLGk73/q2XpDlxlEJWVAbZMxhuOer5RrSsSdjHJJG3MJ1HMHba6IhrmmV+cpBccV4h29u4D7fJ2owcKX8JnZmpWr3y+Pz+diJLROeY=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3256.namprd11.prod.outlook.com (2603:10b6:a03:76::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 15:24:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 15:24:28 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] containerd: fix fuzz for CVE-2021-3121 patch
Date: Mon, 26 Apr 2021 11:24:19 -0400
Message-ID: <20210426152419.2684694-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:33b::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend Transport; Mon, 26 Apr 2021 15:24:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33cb6c16-a445-45ad-954f-08d908c761d5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3256:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3256076B66C84DB9A69C5CE19F429@BYAPR11MB3256.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xl5PbjPAvWSu10Jk+boqMU46CMeACUWDMvknFl5btQzOJzqdazioRBokAXbOr7F4H41QkOPOuT0vs+RtG83P/q+aIxPexJEF6R6PwB+cTWgJ1wq8TTEyGBuFtqtpxxEv5PLdcJyXLXrWLSVkurZSUVeonZ5VCM3vSOJOLe/1YE+NMm7YJchai/7QV8M5cK/6oCAuJQFsLGDdEjanNG0B680bq3HJeOtDLNErMKCXhLLEZXohoYB0a3pZa9Rh+2/VQCSvQinUqnSWRHWmH6sv8t1znYDMzUHMe8GwS7fuU2ydLdRY616EEZA+Cr5UDwZ4Lk9ebfjgYYjcCO1CagLr+Mw0LIrraOef3PP/yCBWIMscPBq9oL/Bjc1FJtCW9d/NCCTlk7xKyZLcLEUTEHSb3XK+vXan9nM7UezCbmzReyZlhkvs1nBkw1JA0w2MXTqXU54kKnVl5T93F5F272VsUvZFhNPTbsFifHgw+MeFfbwu+4tXzQKBQ1G9y3+baWT9GkNyJT9kjy7wcjRDYfDcH1eEeBYe1PqfOEy3OqsI8kpG5dYfgXzjSyFvr+5aMZlmZIanm+/UuqBWAdlWWZDaoYdPX2YVYFAXykAeW2fO8I+6tdBdBZU0R+nUJ1PdVNhT/M9yfySABCN8xAa164QEXvgZiVSTVvlb232ZB/tnHCE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(52116002)(6486002)(478600001)(30864003)(8936002)(186003)(316002)(956004)(16526019)(6666004)(8676002)(44832011)(1076003)(6506007)(66556008)(66476007)(66946007)(26005)(38350700002)(86362001)(38100700002)(6512007)(83380400001)(36756003)(6916009)(2616005)(5660300002)(2906002)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lCyenB3CLztaB1eUBiZyMJenRRtwM0AeIgmirH7GS2Q1wj/HTBvMklverHSv?=
 =?us-ascii?Q?dVy1NBBIuAyllyuHEMd92kWwZ1f4o7VV4pri9ZmJm/CmItSMK3bcTKskNPIg?=
 =?us-ascii?Q?P1cbr1XGVHVMRHncs797+IlctNJKHfBms6jqoPODBGpNXPWsNjOHdDBPXx4y?=
 =?us-ascii?Q?yluSIjruQQSp2CtYsgJp6WcBzwbslbAfgLCyezgSTpzX8fcV05sua6Y3jI8r?=
 =?us-ascii?Q?8qZO2xcPenntaXlj1KUsfQKvnunlmONyC4NnZ0mKGeflA84V2mZKz/I11qUP?=
 =?us-ascii?Q?bVoLTQsqYlTmk3MviWP4eHTEvN65ub+yefLXVTrbxqQjQ5vdgIYNdkVlsnr9?=
 =?us-ascii?Q?mCoQzC63QUlinHXwCgQvxNfJgSEOQPyeDTK48KQ91m1zhFt3RE1sfcJ3QHhh?=
 =?us-ascii?Q?twxK4D8Y191IwpHhdxk9I4cKM/sR4Zp/r6SseVJjhl4Nj3SyGJP3c/qb225J?=
 =?us-ascii?Q?CP4AuaAgnCZCfn4REnG8xvPf54sLOBs2hhhWEOpcyOx9WvXwYuMKm/FwmT7X?=
 =?us-ascii?Q?ZviemT5hGRT8sPg3pTjilXr8w4YBlpEduiFUQ2v9NJoRL+LWVs7aRR3Q+0qB?=
 =?us-ascii?Q?+/TZKepZKEmFlT2YNbRaUXlhWin/n0l1YVxdZKJRMm9rXmYJbK48xEpbXJdi?=
 =?us-ascii?Q?ywCmCriDJr2+yWeRcd8DATMZPjSV5HBlD8mwbZORog5PlFtPhzITGqkeWcgV?=
 =?us-ascii?Q?dn32nJOfFROv2Mjz3t1R+hD9+rt4wapF8FXioTUlSDX84XSfTqxysOpISZul?=
 =?us-ascii?Q?5R65lPZEQPIKYyUYhrPP8EsmRFieYl9LR6g3dfMLGwsAlhaZphDaHz2bgC0l?=
 =?us-ascii?Q?rCxEu79Xq6V9RJEigt0CosrlrQgIP92+pOCEh+N+Tq+bzALvq5lcbUfKmvD9?=
 =?us-ascii?Q?ba/AvT4y/Cg4yMqtR+ARMxoRVKwkAwRNSv5Mc4F7S9zblZd/XB7ECj2kcGzO?=
 =?us-ascii?Q?qT1lQZnw040wd3ngQDgVW7xFGY+tT9cjLuhlNDAJyJSOYgnzd+Ov7y7WmJiW?=
 =?us-ascii?Q?xu1nkpV+/Bzmy9EVa1+KJ13BBbWWmYOPCtj05gDdfUeNaOQkbVS6pREe6ese?=
 =?us-ascii?Q?MD80+JgCCkWylSvtUZWGfCg88OSxOu5P89rDvLVRvXcaUkUtWhwusotpdThC?=
 =?us-ascii?Q?xDP8gze5hI6FevE+MVTkGveX5WX7Xsc51TAQ1D+kriCyuSH+wQe4uV0jYKJk?=
 =?us-ascii?Q?wwaXRH6hgcanzUmtgddEaaAmPkCCqodpQoQ53FoLtJ0lgapLKQdRlEXKV21c?=
 =?us-ascii?Q?KcKV0mJ3lOTnAkCwlcqFpzUmwwjBHXYcX0vicK9WErBK7oe2ML8ZMOqMoU1l?=
 =?us-ascii?Q?aJK9rkhxlBvEZpcOSAstsN5D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cb6c16-a445-45ad-954f-08d908c761d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:24:28.6634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88CBOu9lVUkrAYmU8AdzRIAA6/XNrUPW3H9mfVG9tc1ajy3FUclMK+oWReiTMHoYfrehSSX4xqprKpt36yhjaTXoYANOEyHMdSxion2C8MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3256
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../containerd/files/CVE-2021-3121.patch      | 849 +++++++++---------
 1 file changed, 423 insertions(+), 426 deletions(-)

diff --git a/recipes-containers/containerd/files/CVE-2021-3121.patch b/reci=
pes-containers/containerd/files/CVE-2021-3121.patch
index 1a2c0f4..ead1746 100644
--- a/recipes-containers/containerd/files/CVE-2021-3121.patch
+++ b/recipes-containers/containerd/files/CVE-2021-3121.patch
@@ -53,11 +53,11 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver=
.com>
  src/import/.../gogo/protobuf/types/wrappers.pb.go        |  45 +-
  39 files changed, 773 insertions(+), 1133 deletions(-)
=20
-diff --git a/src/import/api/events/container.pb.go b/src/import/api/events=
/container.pb.go
-index 0c1e0a939..fe002e073 100644
---- a/src/import/api/events/container.pb.go
-+++ b/src/import/api/events/container.pb.go
-@@ -835,10 +835,7 @@ func (m *ContainerCreate) Unmarshal(dAtA []byte) erro=
r {
+Index: git/src/import/api/events/container.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/events/container.pb.go
++++ git/src/import/api/events/container.pb.go
+@@ -835,10 +835,7 @@ func (m *ContainerCreate) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -69,7 +69,7 @@ index 0c1e0a939..fe002e073 100644
  				return ErrInvalidLengthContainer
  			}
  			if (iNdEx + skippy) > l {
-@@ -957,10 +954,7 @@ func (m *ContainerCreate_Runtime) Unmarshal(dAtA []by=
te) error {
+@@ -957,10 +954,7 @@ func (m *ContainerCreate_Runtime) Unmars
  			if err !=3D nil {
  				return err
  			}
@@ -81,7 +81,7 @@ index 0c1e0a939..fe002e073 100644
  				return ErrInvalidLengthContainer
  			}
  			if (iNdEx + skippy) > l {
-@@ -1185,7 +1179,7 @@ func (m *ContainerUpdate) Unmarshal(dAtA []byte) err=
or {
+@@ -1185,7 +1179,7 @@ func (m *ContainerUpdate) Unmarshal(dAtA
  					if err !=3D nil {
  						return err
  					}
@@ -90,7 +90,7 @@ index 0c1e0a939..fe002e073 100644
  						return ErrInvalidLengthContainer
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1234,10 +1228,7 @@ func (m *ContainerUpdate) Unmarshal(dAtA []byte) er=
ror {
+@@ -1234,10 +1228,7 @@ func (m *ContainerUpdate) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -102,7 +102,7 @@ index 0c1e0a939..fe002e073 100644
  				return ErrInvalidLengthContainer
  			}
  			if (iNdEx + skippy) > l {
-@@ -1320,10 +1311,7 @@ func (m *ContainerDelete) Unmarshal(dAtA []byte) er=
ror {
+@@ -1320,10 +1311,7 @@ func (m *ContainerDelete) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -114,11 +114,11 @@ index 0c1e0a939..fe002e073 100644
  				return ErrInvalidLengthContainer
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/events/content.pb.go b/src/import/api/events/c=
ontent.pb.go
-index 959ea72d8..0a7ec9325 100644
---- a/src/import/api/events/content.pb.go
-+++ b/src/import/api/events/content.pb.go
-@@ -257,10 +257,7 @@ func (m *ContentDelete) Unmarshal(dAtA []byte) error =
{
+Index: git/src/import/api/events/content.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/events/content.pb.go
++++ git/src/import/api/events/content.pb.go
+@@ -257,10 +257,7 @@ func (m *ContentDelete) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -130,11 +130,11 @@ index 959ea72d8..0a7ec9325 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/events/image.pb.go b/src/import/api/events/ima=
ge.pb.go
-index 13f60b017..747026945 100644
---- a/src/import/api/events/image.pb.go
-+++ b/src/import/api/events/image.pb.go
-@@ -697,7 +697,7 @@ func (m *ImageCreate) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/events/image.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/events/image.pb.go
++++ git/src/import/api/events/image.pb.go
+@@ -697,7 +697,7 @@ func (m *ImageCreate) Unmarshal(dAtA []b
  					if err !=3D nil {
  						return err
  					}
@@ -143,7 +143,7 @@ index 13f60b017..747026945 100644
  						return ErrInvalidLengthImage
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -714,10 +714,7 @@ func (m *ImageCreate) Unmarshal(dAtA []byte) error {
+@@ -714,10 +714,7 @@ func (m *ImageCreate) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -155,7 +155,7 @@ index 13f60b017..747026945 100644
  				return ErrInvalidLengthImage
  			}
  			if (iNdEx + skippy) > l {
-@@ -910,7 +907,7 @@ func (m *ImageUpdate) Unmarshal(dAtA []byte) error {
+@@ -910,7 +907,7 @@ func (m *ImageUpdate) Unmarshal(dAtA []b
  					if err !=3D nil {
  						return err
  					}
@@ -164,7 +164,7 @@ index 13f60b017..747026945 100644
  						return ErrInvalidLengthImage
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -927,10 +924,7 @@ func (m *ImageUpdate) Unmarshal(dAtA []byte) error {
+@@ -927,10 +924,7 @@ func (m *ImageUpdate) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -176,7 +176,7 @@ index 13f60b017..747026945 100644
  				return ErrInvalidLengthImage
  			}
  			if (iNdEx + skippy) > l {
-@@ -1013,10 +1007,7 @@ func (m *ImageDelete) Unmarshal(dAtA []byte) error =
{
+@@ -1013,10 +1007,7 @@ func (m *ImageDelete) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -188,11 +188,11 @@ index 13f60b017..747026945 100644
  				return ErrInvalidLengthImage
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/events/namespace.pb.go b/src/import/api/events=
/namespace.pb.go
-index 37c3b78cf..d406a987e 100644
---- a/src/import/api/events/namespace.pb.go
-+++ b/src/import/api/events/namespace.pb.go
-@@ -697,7 +697,7 @@ func (m *NamespaceCreate) Unmarshal(dAtA []byte) error=
 {
+Index: git/src/import/api/events/namespace.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/events/namespace.pb.go
++++ git/src/import/api/events/namespace.pb.go
+@@ -697,7 +697,7 @@ func (m *NamespaceCreate) Unmarshal(dAtA
  					if err !=3D nil {
  						return err
  					}
@@ -201,7 +201,7 @@ index 37c3b78cf..d406a987e 100644
  						return ErrInvalidLengthNamespace
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -714,10 +714,7 @@ func (m *NamespaceCreate) Unmarshal(dAtA []byte) erro=
r {
+@@ -714,10 +714,7 @@ func (m *NamespaceCreate) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -213,7 +213,7 @@ index 37c3b78cf..d406a987e 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -910,7 +907,7 @@ func (m *NamespaceUpdate) Unmarshal(dAtA []byte) error=
 {
+@@ -910,7 +907,7 @@ func (m *NamespaceUpdate) Unmarshal(dAtA
  					if err !=3D nil {
  						return err
  					}
@@ -222,7 +222,7 @@ index 37c3b78cf..d406a987e 100644
  						return ErrInvalidLengthNamespace
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -927,10 +924,7 @@ func (m *NamespaceUpdate) Unmarshal(dAtA []byte) erro=
r {
+@@ -927,10 +924,7 @@ func (m *NamespaceUpdate) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -234,7 +234,7 @@ index 37c3b78cf..d406a987e 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -1013,10 +1007,7 @@ func (m *NamespaceDelete) Unmarshal(dAtA []byte) er=
ror {
+@@ -1013,10 +1007,7 @@ func (m *NamespaceDelete) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -246,11 +246,11 @@ index 37c3b78cf..d406a987e 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/events/snapshot.pb.go b/src/import/api/events/=
snapshot.pb.go
-index 539297004..bec25c3a7 100644
---- a/src/import/api/events/snapshot.pb.go
-+++ b/src/import/api/events/snapshot.pb.go
-@@ -548,10 +548,7 @@ func (m *SnapshotPrepare) Unmarshal(dAtA []byte) erro=
r {
+Index: git/src/import/api/events/snapshot.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/events/snapshot.pb.go
++++ git/src/import/api/events/snapshot.pb.go
+@@ -548,10 +548,7 @@ func (m *SnapshotPrepare) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -262,7 +262,7 @@ index 539297004..bec25c3a7 100644
  				return ErrInvalidLengthSnapshot
  			}
  			if (iNdEx + skippy) > l {
-@@ -666,10 +663,7 @@ func (m *SnapshotCommit) Unmarshal(dAtA []byte) error=
 {
+@@ -666,10 +663,7 @@ func (m *SnapshotCommit) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -274,7 +274,7 @@ index 539297004..bec25c3a7 100644
  				return ErrInvalidLengthSnapshot
  			}
  			if (iNdEx + skippy) > l {
-@@ -752,10 +746,7 @@ func (m *SnapshotRemove) Unmarshal(dAtA []byte) error=
 {
+@@ -752,10 +746,7 @@ func (m *SnapshotRemove) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -286,11 +286,11 @@ index 539297004..bec25c3a7 100644
  				return ErrInvalidLengthSnapshot
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/events/task.pb.go b/src/import/api/events/task=
.pb.go
-index 0f16695e3..f8f3a3f3d 100644
---- a/src/import/api/events/task.pb.go
-+++ b/src/import/api/events/task.pb.go
-@@ -1905,10 +1905,7 @@ func (m *TaskCreate) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/events/task.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/events/task.pb.go
++++ git/src/import/api/events/task.pb.go
+@@ -1905,10 +1905,7 @@ func (m *TaskCreate) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -302,7 +302,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2010,10 +2007,7 @@ func (m *TaskStart) Unmarshal(dAtA []byte) error {
+@@ -2010,10 +2007,7 @@ func (m *TaskStart) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -314,7 +314,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2199,10 +2193,7 @@ func (m *TaskDelete) Unmarshal(dAtA []byte) error {
+@@ -2199,10 +2193,7 @@ func (m *TaskDelete) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -326,7 +326,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2369,10 +2360,7 @@ func (m *TaskIO) Unmarshal(dAtA []byte) error {
+@@ -2369,10 +2360,7 @@ func (m *TaskIO) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -338,7 +338,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2558,10 +2546,7 @@ func (m *TaskExit) Unmarshal(dAtA []byte) error {
+@@ -2558,10 +2546,7 @@ func (m *TaskExit) Unmarshal(dAtA []byte
  			if err !=3D nil {
  				return err
  			}
@@ -350,7 +350,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2644,10 +2629,7 @@ func (m *TaskOOM) Unmarshal(dAtA []byte) error {
+@@ -2644,10 +2629,7 @@ func (m *TaskOOM) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -362,7 +362,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2762,10 +2744,7 @@ func (m *TaskExecAdded) Unmarshal(dAtA []byte) erro=
r {
+@@ -2762,10 +2744,7 @@ func (m *TaskExecAdded) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -374,7 +374,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2899,10 +2878,7 @@ func (m *TaskExecStarted) Unmarshal(dAtA []byte) er=
ror {
+@@ -2899,10 +2878,7 @@ func (m *TaskExecStarted) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -386,7 +386,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -2985,10 +2961,7 @@ func (m *TaskPaused) Unmarshal(dAtA []byte) error {
+@@ -2985,10 +2961,7 @@ func (m *TaskPaused) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -398,7 +398,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -3071,10 +3044,7 @@ func (m *TaskResumed) Unmarshal(dAtA []byte) error =
{
+@@ -3071,10 +3044,7 @@ func (m *TaskResumed) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -410,7 +410,7 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -3189,10 +3159,7 @@ func (m *TaskCheckpointed) Unmarshal(dAtA []byte) e=
rror {
+@@ -3189,10 +3159,7 @@ func (m *TaskCheckpointed) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -422,11 +422,11 @@ index 0f16695e3..f8f3a3f3d 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/containers/v1/containers.pb.go b/src/=
import/api/services/containers/v1/containers.pb.go
-index d951b2683..af56c7de2 100644
---- a/src/import/api/services/containers/v1/containers.pb.go
-+++ b/src/import/api/services/containers/v1/containers.pb.go
-@@ -2106,7 +2106,7 @@ func (m *Container) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/services/containers/v1/containers.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/containers/v1/containers.pb.go
++++ git/src/import/api/services/containers/v1/containers.pb.go
+@@ -2106,7 +2106,7 @@ func (m *Container) Unmarshal(dAtA []byt
  					if err !=3D nil {
  						return err
  					}
@@ -435,7 +435,7 @@ index d951b2683..af56c7de2 100644
  						return ErrInvalidLengthContainers
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -2469,7 +2469,7 @@ func (m *Container) Unmarshal(dAtA []byte) error {
+@@ -2469,7 +2469,7 @@ func (m *Container) Unmarshal(dAtA []byt
  					if err !=3D nil {
  						return err
  					}
@@ -444,7 +444,7 @@ index d951b2683..af56c7de2 100644
  						return ErrInvalidLengthContainers
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -2486,10 +2486,7 @@ func (m *Container) Unmarshal(dAtA []byte) error {
+@@ -2486,10 +2486,7 @@ func (m *Container) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -456,7 +456,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2608,10 +2605,7 @@ func (m *Container_Runtime) Unmarshal(dAtA []byte) =
error {
+@@ -2608,10 +2605,7 @@ func (m *Container_Runtime) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -468,7 +468,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2694,10 +2688,7 @@ func (m *GetContainerRequest) Unmarshal(dAtA []byte=
) error {
+@@ -2694,10 +2688,7 @@ func (m *GetContainerRequest) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -480,7 +480,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2781,10 +2772,7 @@ func (m *GetContainerResponse) Unmarshal(dAtA []byt=
e) error {
+@@ -2781,10 +2772,7 @@ func (m *GetContainerResponse) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -492,7 +492,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2867,10 +2855,7 @@ func (m *ListContainersRequest) Unmarshal(dAtA []by=
te) error {
+@@ -2867,10 +2855,7 @@ func (m *ListContainersRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -504,7 +504,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2955,10 +2940,7 @@ func (m *ListContainersResponse) Unmarshal(dAtA []b=
yte) error {
+@@ -2955,10 +2940,7 @@ func (m *ListContainersResponse) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -516,7 +516,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -3042,10 +3024,7 @@ func (m *CreateContainerRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -3042,10 +3024,7 @@ func (m *CreateContainerRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -528,7 +528,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -3129,10 +3108,7 @@ func (m *CreateContainerResponse) Unmarshal(dAtA []=
byte) error {
+@@ -3129,10 +3108,7 @@ func (m *CreateContainerResponse) Unmars
  			if err !=3D nil {
  				return err
  			}
@@ -540,7 +540,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -3252,10 +3228,7 @@ func (m *UpdateContainerRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -3252,10 +3228,7 @@ func (m *UpdateContainerRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -552,7 +552,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -3339,10 +3312,7 @@ func (m *UpdateContainerResponse) Unmarshal(dAtA []=
byte) error {
+@@ -3339,10 +3312,7 @@ func (m *UpdateContainerResponse) Unmars
  			if err !=3D nil {
  				return err
  			}
@@ -564,7 +564,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -3425,10 +3395,7 @@ func (m *DeleteContainerRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -3425,10 +3395,7 @@ func (m *DeleteContainerRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -576,7 +576,7 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-@@ -3515,10 +3482,7 @@ func (m *ListContainerMessage) Unmarshal(dAtA []byt=
e) error {
+@@ -3515,10 +3482,7 @@ func (m *ListContainerMessage) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -588,11 +588,11 @@ index d951b2683..af56c7de2 100644
  				return ErrInvalidLengthContainers
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/content/v1/content.pb.go b/src/import=
/api/services/content/v1/content.pb.go
-index 1cf0aaa91..97c7d4a92 100644
---- a/src/import/api/services/content/v1/content.pb.go
-+++ b/src/import/api/services/content/v1/content.pb.go
-@@ -3280,7 +3280,7 @@ func (m *Info) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/services/content/v1/content.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/content/v1/content.pb.go
++++ git/src/import/api/services/content/v1/content.pb.go
+@@ -3280,7 +3280,7 @@ func (m *Info) Unmarshal(dAtA []byte) er
  					if err !=3D nil {
  						return err
  					}
@@ -601,7 +601,7 @@ index 1cf0aaa91..97c7d4a92 100644
  						return ErrInvalidLengthContent
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -3297,10 +3297,7 @@ func (m *Info) Unmarshal(dAtA []byte) error {
+@@ -3297,10 +3297,7 @@ func (m *Info) Unmarshal(dAtA []byte) er
  			if err !=3D nil {
  				return err
  			}
@@ -613,7 +613,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3383,10 +3380,7 @@ func (m *InfoRequest) Unmarshal(dAtA []byte) error =
{
+@@ -3383,10 +3380,7 @@ func (m *InfoRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -625,7 +625,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3470,10 +3464,7 @@ func (m *InfoResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -3470,10 +3464,7 @@ func (m *InfoResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -637,7 +637,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3593,10 +3584,7 @@ func (m *UpdateRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -3593,10 +3584,7 @@ func (m *UpdateRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -649,7 +649,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3680,10 +3668,7 @@ func (m *UpdateResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -3680,10 +3668,7 @@ func (m *UpdateResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -661,7 +661,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3766,10 +3751,7 @@ func (m *ListContentRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -3766,10 +3751,7 @@ func (m *ListContentRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -673,7 +673,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3854,10 +3836,7 @@ func (m *ListContentResponse) Unmarshal(dAtA []byte=
) error {
+@@ -3854,10 +3836,7 @@ func (m *ListContentResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -685,7 +685,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -3940,10 +3919,7 @@ func (m *DeleteContentRequest) Unmarshal(dAtA []byt=
e) error {
+@@ -3940,10 +3919,7 @@ func (m *DeleteContentRequest) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -697,7 +697,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4064,10 +4040,7 @@ func (m *ReadContentRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -4064,10 +4040,7 @@ func (m *ReadContentRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -709,7 +709,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4171,10 +4144,7 @@ func (m *ReadContentResponse) Unmarshal(dAtA []byte=
) error {
+@@ -4171,10 +4144,7 @@ func (m *ReadContentResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -721,7 +721,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4393,10 +4363,7 @@ func (m *Status) Unmarshal(dAtA []byte) error {
+@@ -4393,10 +4363,7 @@ func (m *Status) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -733,7 +733,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4479,10 +4446,7 @@ func (m *StatusRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -4479,10 +4446,7 @@ func (m *StatusRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -745,7 +745,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4569,10 +4533,7 @@ func (m *StatusResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -4569,10 +4533,7 @@ func (m *StatusResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -757,7 +757,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4655,10 +4616,7 @@ func (m *ListStatusesRequest) Unmarshal(dAtA []byte=
) error {
+@@ -4655,10 +4616,7 @@ func (m *ListStatusesRequest) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -769,7 +769,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -4743,10 +4701,7 @@ func (m *ListStatusesResponse) Unmarshal(dAtA []byt=
e) error {
+@@ -4743,10 +4701,7 @@ func (m *ListStatusesResponse) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -781,7 +781,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -5062,7 +5017,7 @@ func (m *WriteContentRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -5062,7 +5017,7 @@ func (m *WriteContentRequest) Unmarshal(
  					if err !=3D nil {
  						return err
  					}
@@ -790,7 +790,7 @@ index 1cf0aaa91..97c7d4a92 100644
  						return ErrInvalidLengthContent
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -5079,10 +5034,7 @@ func (m *WriteContentRequest) Unmarshal(dAtA []byte=
) error {
+@@ -5079,10 +5034,7 @@ func (m *WriteContentRequest) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -802,7 +802,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -5288,10 +5240,7 @@ func (m *WriteContentResponse) Unmarshal(dAtA []byt=
e) error {
+@@ -5288,10 +5240,7 @@ func (m *WriteContentResponse) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -814,7 +814,7 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-@@ -5374,10 +5323,7 @@ func (m *AbortRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -5374,10 +5323,7 @@ func (m *AbortRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -826,11 +826,11 @@ index 1cf0aaa91..97c7d4a92 100644
  				return ErrInvalidLengthContent
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/diff/v1/diff.pb.go b/src/import/api/s=
ervices/diff/v1/diff.pb.go
-index 48379234d..b1450ceb8 100644
---- a/src/import/api/services/diff/v1/diff.pb.go
-+++ b/src/import/api/services/diff/v1/diff.pb.go
-@@ -1063,7 +1063,7 @@ func (m *ApplyRequest) Unmarshal(dAtA []byte) error =
{
+Index: git/src/import/api/services/diff/v1/diff.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/diff/v1/diff.pb.go
++++ git/src/import/api/services/diff/v1/diff.pb.go
+@@ -1063,7 +1063,7 @@ func (m *ApplyRequest) Unmarshal(dAtA []
  					if err !=3D nil {
  						return err
  					}
@@ -839,7 +839,7 @@ index 48379234d..b1450ceb8 100644
  						return ErrInvalidLengthDiff
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1080,10 +1080,7 @@ func (m *ApplyRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -1080,10 +1080,7 @@ func (m *ApplyRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -851,7 +851,7 @@ index 48379234d..b1450ceb8 100644
  				return ErrInvalidLengthDiff
  			}
  			if (iNdEx + skippy) > l {
-@@ -1170,10 +1167,7 @@ func (m *ApplyResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -1170,10 +1167,7 @@ func (m *ApplyResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -863,7 +863,7 @@ index 48379234d..b1450ceb8 100644
  				return ErrInvalidLengthDiff
  			}
  			if (iNdEx + skippy) > l {
-@@ -1466,7 +1460,7 @@ func (m *DiffRequest) Unmarshal(dAtA []byte) error {
+@@ -1466,7 +1460,7 @@ func (m *DiffRequest) Unmarshal(dAtA []b
  					if err !=3D nil {
  						return err
  					}
@@ -872,7 +872,7 @@ index 48379234d..b1450ceb8 100644
  						return ErrInvalidLengthDiff
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1483,10 +1477,7 @@ func (m *DiffRequest) Unmarshal(dAtA []byte) error =
{
+@@ -1483,10 +1477,7 @@ func (m *DiffRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -884,7 +884,7 @@ index 48379234d..b1450ceb8 100644
  				return ErrInvalidLengthDiff
  			}
  			if (iNdEx + skippy) > l {
-@@ -1573,10 +1564,7 @@ func (m *DiffResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -1573,10 +1564,7 @@ func (m *DiffResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -896,11 +896,11 @@ index 48379234d..b1450ceb8 100644
  				return ErrInvalidLengthDiff
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/events/v1/events.pb.go b/src/import/a=
pi/services/events/v1/events.pb.go
-index a1674f862..4373f3bf2 100644
---- a/src/import/api/services/events/v1/events.pb.go
-+++ b/src/import/api/services/events/v1/events.pb.go
-@@ -916,10 +916,7 @@ func (m *PublishRequest) Unmarshal(dAtA []byte) error=
 {
+Index: git/src/import/api/services/events/v1/events.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/events/v1/events.pb.go
++++ git/src/import/api/services/events/v1/events.pb.go
+@@ -916,10 +916,7 @@ func (m *PublishRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -912,7 +912,7 @@ index a1674f862..4373f3bf2 100644
  				return ErrInvalidLengthEvents
  			}
  			if (iNdEx + skippy) > l {
-@@ -1006,10 +1003,7 @@ func (m *ForwardRequest) Unmarshal(dAtA []byte) err=
or {
+@@ -1006,10 +1003,7 @@ func (m *ForwardRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -924,7 +924,7 @@ index a1674f862..4373f3bf2 100644
  				return ErrInvalidLengthEvents
  			}
  			if (iNdEx + skippy) > l {
-@@ -1092,10 +1086,7 @@ func (m *SubscribeRequest) Unmarshal(dAtA []byte) e=
rror {
+@@ -1092,10 +1086,7 @@ func (m *SubscribeRequest) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -936,7 +936,7 @@ index a1674f862..4373f3bf2 100644
  				return ErrInvalidLengthEvents
  			}
  			if (iNdEx + skippy) > l {
-@@ -1279,10 +1270,7 @@ func (m *Envelope) Unmarshal(dAtA []byte) error {
+@@ -1279,10 +1270,7 @@ func (m *Envelope) Unmarshal(dAtA []byte
  			if err !=3D nil {
  				return err
  			}
@@ -948,11 +948,11 @@ index a1674f862..4373f3bf2 100644
  				return ErrInvalidLengthEvents
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/images/v1/images.pb.go b/src/import/a=
pi/services/images/v1/images.pb.go
-index db912b68b..de08cc083 100644
---- a/src/import/api/services/images/v1/images.pb.go
-+++ b/src/import/api/services/images/v1/images.pb.go
-@@ -1707,7 +1707,7 @@ func (m *Image) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/services/images/v1/images.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/images/v1/images.pb.go
++++ git/src/import/api/services/images/v1/images.pb.go
+@@ -1707,7 +1707,7 @@ func (m *Image) Unmarshal(dAtA []byte) e
  					if err !=3D nil {
  						return err
  					}
@@ -961,7 +961,7 @@ index db912b68b..de08cc083 100644
  						return ErrInvalidLengthImages
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1823,10 +1823,7 @@ func (m *Image) Unmarshal(dAtA []byte) error {
+@@ -1823,10 +1823,7 @@ func (m *Image) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -973,7 +973,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -1909,10 +1906,7 @@ func (m *GetImageRequest) Unmarshal(dAtA []byte) er=
ror {
+@@ -1909,10 +1906,7 @@ func (m *GetImageRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -985,7 +985,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -1999,10 +1993,7 @@ func (m *GetImageResponse) Unmarshal(dAtA []byte) e=
rror {
+@@ -1999,10 +1993,7 @@ func (m *GetImageResponse) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -997,7 +997,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2086,10 +2077,7 @@ func (m *CreateImageRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -2086,10 +2077,7 @@ func (m *CreateImageRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -1009,7 +1009,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2173,10 +2161,7 @@ func (m *CreateImageResponse) Unmarshal(dAtA []byte=
) error {
+@@ -2173,10 +2161,7 @@ func (m *CreateImageResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -1021,7 +1021,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2296,10 +2281,7 @@ func (m *UpdateImageRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -2296,10 +2281,7 @@ func (m *UpdateImageRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -1033,7 +1033,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2383,10 +2365,7 @@ func (m *UpdateImageResponse) Unmarshal(dAtA []byte=
) error {
+@@ -2383,10 +2365,7 @@ func (m *UpdateImageResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -1045,7 +1045,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2469,10 +2448,7 @@ func (m *ListImagesRequest) Unmarshal(dAtA []byte) =
error {
+@@ -2469,10 +2448,7 @@ func (m *ListImagesRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -1057,7 +1057,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2557,10 +2533,7 @@ func (m *ListImagesResponse) Unmarshal(dAtA []byte)=
 error {
+@@ -2557,10 +2533,7 @@ func (m *ListImagesResponse) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -1069,7 +1069,7 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-@@ -2663,10 +2636,7 @@ func (m *DeleteImageRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -2663,10 +2636,7 @@ func (m *DeleteImageRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -1081,11 +1081,11 @@ index db912b68b..de08cc083 100644
  				return ErrInvalidLengthImages
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/introspection/v1/introspection.pb.go =
b/src/import/api/services/introspection/v1/introspection.pb.go
-index b9f912b09..d23c8b61a 100644
---- a/src/import/api/services/introspection/v1/introspection.pb.go
-+++ b/src/import/api/services/introspection/v1/introspection.pb.go
-@@ -1098,7 +1098,7 @@ func (m *Plugin) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/services/introspection/v1/introspection.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/introspection/v1/introspection.pb.go
++++ git/src/import/api/services/introspection/v1/introspection.pb.go
+@@ -1098,7 +1098,7 @@ func (m *Plugin) Unmarshal(dAtA []byte)
  					if err !=3D nil {
  						return err
  					}
@@ -1094,7 +1094,7 @@ index b9f912b09..d23c8b61a 100644
  						return ErrInvalidLengthIntrospection
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1183,10 +1183,7 @@ func (m *Plugin) Unmarshal(dAtA []byte) error {
+@@ -1183,10 +1183,7 @@ func (m *Plugin) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -1106,7 +1106,7 @@ index b9f912b09..d23c8b61a 100644
  				return ErrInvalidLengthIntrospection
  			}
  			if (iNdEx + skippy) > l {
-@@ -1269,10 +1266,7 @@ func (m *PluginsRequest) Unmarshal(dAtA []byte) err=
or {
+@@ -1269,10 +1266,7 @@ func (m *PluginsRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -1118,7 +1118,7 @@ index b9f912b09..d23c8b61a 100644
  				return ErrInvalidLengthIntrospection
  			}
  			if (iNdEx + skippy) > l {
-@@ -1357,10 +1351,7 @@ func (m *PluginsResponse) Unmarshal(dAtA []byte) er=
ror {
+@@ -1357,10 +1351,7 @@ func (m *PluginsResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -1130,7 +1130,7 @@ index b9f912b09..d23c8b61a 100644
  				return ErrInvalidLengthIntrospection
  			}
  			if (iNdEx + skippy) > l {
-@@ -1443,10 +1434,7 @@ func (m *ServerResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -1443,10 +1434,7 @@ func (m *ServerResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -1142,11 +1142,11 @@ index b9f912b09..d23c8b61a 100644
  				return ErrInvalidLengthIntrospection
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/leases/v1/leases.pb.go b/src/import/a=
pi/services/leases/v1/leases.pb.go
-index 4dbac3e09..5e7cab71f 100644
---- a/src/import/api/services/leases/v1/leases.pb.go
-+++ b/src/import/api/services/leases/v1/leases.pb.go
-@@ -1906,7 +1906,7 @@ func (m *Lease) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/services/leases/v1/leases.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/leases/v1/leases.pb.go
++++ git/src/import/api/services/leases/v1/leases.pb.go
+@@ -1906,7 +1906,7 @@ func (m *Lease) Unmarshal(dAtA []byte) e
  					if err !=3D nil {
  						return err
  					}
@@ -1155,7 +1155,7 @@ index 4dbac3e09..5e7cab71f 100644
  						return ErrInvalidLengthLeases
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1923,10 +1923,7 @@ func (m *Lease) Unmarshal(dAtA []byte) error {
+@@ -1923,10 +1923,7 @@ func (m *Lease) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -1167,7 +1167,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2119,7 +2116,7 @@ func (m *CreateRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -2119,7 +2116,7 @@ func (m *CreateRequest) Unmarshal(dAtA [
  					if err !=3D nil {
  						return err
  					}
@@ -1176,7 +1176,7 @@ index 4dbac3e09..5e7cab71f 100644
  						return ErrInvalidLengthLeases
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -2136,10 +2133,7 @@ func (m *CreateRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -2136,10 +2133,7 @@ func (m *CreateRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -1188,7 +1188,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2226,10 +2220,7 @@ func (m *CreateResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -2226,10 +2220,7 @@ func (m *CreateResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -1200,7 +1200,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2332,10 +2323,7 @@ func (m *DeleteRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -2332,10 +2323,7 @@ func (m *DeleteRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -1212,7 +1212,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2418,10 +2406,7 @@ func (m *ListRequest) Unmarshal(dAtA []byte) error =
{
+@@ -2418,10 +2406,7 @@ func (m *ListRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -1224,7 +1224,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2506,10 +2491,7 @@ func (m *ListResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -2506,10 +2491,7 @@ func (m *ListResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -1236,7 +1236,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2624,10 +2606,7 @@ func (m *Resource) Unmarshal(dAtA []byte) error {
+@@ -2624,10 +2606,7 @@ func (m *Resource) Unmarshal(dAtA []byte
  			if err !=3D nil {
  				return err
  			}
@@ -1248,7 +1248,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2743,10 +2722,7 @@ func (m *AddResourceRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -2743,10 +2722,7 @@ func (m *AddResourceRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -1260,7 +1260,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2862,10 +2838,7 @@ func (m *DeleteResourceRequest) Unmarshal(dAtA []by=
te) error {
+@@ -2862,10 +2838,7 @@ func (m *DeleteResourceRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1272,7 +1272,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -2948,10 +2921,7 @@ func (m *ListResourcesRequest) Unmarshal(dAtA []byt=
e) error {
+@@ -2948,10 +2921,7 @@ func (m *ListResourcesRequest) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -1284,7 +1284,7 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-@@ -3036,10 +3006,7 @@ func (m *ListResourcesResponse) Unmarshal(dAtA []by=
te) error {
+@@ -3036,10 +3006,7 @@ func (m *ListResourcesResponse) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1296,11 +1296,11 @@ index 4dbac3e09..5e7cab71f 100644
  				return ErrInvalidLengthLeases
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/namespaces/v1/namespace.pb.go b/src/i=
mport/api/services/namespaces/v1/namespace.pb.go
-index 0d1d650ba..76f9e1172 100644
---- a/src/import/api/services/namespaces/v1/namespace.pb.go
-+++ b/src/import/api/services/namespaces/v1/namespace.pb.go
-@@ -1609,7 +1609,7 @@ func (m *Namespace) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/services/namespaces/v1/namespace.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/namespaces/v1/namespace.pb.go
++++ git/src/import/api/services/namespaces/v1/namespace.pb.go
+@@ -1609,7 +1609,7 @@ func (m *Namespace) Unmarshal(dAtA []byt
  					if err !=3D nil {
  						return err
  					}
@@ -1309,7 +1309,7 @@ index 0d1d650ba..76f9e1172 100644
  						return ErrInvalidLengthNamespace
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1626,10 +1626,7 @@ func (m *Namespace) Unmarshal(dAtA []byte) error {
+@@ -1626,10 +1626,7 @@ func (m *Namespace) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -1321,7 +1321,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -1712,10 +1709,7 @@ func (m *GetNamespaceRequest) Unmarshal(dAtA []byte=
) error {
+@@ -1712,10 +1709,7 @@ func (m *GetNamespaceRequest) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -1333,7 +1333,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -1799,10 +1793,7 @@ func (m *GetNamespaceResponse) Unmarshal(dAtA []byt=
e) error {
+@@ -1799,10 +1793,7 @@ func (m *GetNamespaceResponse) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -1345,7 +1345,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -1885,10 +1876,7 @@ func (m *ListNamespacesRequest) Unmarshal(dAtA []by=
te) error {
+@@ -1885,10 +1876,7 @@ func (m *ListNamespacesRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1357,7 +1357,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -1973,10 +1961,7 @@ func (m *ListNamespacesResponse) Unmarshal(dAtA []b=
yte) error {
+@@ -1973,10 +1961,7 @@ func (m *ListNamespacesResponse) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -1369,7 +1369,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -2060,10 +2045,7 @@ func (m *CreateNamespaceRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -2060,10 +2045,7 @@ func (m *CreateNamespaceRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -1381,7 +1381,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -2147,10 +2129,7 @@ func (m *CreateNamespaceResponse) Unmarshal(dAtA []=
byte) error {
+@@ -2147,10 +2129,7 @@ func (m *CreateNamespaceResponse) Unmars
  			if err !=3D nil {
  				return err
  			}
@@ -1393,7 +1393,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -2270,10 +2249,7 @@ func (m *UpdateNamespaceRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -2270,10 +2249,7 @@ func (m *UpdateNamespaceRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -1405,7 +1405,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -2357,10 +2333,7 @@ func (m *UpdateNamespaceResponse) Unmarshal(dAtA []=
byte) error {
+@@ -2357,10 +2333,7 @@ func (m *UpdateNamespaceResponse) Unmars
  			if err !=3D nil {
  				return err
  			}
@@ -1417,7 +1417,7 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-@@ -2443,10 +2416,7 @@ func (m *DeleteNamespaceRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -2443,10 +2416,7 @@ func (m *DeleteNamespaceRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -1429,11 +1429,11 @@ index 0d1d650ba..76f9e1172 100644
  				return ErrInvalidLengthNamespace
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/snapshots/v1/snapshots.pb.go b/src/im=
port/api/services/snapshots/v1/snapshots.pb.go
-index 1877afded..046c97b01 100644
---- a/src/import/api/services/snapshots/v1/snapshots.pb.go
-+++ b/src/import/api/services/snapshots/v1/snapshots.pb.go
-@@ -3140,7 +3140,7 @@ func (m *PrepareSnapshotRequest) Unmarshal(dAtA []by=
te) error {
+Index: git/src/import/api/services/snapshots/v1/snapshots.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/snapshots/v1/snapshots.pb.go
++++ git/src/import/api/services/snapshots/v1/snapshots.pb.go
+@@ -3140,7 +3140,7 @@ func (m *PrepareSnapshotRequest) Unmarsh
  					if err !=3D nil {
  						return err
  					}
@@ -1442,7 +1442,7 @@ index 1877afded..046c97b01 100644
  						return ErrInvalidLengthSnapshots
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -3157,10 +3157,7 @@ func (m *PrepareSnapshotRequest) Unmarshal(dAtA []b=
yte) error {
+@@ -3157,10 +3157,7 @@ func (m *PrepareSnapshotRequest) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -1454,7 +1454,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -3245,10 +3242,7 @@ func (m *PrepareSnapshotResponse) Unmarshal(dAtA []=
byte) error {
+@@ -3245,10 +3242,7 @@ func (m *PrepareSnapshotResponse) Unmars
  			if err !=3D nil {
  				return err
  			}
@@ -1466,7 +1466,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -3505,7 +3499,7 @@ func (m *ViewSnapshotRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -3505,7 +3499,7 @@ func (m *ViewSnapshotRequest) Unmarshal(
  					if err !=3D nil {
  						return err
  					}
@@ -1475,7 +1475,7 @@ index 1877afded..046c97b01 100644
  						return ErrInvalidLengthSnapshots
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -3522,10 +3516,7 @@ func (m *ViewSnapshotRequest) Unmarshal(dAtA []byte=
) error {
+@@ -3522,10 +3516,7 @@ func (m *ViewSnapshotRequest) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -1487,7 +1487,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -3610,10 +3601,7 @@ func (m *ViewSnapshotResponse) Unmarshal(dAtA []byt=
e) error {
+@@ -3610,10 +3601,7 @@ func (m *ViewSnapshotResponse) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -1499,7 +1499,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -3728,10 +3716,7 @@ func (m *MountsRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -3728,10 +3716,7 @@ func (m *MountsRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -1511,7 +1511,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -3816,10 +3801,7 @@ func (m *MountsResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -3816,10 +3801,7 @@ func (m *MountsResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -1523,7 +1523,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -3934,10 +3916,7 @@ func (m *RemoveSnapshotRequest) Unmarshal(dAtA []by=
te) error {
+@@ -3934,10 +3916,7 @@ func (m *RemoveSnapshotRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1535,7 +1535,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -4194,7 +4173,7 @@ func (m *CommitSnapshotRequest) Unmarshal(dAtA []byt=
e) error {
+@@ -4194,7 +4173,7 @@ func (m *CommitSnapshotRequest) Unmarsha
  					if err !=3D nil {
  						return err
  					}
@@ -1544,7 +1544,7 @@ index 1877afded..046c97b01 100644
  						return ErrInvalidLengthSnapshots
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -4211,10 +4190,7 @@ func (m *CommitSnapshotRequest) Unmarshal(dAtA []by=
te) error {
+@@ -4211,10 +4190,7 @@ func (m *CommitSnapshotRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1556,7 +1556,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -4329,10 +4305,7 @@ func (m *StatSnapshotRequest) Unmarshal(dAtA []byte=
) error {
+@@ -4329,10 +4305,7 @@ func (m *StatSnapshotRequest) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -1568,7 +1568,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -4642,7 +4615,7 @@ func (m *Info) Unmarshal(dAtA []byte) error {
+@@ -4642,7 +4615,7 @@ func (m *Info) Unmarshal(dAtA []byte) er
  					if err !=3D nil {
  						return err
  					}
@@ -1577,7 +1577,7 @@ index 1877afded..046c97b01 100644
  						return ErrInvalidLengthSnapshots
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -4659,10 +4632,7 @@ func (m *Info) Unmarshal(dAtA []byte) error {
+@@ -4659,10 +4632,7 @@ func (m *Info) Unmarshal(dAtA []byte) er
  			if err !=3D nil {
  				return err
  			}
@@ -1589,7 +1589,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -4746,10 +4716,7 @@ func (m *StatSnapshotResponse) Unmarshal(dAtA []byt=
e) error {
+@@ -4746,10 +4716,7 @@ func (m *StatSnapshotResponse) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -1601,7 +1601,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -4901,10 +4868,7 @@ func (m *UpdateSnapshotRequest) Unmarshal(dAtA []by=
te) error {
+@@ -4901,10 +4868,7 @@ func (m *UpdateSnapshotRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1613,7 +1613,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -4988,10 +4952,7 @@ func (m *UpdateSnapshotResponse) Unmarshal(dAtA []b=
yte) error {
+@@ -4988,10 +4952,7 @@ func (m *UpdateSnapshotResponse) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -1625,7 +1625,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -5106,10 +5067,7 @@ func (m *ListSnapshotsRequest) Unmarshal(dAtA []byt=
e) error {
+@@ -5106,10 +5067,7 @@ func (m *ListSnapshotsRequest) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -1637,7 +1637,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -5194,10 +5152,7 @@ func (m *ListSnapshotsResponse) Unmarshal(dAtA []by=
te) error {
+@@ -5194,10 +5152,7 @@ func (m *ListSnapshotsResponse) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -1649,7 +1649,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -5312,10 +5267,7 @@ func (m *UsageRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -5312,10 +5267,7 @@ func (m *UsageRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -1661,7 +1661,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -5404,10 +5356,7 @@ func (m *UsageResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -5404,10 +5356,7 @@ func (m *UsageResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -1673,7 +1673,7 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-@@ -5490,10 +5439,7 @@ func (m *CleanupRequest) Unmarshal(dAtA []byte) err=
or {
+@@ -5490,10 +5439,7 @@ func (m *CleanupRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -1685,19 +1685,19 @@ index 1877afded..046c97b01 100644
  				return ErrInvalidLengthSnapshots
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/tasks/v1/tasks.pb.go b/src/import/api=
/services/tasks/v1/tasks.pb.go
-index 5ac5af11b..4904e6508 100644
---- a/src/import/api/services/tasks/v1/tasks.pb.go
-+++ b/src/import/api/services/tasks/v1/tasks.pb.go
+Index: git/src/import/api/services/tasks/v1/tasks.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/tasks/v1/tasks.pb.go
++++ git/src/import/api/services/tasks/v1/tasks.pb.go
 @@ -9,6 +9,7 @@ import (
  	types "github.com/containerd/containerd/api/types"
- 	task "github.com/containerd/containerd/src/import/api/types/task"
+ 	task "github.com/containerd/containerd/api/types/task"
  	proto "github.com/gogo/protobuf/proto"
 +	github_com_gogo_protobuf_sortkeys "github.com/gogo/protobuf/sortkeys"
  	github_com_gogo_protobuf_types "github.com/gogo/protobuf/types"
  	types1 "github.com/gogo/protobuf/types"
  	github_com_opencontainers_go_digest "github.com/opencontainers/go-digest=
"
-@@ -934,11 +935,12 @@ func (m *CheckpointTaskResponse) XXX_DiscardUnknown(=
) {
+@@ -934,11 +935,12 @@ func (m *CheckpointTaskResponse) XXX_Dis
  var xxx_messageInfo_CheckpointTaskResponse proto.InternalMessageInfo
 =20
  type UpdateTaskRequest struct {
@@ -1901,7 +1901,7 @@ index 5ac5af11b..4904e6508 100644
  }
 =20
  // Reference imports to suppress errors if they are not otherwise used.
-@@ -2943,6 +2949,25 @@ func (m *UpdateTaskRequest) MarshalToSizedBuffer(dA=
tA []byte) (int, error) {
+@@ -2943,6 +2949,25 @@ func (m *UpdateTaskRequest) MarshalToSiz
  		i -=3D len(m.XXX_unrecognized)
  		copy(dAtA[i:], m.XXX_unrecognized)
  	}
@@ -1927,7 +1927,7 @@ index 5ac5af11b..4904e6508 100644
  	if m.Resources !=3D nil {
  		{
  			size, err :=3D m.Resources.MarshalToSizedBuffer(dAtA[:i])
-@@ -3611,6 +3636,14 @@ func (m *UpdateTaskRequest) Size() (n int) {
+@@ -3611,6 +3636,14 @@ func (m *UpdateTaskRequest) Size() (n in
  		l =3D m.Resources.Size()
  		n +=3D 1 + l + sovTasks(uint64(l))
  	}
@@ -1942,7 +1942,7 @@ index 5ac5af11b..4904e6508 100644
  	if m.XXX_unrecognized !=3D nil {
  		n +=3D len(m.XXX_unrecognized)
  	}
-@@ -3991,9 +4024,20 @@ func (this *UpdateTaskRequest) String() string {
+@@ -3991,9 +4024,20 @@ func (this *UpdateTaskRequest) String()
  	if this =3D=3D nil {
  		return "nil"
  	}
@@ -1963,7 +1963,7 @@ index 5ac5af11b..4904e6508 100644
  		`XXX_unrecognized:` + fmt.Sprintf("%v", this.XXX_unrecognized) + `,`,
  		`}`,
  	}, "")
-@@ -4347,10 +4391,7 @@ func (m *CreateTaskRequest) Unmarshal(dAtA []byte) =
error {
+@@ -4347,10 +4391,7 @@ func (m *CreateTaskRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -1975,7 +1975,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -4452,10 +4493,7 @@ func (m *CreateTaskResponse) Unmarshal(dAtA []byte)=
 error {
+@@ -4452,10 +4493,7 @@ func (m *CreateTaskResponse) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -1987,7 +1987,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -4570,10 +4608,7 @@ func (m *StartRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -4570,10 +4608,7 @@ func (m *StartRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -1999,7 +1999,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -4643,10 +4678,7 @@ func (m *StartResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -4643,10 +4678,7 @@ func (m *StartResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -2011,7 +2011,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -4729,10 +4761,7 @@ func (m *DeleteTaskRequest) Unmarshal(dAtA []byte) =
error {
+@@ -4729,10 +4761,7 @@ func (m *DeleteTaskRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2023,7 +2023,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -4886,10 +4915,7 @@ func (m *DeleteResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -4886,10 +4915,7 @@ func (m *DeleteResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2035,7 +2035,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5004,10 +5030,7 @@ func (m *DeleteProcessRequest) Unmarshal(dAtA []byt=
e) error {
+@@ -5004,10 +5030,7 @@ func (m *DeleteProcessRequest) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -2047,7 +2047,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5122,10 +5145,7 @@ func (m *GetRequest) Unmarshal(dAtA []byte) error {
+@@ -5122,10 +5145,7 @@ func (m *GetRequest) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -2059,7 +2059,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5212,10 +5232,7 @@ func (m *GetResponse) Unmarshal(dAtA []byte) error =
{
+@@ -5212,10 +5232,7 @@ func (m *GetResponse) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2071,7 +2071,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5298,10 +5315,7 @@ func (m *ListTasksRequest) Unmarshal(dAtA []byte) e=
rror {
+@@ -5298,10 +5315,7 @@ func (m *ListTasksRequest) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2083,7 +2083,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5386,10 +5400,7 @@ func (m *ListTasksResponse) Unmarshal(dAtA []byte) =
error {
+@@ -5386,10 +5400,7 @@ func (m *ListTasksResponse) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2095,7 +2095,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5543,10 +5554,7 @@ func (m *KillRequest) Unmarshal(dAtA []byte) error =
{
+@@ -5543,10 +5554,7 @@ func (m *KillRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2107,7 +2107,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5813,10 +5821,7 @@ func (m *ExecProcessRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -5813,10 +5821,7 @@ func (m *ExecProcessRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -2119,7 +2119,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -5867,10 +5872,7 @@ func (m *ExecProcessResponse) Unmarshal(dAtA []byte=
) error {
+@@ -5867,10 +5872,7 @@ func (m *ExecProcessResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -2131,7 +2131,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6023,10 +6025,7 @@ func (m *ResizePtyRequest) Unmarshal(dAtA []byte) e=
rror {
+@@ -6023,10 +6025,7 @@ func (m *ResizePtyRequest) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2143,7 +2143,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6161,10 +6160,7 @@ func (m *CloseIORequest) Unmarshal(dAtA []byte) err=
or {
+@@ -6161,10 +6160,7 @@ func (m *CloseIORequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2155,7 +2155,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6247,10 +6243,7 @@ func (m *PauseTaskRequest) Unmarshal(dAtA []byte) e=
rror {
+@@ -6247,10 +6243,7 @@ func (m *PauseTaskRequest) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2167,7 +2167,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6333,10 +6326,7 @@ func (m *ResumeTaskRequest) Unmarshal(dAtA []byte) =
error {
+@@ -6333,10 +6326,7 @@ func (m *ResumeTaskRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2179,7 +2179,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6419,10 +6409,7 @@ func (m *ListPidsRequest) Unmarshal(dAtA []byte) er=
ror {
+@@ -6419,10 +6409,7 @@ func (m *ListPidsRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2191,7 +2191,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6507,10 +6494,7 @@ func (m *ListPidsResponse) Unmarshal(dAtA []byte) e=
rror {
+@@ -6507,10 +6494,7 @@ func (m *ListPidsResponse) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2203,7 +2203,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6661,10 +6645,7 @@ func (m *CheckpointTaskRequest) Unmarshal(dAtA []by=
te) error {
+@@ -6661,10 +6645,7 @@ func (m *CheckpointTaskRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -2215,7 +2215,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6749,10 +6730,7 @@ func (m *CheckpointTaskResponse) Unmarshal(dAtA []b=
yte) error {
+@@ -6749,10 +6730,7 @@ func (m *CheckpointTaskResponse) Unmarsh
  			if err !=3D nil {
  				return err
  			}
@@ -2227,7 +2227,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6865,16 +6843,140 @@ func (m *UpdateTaskRequest) Unmarshal(dAtA []byte=
) error {
+@@ -6865,16 +6843,140 @@ func (m *UpdateTaskRequest) Unmarshal(dA
  				return err
  			}
  			iNdEx =3D postIndex
@@ -2372,7 +2372,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -6957,10 +7059,7 @@ func (m *MetricsRequest) Unmarshal(dAtA []byte) err=
or {
+@@ -6957,10 +7059,7 @@ func (m *MetricsRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2384,7 +2384,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -7045,10 +7144,7 @@ func (m *MetricsResponse) Unmarshal(dAtA []byte) er=
ror {
+@@ -7045,10 +7144,7 @@ func (m *MetricsResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2396,7 +2396,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -7163,10 +7259,7 @@ func (m *WaitRequest) Unmarshal(dAtA []byte) error =
{
+@@ -7163,10 +7259,7 @@ func (m *WaitRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2408,7 +2408,7 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-@@ -7269,10 +7362,7 @@ func (m *WaitResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -7269,10 +7362,7 @@ func (m *WaitResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -2420,11 +2420,11 @@ index 5ac5af11b..4904e6508 100644
  				return ErrInvalidLengthTasks
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/ttrpc/events/v1/events.pb.go b/src/im=
port/api/services/ttrpc/events/v1/events.pb.go
-index 0e61351d5..b1f275bf0 100644
---- a/src/import/api/services/ttrpc/events/v1/events.pb.go
-+++ b/src/import/api/services/ttrpc/events/v1/events.pb.go
-@@ -474,10 +474,7 @@ func (m *ForwardRequest) Unmarshal(dAtA []byte) error=
 {
+Index: git/src/import/api/services/ttrpc/events/v1/events.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/ttrpc/events/v1/events.pb.go
++++ git/src/import/api/services/ttrpc/events/v1/events.pb.go
+@@ -474,10 +474,7 @@ func (m *ForwardRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2436,7 +2436,7 @@ index 0e61351d5..b1f275bf0 100644
  				return ErrInvalidLengthEvents
  			}
  			if (iNdEx + skippy) > l {
-@@ -661,10 +658,7 @@ func (m *Envelope) Unmarshal(dAtA []byte) error {
+@@ -661,10 +658,7 @@ func (m *Envelope) Unmarshal(dAtA []byte
  			if err !=3D nil {
  				return err
  			}
@@ -2448,11 +2448,11 @@ index 0e61351d5..b1f275bf0 100644
  				return ErrInvalidLengthEvents
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/services/version/v1/version.pb.go b/src/import=
/api/services/version/v1/version.pb.go
-index 81b8c3395..b742c6ae6 100644
---- a/src/import/api/services/version/v1/version.pb.go
-+++ b/src/import/api/services/version/v1/version.pb.go
-@@ -374,10 +374,7 @@ func (m *VersionResponse) Unmarshal(dAtA []byte) erro=
r {
+Index: git/src/import/api/services/version/v1/version.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/services/version/v1/version.pb.go
++++ git/src/import/api/services/version/v1/version.pb.go
+@@ -374,10 +374,7 @@ func (m *VersionResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2464,11 +2464,11 @@ index 81b8c3395..b742c6ae6 100644
  				return ErrInvalidLengthVersion
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/types/descriptor.pb.go b/src/import/api/types/=
descriptor.pb.go
-index 437d41f23..fe71dbf43 100644
---- a/src/import/api/types/descriptor.pb.go
-+++ b/src/import/api/types/descriptor.pb.go
-@@ -479,7 +479,7 @@ func (m *Descriptor) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/types/descriptor.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/types/descriptor.pb.go
++++ git/src/import/api/types/descriptor.pb.go
+@@ -479,7 +479,7 @@ func (m *Descriptor) Unmarshal(dAtA []by
  					if err !=3D nil {
  						return err
  					}
@@ -2477,7 +2477,7 @@ index 437d41f23..fe71dbf43 100644
  						return ErrInvalidLengthDescriptor
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -496,10 +496,7 @@ func (m *Descriptor) Unmarshal(dAtA []byte) error {
+@@ -496,10 +496,7 @@ func (m *Descriptor) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -2489,11 +2489,11 @@ index 437d41f23..fe71dbf43 100644
  				return ErrInvalidLengthDescriptor
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/types/metrics.pb.go b/src/import/api/types/met=
rics.pb.go
-index 89a8d9cd6..75773e442 100644
---- a/src/import/api/types/metrics.pb.go
-+++ b/src/import/api/types/metrics.pb.go
-@@ -348,10 +348,7 @@ func (m *Metric) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/types/metrics.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/types/metrics.pb.go
++++ git/src/import/api/types/metrics.pb.go
+@@ -348,10 +348,7 @@ func (m *Metric) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -2505,11 +2505,11 @@ index 89a8d9cd6..75773e442 100644
  				return ErrInvalidLengthMetrics
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/types/mount.pb.go b/src/import/api/types/mount=
.pb.go
-index 6872e4120..d0a0bee76 100644
---- a/src/import/api/types/mount.pb.go
-+++ b/src/import/api/types/mount.pb.go
-@@ -392,10 +392,7 @@ func (m *Mount) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/types/mount.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/types/mount.pb.go
++++ git/src/import/api/types/mount.pb.go
+@@ -392,10 +392,7 @@ func (m *Mount) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -2521,11 +2521,11 @@ index 6872e4120..d0a0bee76 100644
  				return ErrInvalidLengthMount
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/types/platform.pb.go b/src/import/api/types/pl=
atform.pb.go
-index c03d8b077..a0f78c8a7 100644
---- a/src/import/api/types/platform.pb.go
-+++ b/src/import/api/types/platform.pb.go
-@@ -333,10 +333,7 @@ func (m *Platform) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/types/platform.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/types/platform.pb.go
++++ git/src/import/api/types/platform.pb.go
+@@ -333,10 +333,7 @@ func (m *Platform) Unmarshal(dAtA []byte
  			if err !=3D nil {
  				return err
  			}
@@ -2537,11 +2537,11 @@ index c03d8b077..a0f78c8a7 100644
  				return ErrInvalidLengthPlatform
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/api/types/task/task.pb.go b/src/import/api/types/t=
ask/task.pb.go
-index ae824ff45..f511bbd05 100644
---- a/src/import/api/types/task/task.pb.go
-+++ b/src/import/api/types/task/task.pb.go
-@@ -772,10 +772,7 @@ func (m *Process) Unmarshal(dAtA []byte) error {
+Index: git/src/import/api/types/task/task.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/api/types/task/task.pb.go
++++ git/src/import/api/types/task/task.pb.go
+@@ -772,10 +772,7 @@ func (m *Process) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -2553,7 +2553,7 @@ index ae824ff45..f511bbd05 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-@@ -881,10 +878,7 @@ func (m *ProcessInfo) Unmarshal(dAtA []byte) error {
+@@ -881,10 +878,7 @@ func (m *ProcessInfo) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2565,11 +2565,11 @@ index ae824ff45..f511bbd05 100644
  				return ErrInvalidLengthTask
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/runtime/linux/runctypes/runc.pb.go b/src/import/ru=
ntime/linux/runctypes/runc.pb.go
-index 26306e594..46d31ff59 100644
---- a/src/import/runtime/linux/runctypes/runc.pb.go
-+++ b/src/import/runtime/linux/runctypes/runc.pb.go
-@@ -978,10 +978,7 @@ func (m *RuncOptions) Unmarshal(dAtA []byte) error {
+Index: git/src/import/runtime/linux/runctypes/runc.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/runtime/linux/runctypes/runc.pb.go
++++ git/src/import/runtime/linux/runctypes/runc.pb.go
+@@ -978,10 +978,7 @@ func (m *RuncOptions) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2581,7 +2581,7 @@ index 26306e594..46d31ff59 100644
  				return ErrInvalidLengthRunc
  			}
  			if (iNdEx + skippy) > l {
-@@ -1350,10 +1347,7 @@ func (m *CreateOptions) Unmarshal(dAtA []byte) erro=
r {
+@@ -1350,10 +1347,7 @@ func (m *CreateOptions) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -2593,7 +2593,7 @@ index 26306e594..46d31ff59 100644
  				return ErrInvalidLengthRunc
  			}
  			if (iNdEx + skippy) > l {
-@@ -1632,10 +1626,7 @@ func (m *CheckpointOptions) Unmarshal(dAtA []byte) =
error {
+@@ -1632,10 +1626,7 @@ func (m *CheckpointOptions) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2605,7 +2605,7 @@ index 26306e594..46d31ff59 100644
  				return ErrInvalidLengthRunc
  			}
  			if (iNdEx + skippy) > l {
-@@ -1718,10 +1709,7 @@ func (m *ProcessDetails) Unmarshal(dAtA []byte) err=
or {
+@@ -1718,10 +1709,7 @@ func (m *ProcessDetails) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2617,11 +2617,11 @@ index 26306e594..46d31ff59 100644
  				return ErrInvalidLengthRunc
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/runtime/v1/shim/v1/shim.pb.go b/src/import/runtime=
/v1/shim/v1/shim.pb.go
-index 27f334966..dbc82599d 100644
---- a/src/import/runtime/v1/shim/v1/shim.pb.go
-+++ b/src/import/runtime/v1/shim/v1/shim.pb.go
-@@ -3262,10 +3262,7 @@ func (m *CreateTaskRequest) Unmarshal(dAtA []byte) =
error {
+Index: git/src/import/runtime/v1/shim/v1/shim.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/runtime/v1/shim/v1/shim.pb.go
++++ git/src/import/runtime/v1/shim/v1/shim.pb.go
+@@ -3262,10 +3262,7 @@ func (m *CreateTaskRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2633,7 +2633,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -3335,10 +3332,7 @@ func (m *CreateTaskResponse) Unmarshal(dAtA []byte)=
 error {
+@@ -3335,10 +3332,7 @@ func (m *CreateTaskResponse) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -2645,7 +2645,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -3460,10 +3454,7 @@ func (m *DeleteResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -3460,10 +3454,7 @@ func (m *DeleteResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2657,7 +2657,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -3546,10 +3537,7 @@ func (m *DeleteProcessRequest) Unmarshal(dAtA []byt=
e) error {
+@@ -3546,10 +3537,7 @@ func (m *DeleteProcessRequest) Unmarshal
  			if err !=3D nil {
  				return err
  			}
@@ -2669,7 +2669,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -3784,10 +3772,7 @@ func (m *ExecProcessRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -3784,10 +3772,7 @@ func (m *ExecProcessRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -2681,7 +2681,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -3838,10 +3823,7 @@ func (m *ExecProcessResponse) Unmarshal(dAtA []byte=
) error {
+@@ -3838,10 +3823,7 @@ func (m *ExecProcessResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -2693,7 +2693,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -3962,10 +3944,7 @@ func (m *ResizePtyRequest) Unmarshal(dAtA []byte) e=
rror {
+@@ -3962,10 +3944,7 @@ func (m *ResizePtyRequest) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2705,7 +2705,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4048,10 +4027,7 @@ func (m *StateRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -4048,10 +4027,7 @@ func (m *StateRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -2717,7 +2717,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4372,10 +4348,7 @@ func (m *StateResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -4372,10 +4348,7 @@ func (m *StateResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -2729,7 +2729,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4497,10 +4470,7 @@ func (m *KillRequest) Unmarshal(dAtA []byte) error =
{
+@@ -4497,10 +4470,7 @@ func (m *KillRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2741,7 +2741,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4603,10 +4573,7 @@ func (m *CloseIORequest) Unmarshal(dAtA []byte) err=
or {
+@@ -4603,10 +4573,7 @@ func (m *CloseIORequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2753,7 +2753,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4689,10 +4656,7 @@ func (m *ListPidsRequest) Unmarshal(dAtA []byte) er=
ror {
+@@ -4689,10 +4656,7 @@ func (m *ListPidsRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2765,7 +2765,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4777,10 +4741,7 @@ func (m *ListPidsResponse) Unmarshal(dAtA []byte) e=
rror {
+@@ -4777,10 +4741,7 @@ func (m *ListPidsResponse) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2777,7 +2777,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4899,10 +4860,7 @@ func (m *CheckpointTaskRequest) Unmarshal(dAtA []by=
te) error {
+@@ -4899,10 +4860,7 @@ func (m *CheckpointTaskRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -2789,7 +2789,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4972,10 +4930,7 @@ func (m *ShimInfoResponse) Unmarshal(dAtA []byte) e=
rror {
+@@ -4972,10 +4930,7 @@ func (m *ShimInfoResponse) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -2801,7 +2801,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5062,10 +5017,7 @@ func (m *UpdateTaskRequest) Unmarshal(dAtA []byte) =
error {
+@@ -5062,10 +5017,7 @@ func (m *UpdateTaskRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2813,7 +2813,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5148,10 +5100,7 @@ func (m *StartRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -5148,10 +5100,7 @@ func (m *StartRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -2825,7 +2825,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5253,10 +5202,7 @@ func (m *StartResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -5253,10 +5202,7 @@ func (m *StartResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -2837,7 +2837,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5339,10 +5285,7 @@ func (m *WaitRequest) Unmarshal(dAtA []byte) error =
{
+@@ -5339,10 +5285,7 @@ func (m *WaitRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -2849,7 +2849,7 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5445,10 +5388,7 @@ func (m *WaitResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -5445,10 +5388,7 @@ func (m *WaitResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -2861,11 +2861,11 @@ index 27f334966..dbc82599d 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/runtime/v2/runc/options/oci.pb.go b/src/import/run=
time/v2/runc/options/oci.pb.go
-index f298452b6..c9c44742a 100644
---- a/src/import/runtime/v2/runc/options/oci.pb.go
-+++ b/src/import/runtime/v2/runc/options/oci.pb.go
-@@ -994,10 +994,7 @@ func (m *Options) Unmarshal(dAtA []byte) error {
+Index: git/src/import/runtime/v2/runc/options/oci.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/runtime/v2/runc/options/oci.pb.go
++++ git/src/import/runtime/v2/runc/options/oci.pb.go
+@@ -994,10 +994,7 @@ func (m *Options) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -2877,7 +2877,7 @@ index f298452b6..c9c44742a 100644
  				return ErrInvalidLengthOci
  			}
  			if (iNdEx + skippy) > l {
-@@ -1276,10 +1273,7 @@ func (m *CheckpointOptions) Unmarshal(dAtA []byte) =
error {
+@@ -1276,10 +1273,7 @@ func (m *CheckpointOptions) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -2889,7 +2889,7 @@ index f298452b6..c9c44742a 100644
  				return ErrInvalidLengthOci
  			}
  			if (iNdEx + skippy) > l {
-@@ -1362,10 +1356,7 @@ func (m *ProcessDetails) Unmarshal(dAtA []byte) err=
or {
+@@ -1362,10 +1356,7 @@ func (m *ProcessDetails) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -2901,19 +2901,19 @@ index f298452b6..c9c44742a 100644
  				return ErrInvalidLengthOci
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/runtime/v2/task/shim.pb.go b/src/import/runtime/v2=
/task/shim.pb.go
-index 3cf11d8e3..6366f9c57 100644
---- a/src/import/runtime/v2/task/shim.pb.go
-+++ b/src/import/runtime/v2/task/shim.pb.go
+Index: git/src/import/runtime/v2/task/shim.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/runtime/v2/task/shim.pb.go
++++ git/src/import/runtime/v2/task/shim.pb.go
 @@ -10,6 +10,7 @@ import (
- 	task "github.com/containerd/containerd/src/import/api/types/task"
+ 	task "github.com/containerd/containerd/api/types/task"
  	github_com_containerd_ttrpc "github.com/containerd/ttrpc"
  	proto "github.com/gogo/protobuf/proto"
 +	github_com_gogo_protobuf_sortkeys "github.com/gogo/protobuf/sortkeys"
  	github_com_gogo_protobuf_types "github.com/gogo/protobuf/types"
  	types1 "github.com/gogo/protobuf/types"
  	io "io"
-@@ -617,11 +618,12 @@ func (m *CheckpointTaskRequest) XXX_DiscardUnknown()=
 {
+@@ -617,11 +618,12 @@ func (m *CheckpointTaskRequest) XXX_Disc
  var xxx_messageInfo_CheckpointTaskRequest proto.InternalMessageInfo
 =20
  type UpdateTaskRequest struct {
@@ -3108,7 +3108,7 @@ index 3cf11d8e3..6366f9c57 100644
  }
 =20
  func (m *CreateTaskRequest) Marshal() (dAtA []byte, err error) {
-@@ -2000,6 +2007,25 @@ func (m *UpdateTaskRequest) MarshalToSizedBuffer(dA=
tA []byte) (int, error) {
+@@ -2000,6 +2007,25 @@ func (m *UpdateTaskRequest) MarshalToSiz
  		i -=3D len(m.XXX_unrecognized)
  		copy(dAtA[i:], m.XXX_unrecognized)
  	}
@@ -3134,7 +3134,7 @@ index 3cf11d8e3..6366f9c57 100644
  	if m.Resources !=3D nil {
  		{
  			size, err :=3D m.Resources.MarshalToSizedBuffer(dAtA[:i])
-@@ -2826,6 +2852,14 @@ func (m *UpdateTaskRequest) Size() (n int) {
+@@ -2826,6 +2852,14 @@ func (m *UpdateTaskRequest) Size() (n in
  		l =3D m.Resources.Size()
  		n +=3D 1 + l + sovShim(uint64(l))
  	}
@@ -3149,7 +3149,7 @@ index 3cf11d8e3..6366f9c57 100644
  	if m.XXX_unrecognized !=3D nil {
  		n +=3D len(m.XXX_unrecognized)
  	}
-@@ -3237,9 +3271,20 @@ func (this *UpdateTaskRequest) String() string {
+@@ -3237,9 +3271,20 @@ func (this *UpdateTaskRequest) String()
  	if this =3D=3D nil {
  		return "nil"
  	}
@@ -3170,7 +3170,7 @@ index 3cf11d8e3..6366f9c57 100644
  		`XXX_unrecognized:` + fmt.Sprintf("%v", this.XXX_unrecognized) + `,`,
  		`}`,
  	}, "")
-@@ -4019,10 +4064,7 @@ func (m *CreateTaskRequest) Unmarshal(dAtA []byte) =
error {
+@@ -4019,10 +4064,7 @@ func (m *CreateTaskRequest) Unmarshal(dA
  			if err !=3D nil {
  				return err
  			}
@@ -3182,7 +3182,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4092,10 +4134,7 @@ func (m *CreateTaskResponse) Unmarshal(dAtA []byte)=
 error {
+@@ -4092,10 +4134,7 @@ func (m *CreateTaskResponse) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -3194,7 +3194,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4210,10 +4249,7 @@ func (m *DeleteRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -4210,10 +4249,7 @@ func (m *DeleteRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -3206,7 +3206,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4335,10 +4371,7 @@ func (m *DeleteResponse) Unmarshal(dAtA []byte) err=
or {
+@@ -4335,10 +4371,7 @@ func (m *DeleteResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -3218,7 +3218,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4605,10 +4638,7 @@ func (m *ExecProcessRequest) Unmarshal(dAtA []byte)=
 error {
+@@ -4605,10 +4638,7 @@ func (m *ExecProcessRequest) Unmarshal(d
  			if err !=3D nil {
  				return err
  			}
@@ -3230,7 +3230,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4659,10 +4689,7 @@ func (m *ExecProcessResponse) Unmarshal(dAtA []byte=
) error {
+@@ -4659,10 +4689,7 @@ func (m *ExecProcessResponse) Unmarshal(
  			if err !=3D nil {
  				return err
  			}
@@ -3242,7 +3242,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4815,10 +4842,7 @@ func (m *ResizePtyRequest) Unmarshal(dAtA []byte) e=
rror {
+@@ -4815,10 +4842,7 @@ func (m *ResizePtyRequest) Unmarshal(dAt
  			if err !=3D nil {
  				return err
  			}
@@ -3254,7 +3254,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -4933,10 +4957,7 @@ func (m *StateRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -4933,10 +4957,7 @@ func (m *StateRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -3266,7 +3266,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5289,10 +5310,7 @@ func (m *StateResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -5289,10 +5310,7 @@ func (m *StateResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -3278,7 +3278,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5446,10 +5464,7 @@ func (m *KillRequest) Unmarshal(dAtA []byte) error =
{
+@@ -5446,10 +5464,7 @@ func (m *KillRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -3290,7 +3290,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5584,10 +5599,7 @@ func (m *CloseIORequest) Unmarshal(dAtA []byte) err=
or {
+@@ -5584,10 +5599,7 @@ func (m *CloseIORequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -3302,7 +3302,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5670,10 +5682,7 @@ func (m *PidsRequest) Unmarshal(dAtA []byte) error =
{
+@@ -5670,10 +5682,7 @@ func (m *PidsRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -3314,7 +3314,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5758,10 +5767,7 @@ func (m *PidsResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -5758,10 +5767,7 @@ func (m *PidsResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -3326,7 +3326,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -5912,10 +5918,7 @@ func (m *CheckpointTaskRequest) Unmarshal(dAtA []by=
te) error {
+@@ -5912,10 +5918,7 @@ func (m *CheckpointTaskRequest) Unmarsha
  			if err !=3D nil {
  				return err
  			}
@@ -3338,7 +3338,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6028,16 +6031,140 @@ func (m *UpdateTaskRequest) Unmarshal(dAtA []byte=
) error {
+@@ -6028,16 +6031,140 @@ func (m *UpdateTaskRequest) Unmarshal(dA
  				return err
  			}
  			iNdEx =3D postIndex
@@ -3483,7 +3483,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6152,10 +6279,7 @@ func (m *StartRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -6152,10 +6279,7 @@ func (m *StartRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -3495,7 +3495,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6225,10 +6349,7 @@ func (m *StartResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -6225,10 +6349,7 @@ func (m *StartResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -3507,7 +3507,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6343,10 +6464,7 @@ func (m *WaitRequest) Unmarshal(dAtA []byte) error =
{
+@@ -6343,10 +6464,7 @@ func (m *WaitRequest) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -3519,7 +3519,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6449,10 +6567,7 @@ func (m *WaitResponse) Unmarshal(dAtA []byte) error=
 {
+@@ -6449,10 +6567,7 @@ func (m *WaitResponse) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -3531,7 +3531,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6535,10 +6650,7 @@ func (m *StatsRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -6535,10 +6650,7 @@ func (m *StatsRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -3543,7 +3543,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6625,10 +6737,7 @@ func (m *StatsResponse) Unmarshal(dAtA []byte) erro=
r {
+@@ -6625,10 +6737,7 @@ func (m *StatsResponse) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -3555,7 +3555,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6711,10 +6820,7 @@ func (m *ConnectRequest) Unmarshal(dAtA []byte) err=
or {
+@@ -6711,10 +6820,7 @@ func (m *ConnectRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -3567,7 +3567,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6835,10 +6941,7 @@ func (m *ConnectResponse) Unmarshal(dAtA []byte) er=
ror {
+@@ -6835,10 +6941,7 @@ func (m *ConnectResponse) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -3579,7 +3579,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -6941,10 +7044,7 @@ func (m *ShutdownRequest) Unmarshal(dAtA []byte) er=
ror {
+@@ -6941,10 +7044,7 @@ func (m *ShutdownRequest) Unmarshal(dAtA
  			if err !=3D nil {
  				return err
  			}
@@ -3591,7 +3591,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -7027,10 +7127,7 @@ func (m *PauseRequest) Unmarshal(dAtA []byte) error=
 {
+@@ -7027,10 +7127,7 @@ func (m *PauseRequest) Unmarshal(dAtA []
  			if err !=3D nil {
  				return err
  			}
@@ -3603,7 +3603,7 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-@@ -7113,10 +7210,7 @@ func (m *ResumeRequest) Unmarshal(dAtA []byte) erro=
r {
+@@ -7113,10 +7210,7 @@ func (m *ResumeRequest) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -3615,11 +3615,11 @@ index 3cf11d8e3..6366f9c57 100644
  				return ErrInvalidLengthShim
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/u=
nmarshal.go b/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/u=
nmarshal.go
-index 9a2374b56..fae67de4f 100644
---- a/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/unmarsha=
l.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/unmarsha=
l.go
-@@ -844,7 +844,7 @@ func (p *unmarshal) field(file *generator.FileDescript=
or, msg *generator.Descrip
+Index: git/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/unm=
arshal.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/u=
nmarshal.go
++++ git/src/import/vendor/github.com/gogo/protobuf/plugin/unmarshal/unmars=
hal.go
+@@ -844,7 +844,7 @@ func (p *unmarshal) field(file *generato
  			p.P(`return err`)
  			p.Out()
  			p.P(`}`)
@@ -3628,7 +3628,7 @@ index 9a2374b56..fae67de4f 100644
  			p.In()
  			p.P(`return ErrInvalidLength`, p.localName)
  			p.Out()
-@@ -1484,12 +1484,7 @@ func (p *unmarshal) Generate(file *generator.FileDe=
scriptor) {
+@@ -1484,12 +1484,7 @@ func (p *unmarshal) Generate(file *gener
  			p.P(`return err`)
  			p.Out()
  			p.P(`}`)
@@ -3642,7 +3642,7 @@ index 9a2374b56..fae67de4f 100644
  			p.In()
  			p.P(`return ErrInvalidLength`, p.localName)
  			p.Out()
-@@ -1512,12 +1507,7 @@ func (p *unmarshal) Generate(file *generator.FileDe=
scriptor) {
+@@ -1512,12 +1507,7 @@ func (p *unmarshal) Generate(file *gener
  		p.P(`return err`)
  		p.Out()
  		p.P(`}`)
@@ -3656,11 +3656,11 @@ index 9a2374b56..fae67de4f 100644
  		p.In()
  		p.P(`return ErrInvalidLength`, p.localName)
  		p.Out()
-diff --git a/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.=
go b/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.go
-index 1ce0be2fa..f85c0cc81 100644
---- a/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.go
-@@ -318,7 +318,7 @@ func unescape(s string) (ch string, tail string, err e=
rror) {
+Index: git/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.=
go
++++ git/src/import/vendor/github.com/gogo/protobuf/proto/text_parser.go
+@@ -318,7 +318,7 @@ func unescape(s string) (ch string, tail
  		if i > utf8.MaxRune {
  			return "", "", fmt.Errorf(`\%c%s is not a valid Unicode code point`, r=
, ss)
  		}
@@ -3669,11 +3669,11 @@ index 1ce0be2fa..f85c0cc81 100644
  	}
  	return "", "", fmt.Errorf(`unknown escape \%c`, r)
  }
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/any.pb.go b/=
src/import/vendor/github.com/gogo/protobuf/types/any.pb.go
-index 98e269d54..e3d4d9490 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/any.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/any.pb.go
-@@ -592,10 +592,7 @@ func (m *Any) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/any.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/any.pb.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/any.pb.go
+@@ -592,10 +592,7 @@ func (m *Any) Unmarshal(dAtA []byte) err
  			if err !=3D nil {
  				return err
  			}
@@ -3685,11 +3685,11 @@ index 98e269d54..e3d4d9490 100644
  				return ErrInvalidLengthAny
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/api.pb.go b/=
src/import/vendor/github.com/gogo/protobuf/types/api.pb.go
-index 58bf4b53b..83e886920 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/api.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/api.pb.go
-@@ -1677,10 +1677,7 @@ func (m *Api) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/api.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/api.pb.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/api.pb.go
+@@ -1677,10 +1677,7 @@ func (m *Api) Unmarshal(dAtA []byte) err
  			if err !=3D nil {
  				return err
  			}
@@ -3701,7 +3701,7 @@ index 58bf4b53b..83e886920 100644
  				return ErrInvalidLengthApi
  			}
  			if (iNdEx + skippy) > l {
-@@ -1920,10 +1917,7 @@ func (m *Method) Unmarshal(dAtA []byte) error {
+@@ -1920,10 +1917,7 @@ func (m *Method) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -3713,7 +3713,7 @@ index 58bf4b53b..83e886920 100644
  				return ErrInvalidLengthApi
  			}
  			if (iNdEx + skippy) > l {
-@@ -2038,10 +2032,7 @@ func (m *Mixin) Unmarshal(dAtA []byte) error {
+@@ -2038,10 +2032,7 @@ func (m *Mixin) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -3725,11 +3725,11 @@ index 58bf4b53b..83e886920 100644
  				return ErrInvalidLengthApi
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.=
go b/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.go
-index 3959f0669..4deafcb1c 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.go
-@@ -415,10 +415,7 @@ func (m *Duration) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.=
go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/duration.pb.go
+@@ -415,10 +415,7 @@ func (m *Duration) Unmarshal(dAtA []byte
  			if err !=3D nil {
  				return err
  			}
@@ -3741,11 +3741,11 @@ index 3959f0669..4deafcb1c 100644
  				return ErrInvalidLengthDuration
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go =
b/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go
-index 17e3aa558..9e94748b3 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go
-@@ -360,10 +360,7 @@ func (m *Empty) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/empty.pb.go
+@@ -360,10 +360,7 @@ func (m *Empty) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -3757,11 +3757,11 @@ index 17e3aa558..9e94748b3 100644
  				return ErrInvalidLengthEmpty
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/field_mask.p=
b.go b/src/import/vendor/github.com/gogo/protobuf/types/field_mask.pb.go
-index 7226b57f7..6ae346d92 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/field_mask.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/field_mask.pb.go
-@@ -636,10 +636,7 @@ func (m *FieldMask) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/field_mask.pb.=
go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/field_mask.p=
b.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/field_mask.pb.go
+@@ -636,10 +636,7 @@ func (m *FieldMask) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -3773,11 +3773,11 @@ index 7226b57f7..6ae346d92 100644
  				return ErrInvalidLengthFieldMask
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/source_conte=
xt.pb.go b/src/import/vendor/github.com/gogo/protobuf/types/source_context.=
pb.go
-index 61045ce10..8e6ce71b2 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/source_context.pb.g=
o
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/source_context.pb.g=
o
-@@ -422,10 +422,7 @@ func (m *SourceContext) Unmarshal(dAtA []byte) error =
{
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/source_context=
.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/source_conte=
xt.pb.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/source_context.pb=
.go
+@@ -422,10 +422,7 @@ func (m *SourceContext) Unmarshal(dAtA [
  			if err !=3D nil {
  				return err
  			}
@@ -3789,11 +3789,11 @@ index 61045ce10..8e6ce71b2 100644
  				return ErrInvalidLengthSourceContext
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go=
 b/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go
-index cea553eef..c0457312e 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go
-@@ -1862,7 +1862,7 @@ func (m *Struct) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/struct.pb.go
+@@ -1862,7 +1862,7 @@ func (m *Struct) Unmarshal(dAtA []byte)
  					if err !=3D nil {
  						return err
  					}
@@ -3802,7 +3802,7 @@ index cea553eef..c0457312e 100644
  						return ErrInvalidLengthStruct
  					}
  					if (iNdEx + skippy) > postIndex {
-@@ -1879,10 +1879,7 @@ func (m *Struct) Unmarshal(dAtA []byte) error {
+@@ -1879,10 +1879,7 @@ func (m *Struct) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -3814,7 +3814,7 @@ index cea553eef..c0457312e 100644
  				return ErrInvalidLengthStruct
  			}
  			if (iNdEx + skippy) > l {
-@@ -2087,10 +2084,7 @@ func (m *Value) Unmarshal(dAtA []byte) error {
+@@ -2087,10 +2084,7 @@ func (m *Value) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -3826,7 +3826,7 @@ index cea553eef..c0457312e 100644
  				return ErrInvalidLengthStruct
  			}
  			if (iNdEx + skippy) > l {
-@@ -2175,10 +2169,7 @@ func (m *ListValue) Unmarshal(dAtA []byte) error {
+@@ -2175,10 +2169,7 @@ func (m *ListValue) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -3838,11 +3838,11 @@ index cea553eef..c0457312e 100644
  				return ErrInvalidLengthStruct
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb=
.go b/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb.go
-index b81875267..45db7b3bb 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb.go
-@@ -437,10 +437,7 @@ func (m *Timestamp) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb.g=
o
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb=
.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/timestamp.pb.go
+@@ -437,10 +437,7 @@ func (m *Timestamp) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -3854,11 +3854,11 @@ index b81875267..45db7b3bb 100644
  				return ErrInvalidLengthTimestamp
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go b=
/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go
-index 13b7ec02f..791427bb2 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go
-@@ -2483,10 +2483,7 @@ func (m *Type) Unmarshal(dAtA []byte) error {
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/type.pb.go
+@@ -2483,10 +2483,7 @@ func (m *Type) Unmarshal(dAtA []byte) er
  			if err !=3D nil {
  				return err
  			}
@@ -3870,7 +3870,7 @@ index 13b7ec02f..791427bb2 100644
  				return ErrInvalidLengthType
  			}
  			if (iNdEx + skippy) > l {
-@@ -2795,10 +2792,7 @@ func (m *Field) Unmarshal(dAtA []byte) error {
+@@ -2795,10 +2792,7 @@ func (m *Field) Unmarshal(dAtA []byte) e
  			if err !=3D nil {
  				return err
  			}
@@ -3882,7 +3882,7 @@ index 13b7ec02f..791427bb2 100644
  				return ErrInvalidLengthType
  			}
  			if (iNdEx + skippy) > l {
-@@ -3004,10 +2998,7 @@ func (m *Enum) Unmarshal(dAtA []byte) error {
+@@ -3004,10 +2998,7 @@ func (m *Enum) Unmarshal(dAtA []byte) er
  			if err !=3D nil {
  				return err
  			}
@@ -3894,7 +3894,7 @@ index 13b7ec02f..791427bb2 100644
  				return ErrInvalidLengthType
  			}
  			if (iNdEx + skippy) > l {
-@@ -3143,10 +3134,7 @@ func (m *EnumValue) Unmarshal(dAtA []byte) error {
+@@ -3143,10 +3134,7 @@ func (m *EnumValue) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -3906,7 +3906,7 @@ index 13b7ec02f..791427bb2 100644
  				return ErrInvalidLengthType
  			}
  			if (iNdEx + skippy) > l {
-@@ -3265,10 +3253,7 @@ func (m *Option) Unmarshal(dAtA []byte) error {
+@@ -3265,10 +3253,7 @@ func (m *Option) Unmarshal(dAtA []byte)
  			if err !=3D nil {
  				return err
  			}
@@ -3918,11 +3918,11 @@ index 13b7ec02f..791427bb2 100644
  				return ErrInvalidLengthType
  			}
  			if (iNdEx + skippy) > l {
-diff --git a/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.=
go b/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.go
-index 8f1edb57d..8d415420a 100644
---- a/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.go
-+++ b/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.go
-@@ -2020,10 +2020,7 @@ func (m *DoubleValue) Unmarshal(dAtA []byte) error =
{
+Index: git/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.go
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.=
go
++++ git/src/import/vendor/github.com/gogo/protobuf/types/wrappers.pb.go
+@@ -2020,10 +2020,7 @@ func (m *DoubleValue) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -3934,7 +3934,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2085,10 +2082,7 @@ func (m *FloatValue) Unmarshal(dAtA []byte) error {
+@@ -2085,10 +2082,7 @@ func (m *FloatValue) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -3946,7 +3946,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2158,10 +2152,7 @@ func (m *Int64Value) Unmarshal(dAtA []byte) error {
+@@ -2158,10 +2152,7 @@ func (m *Int64Value) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -3958,7 +3958,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2231,10 +2222,7 @@ func (m *UInt64Value) Unmarshal(dAtA []byte) error =
{
+@@ -2231,10 +2222,7 @@ func (m *UInt64Value) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -3970,7 +3970,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2304,10 +2292,7 @@ func (m *Int32Value) Unmarshal(dAtA []byte) error {
+@@ -2304,10 +2292,7 @@ func (m *Int32Value) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -3982,7 +3982,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2377,10 +2362,7 @@ func (m *UInt32Value) Unmarshal(dAtA []byte) error =
{
+@@ -2377,10 +2362,7 @@ func (m *UInt32Value) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -3994,7 +3994,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2451,10 +2433,7 @@ func (m *BoolValue) Unmarshal(dAtA []byte) error {
+@@ -2451,10 +2433,7 @@ func (m *BoolValue) Unmarshal(dAtA []byt
  			if err !=3D nil {
  				return err
  			}
@@ -4006,7 +4006,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2537,10 +2516,7 @@ func (m *StringValue) Unmarshal(dAtA []byte) error =
{
+@@ -2537,10 +2516,7 @@ func (m *StringValue) Unmarshal(dAtA []b
  			if err !=3D nil {
  				return err
  			}
@@ -4018,7 +4018,7 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
-@@ -2625,10 +2601,7 @@ func (m *BytesValue) Unmarshal(dAtA []byte) error {
+@@ -2625,10 +2601,7 @@ func (m *BytesValue) Unmarshal(dAtA []by
  			if err !=3D nil {
  				return err
  			}
@@ -4030,6 +4030,3 @@ index 8f1edb57d..8d415420a 100644
  				return ErrInvalidLengthWrappers
  			}
  			if (iNdEx + skippy) > l {
---=20
-2.30.2
-
--=20
2.30.2

