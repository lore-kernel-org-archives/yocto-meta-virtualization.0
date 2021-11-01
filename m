Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.41823.1635761622084593238
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 03:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bHjclvds;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6939de0b9a=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A19v5dN002710
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 1 Nov 2021 10:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Pi8Yjv3I6C//bP9QzqNJBqrzLlcM9d15w1qAophF6m0=;
 b=bHjclvdsnvRM8u/UsLbtx3l0cLhw+YYyE46gnDM7679vudMJL4PpvSKSngAmxaqGmzL9
 Fl5XKENHxsT7tpHN2Q9LdZ/4OclYFvYt+SOyRHDEmQSQbJyXOmz4FhqRB5jgh17wLfAh
 8CYnOftza0wUR/0bdeD0tYBvaA1hSeVw14fsn1HctehRXvfe7Z33vjKD9aY1IRTF2uqq
 R/Gmpsjgncd+7YOgFuszykp97o3dtgUxRYeWzZws9XtvNxyrKr/eIVJEnINy1Iuo3zAO
 wbLbXSpTUamIZOnMLTQwW5TKxKq/3rSOOUyW9XE5X1ARa/ONrrnZ0MW71Uq2UGRIL4wN Tw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2b7jr40x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Nov 2021 10:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/Y+P1xuGpO49gSK81RU4V2NjtlAkQ8pNARc8i1+OgHpnxBYsS0MGexz7L7wZPfQEhxDi2J3o6tuchqMnonvTEt/Yf9hrV8Sn3mb9a1N1R4zCwBXm4BaWczqyJx+A00cKDy+w5SE3mVy6nNv4bfzQ7az6EdTeHPQpmAWoKolSfMU74qKVSfHHx3GstPJM9ur4f64Jcs+q6fvDKDtN7SFyw0XGvuEAElRu/v3d+dLZ0KN0SE6A0E9KjbKSa5dW+UcQDjI+B8ZaEVPZzDJ5/vbzcPMoKECYadhMoOmPPUzQdu2udLJOeDXZxKv9sbYkVTutLOm4BQvTYsKrdTUkNeuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi8Yjv3I6C//bP9QzqNJBqrzLlcM9d15w1qAophF6m0=;
 b=UkNYwmmN8OwnJLPSYUlEDkHtq+MXwythv9W0Xi+gw+NTQLps84L8Zca1TkWVfo10JXVM6Z0MyDkf1Ux0M7j3NT4LKXBnoSrxyLZ1/o5kvb9qXIJY18g8aSTFvhjj4n57eb5LpHNDHdCAqLMlULrAEWrMlqoOAwFzQurQJXmUwR4IrpDe8CmPmmRRLAgGcE6VUfWrThcMmuDEB6/DDVU42QfpLIlmai23pOYQuzbk95IBAGavrGqphPwHPmynW4YKPUaVz8SOrkcP+VyJJm8exZZAgL/Jk/WwLG47IE1VN9+z/Mrj/vX5FyFtua3Z7DIpV+lJWh4KQgsHsIPpuEUoDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CH0PR11MB5739.namprd11.prod.outlook.com (2603:10b6:610:100::20)
 by CH2PR11MB4342.namprd11.prod.outlook.com (2603:10b6:610:3b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 10:13:38 +0000
Received: from CH0PR11MB5739.namprd11.prod.outlook.com
 ([fe80::bcf2:571f:eb41:1737]) by CH0PR11MB5739.namprd11.prod.outlook.com
 ([fe80::bcf2:571f:eb41:1737%2]) with mapi id 15.20.4649.018; Mon, 1 Nov 2021
 10:13:37 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: update to 4.0.11
Date: Mon,  1 Nov 2021 18:13:19 +0800
Message-Id: <20211101101319.3449912-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To CH0PR11MB5739.namprd11.prod.outlook.com
 (2603:10b6:610:100::20)
MIME-Version: 1.0
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR02CA0212.apcprd02.prod.outlook.com (2603:1096:201:20::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 10:13:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a574387-6b25-4d35-fd37-08d99d2044ef
X-MS-TrafficTypeDiagnostic: CH2PR11MB4342:
X-Microsoft-Antispam-PRVS: 
	<CH2PR11MB434249F23F3AA4707D46D1EDE48A9@CH2PR11MB4342.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9EuRaxSPAjHQgVfEArNhz+onOQU4aZaOohCnev0VHD2uHn7Pr6Ps4O/Np5deygoE9sG1ikuRMf4M54I8J7jWzB8+DG9bOiCxlo4UWf6w2eLa27pKMVTgLbkkl2t8kcZj4w/mcGLh2pZYIFyak69OVsaI4VIIkympU2Xz1LDqsMPwBmUM3xYJ+w87YTMqNPau8h6w9B1gMo1AAm8Blq9DTWTpUCxgG1qJ81FXD7xaIIDRvYQ9QUWdPTVe9mlFy34NnOARaot5x7YkCqCWoQWQkhfKGom4QgAW4tzMx19XFTjo+BSDeTi/m6Sud6LuP4CBg8/dViNY4G8RVIlDLHYaVRspB7NXr7/i//OwsZfzZHq+OrkZ2+c8uiQmRDbaU3IxWK6lokDoNFuwFGwhF3X2iI75BPoLAobV4TonLORnxIkscZQgcLYLg2TVPN0Y8ZKe0a1KoHEIXRnM5id63ZfWaFfaVXlyE1f5hV2CKVPT6jN9G6m0nlO7+mOv0nA3dfM+yOMpWgAuJrs56h7quWy0vB0uHFCoyjemv81TygqM2DdyBZXDiSMGQbkwgZNRD8aQk4kojdHzfXfX6/RVAcxRQzunfXUZijpV3pbCEsTheamY7QTpyf/SDs/9pvRGabQAW/lqSKbVzwKEGfujs8RckQNaNBHxZO+bw+r4XLuE4SYfhLQlg3Wbt4rxjCgt9Q4WCZm8zBJdGpHBR7h4sYa9PmdZFaU70OkUOkBXHktl02ptf5bJJf8o0sGqdKyIwI6ycwHMOXZwmoetKJhV7wfw3uDl6fAvEgQtIHgqdsy4uinnen0yCH2hXeinE+SdJvDZbTU7amXahTEeYt89vfiqyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(316002)(2906002)(86362001)(5660300002)(38100700002)(38350700002)(52116002)(508600001)(6506007)(53546011)(44832011)(8676002)(83380400001)(66556008)(6666004)(8936002)(956004)(2616005)(6512007)(66946007)(30864003)(66476007)(6916009)(6486002)(36756003)(15650500001)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WrIBxmx4WtJVsJC50GVjy4TrzuVX9IKzoMAa8z1Bn4A6GmmBBmtEGbeBt3ub?=
 =?us-ascii?Q?sBxIVbFICU+jr35W5eIHDkEY02z8CdLtotwqAohOieBeNkP3qlNgCWyoarJt?=
 =?us-ascii?Q?BfDGJ6juc0ElxM11+UqkQUuIkxS9Klzvvfzh2MqGVsAa0RKXa5whrlGyntC/?=
 =?us-ascii?Q?NHX5k9hnme+zCS1wJXtmmRc7W8fK7SlPt+9lMbNeILo7aPGkD+7/djZokHu0?=
 =?us-ascii?Q?Ky0Lrewch9zDkPJXKaLLLPt1wBnyCDKjNr6xdcy30xhrHRLALvJGjUN8TsdR?=
 =?us-ascii?Q?6kzeT3OlA3rriBGcA4i9KsESk/nUOFcZIZUhQCU66PU1YdgJc4EZKPs8pIvL?=
 =?us-ascii?Q?99NSenPJIaNOCXfe5S5ipFKRI2WMyud8p64HzWjZTUX+fDN+hxCpLWZcaNPB?=
 =?us-ascii?Q?kqUCEIS8o+lbuTefX5qIAsV52wxMZil2u1x0DDRXDd+bAf0su1XBjfFYTlAF?=
 =?us-ascii?Q?nb3j+wK8s+8ze1Iew+j1dMnUIbZ0p0uyia1bhi/4jWe68NKUSHuuyV5Gqfzg?=
 =?us-ascii?Q?IGrleiaZM7k00DTqrVfyx+19bpdtZ2RSXeyRAybYcmWES86k+S5zpBA+7PVQ?=
 =?us-ascii?Q?0ki7Tdl+ljFNiDestJ2goi1os8U7qzy10jA/zRlOY26SOpJj0qweIV+qimS1?=
 =?us-ascii?Q?PynfT4S3giW6kx07qi4mGEmeZwiFU0i94ZiEOH8qK4+TMPAb4aWgyk53/hH4?=
 =?us-ascii?Q?tcorlP6xPXIBD7ANp3HwnbZDOYSHcvyFfcPovavf1zmqgEkIx4sXXqmzZMKO?=
 =?us-ascii?Q?SXb0tbfTwB4+cdcoKsiDLLlhCLCIV5Jo5/V4dyc85dN4xnChgi8hJORMPaUe?=
 =?us-ascii?Q?TcRE37bx1jOLJc+ncdmGjUHoRlICmugG1SiX0eK/7DhNxx5BtkBsSUVbuN3w?=
 =?us-ascii?Q?Ia70i6vKxxv6OFE8sWiP4obNbAm0MCrBvE6NIJiTsT8zOS/2QnBA4WIS0ty/?=
 =?us-ascii?Q?/CCugBi9Xb7jlFy+EuTGFc5F2RIeBmDURett9U9hEGUM456m06ngQse77WD3?=
 =?us-ascii?Q?uhb78pyiryIxzXlp2D5AznywgfgN3jzBYlv7tXm1TtwRWQDQKlPxG4bo8oMk?=
 =?us-ascii?Q?Ou4Y4L4h5jyP0GmFNekvb/4UaKuEezdxVjRFNODeckEZyFGawR3Tu7SSg6J0?=
 =?us-ascii?Q?G3YDu2rGsyNoKV/5vWPlTVdljdisfCVE0XsCvwvWeCY1kH2xZ9i8O3yqy/2x?=
 =?us-ascii?Q?1IxrzRl/N3iR3EDzQ/6sz7zZOU8K0GKDz7kTsdRcg4KQzg92Wso7AJJBHcN1?=
 =?us-ascii?Q?C+aUbZYqR8W0L9Z8/YmKb1IFBrsLwmCw5tIOHoWMNuzJMNBzX3IL0D/7btlz?=
 =?us-ascii?Q?iJ3ExapOLAhJT7FZTImIa4/RKEL0dxMhQuaUoKvc2fTFS/NFNQS3dRiFhEZt?=
 =?us-ascii?Q?2DKMXC84S2XrZbWH4tHTztgZ2nXnizlFk3eom0DI83LmjD8CHljdktwOFKaK?=
 =?us-ascii?Q?tantkXfcTa4iFZ9QyRISp1ch3B0tGjSL09XKkofU3bVE3xxHKy/CQMI/GtfM?=
 =?us-ascii?Q?k5Ur31l0ZsejHn2ynREa9Rz1kO0kacxqZi9WXLq+voIN9PdBlMW0HcxlrDbF?=
 =?us-ascii?Q?XiQFaPyTompxhMgAtlP+TyXfGXilOICXf5Sfkn/fmMrpN3VjE7zbc7ON/AC/?=
 =?us-ascii?Q?Z4fmIDwjgDBrbQ1KXu6CGbA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a574387-6b25-4d35-fd37-08d99d2044ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 10:13:37.4840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llnlxZ5sjzRO0FTO2V60DYy1hxU+OJvkVebxHIGdH4suDcqufoSyMQs4ftvADaJkN5SWnIMkn5Agyxs5p4vIVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4342
X-Proofpoint-GUID: dHQheSi6Rvrf8BF3yhcasq17w1tnST1v
X-Proofpoint-ORIG-GUID: dHQheSi6Rvrf8BF3yhcasq17w1tnST1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_04,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111010059
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

update to 4.0.11

1.drop two patches that have been integrated to upstream repo.
2.drop tests-add-no-validate-when-using-download-template.patch
  because it is no longer appropriate as the "download" has been
  replaced with "busybox"
3.fix the apply failure of templates-use-curl-instead-of-wget.patch
4.update lxc from 4.0.10 to 4.0.11

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...omp_profile_when_compiled_libseccomp.patch | 46 ----------
 .../lxc/files/fix_c_command.patch             | 36 --------
 .../templates-use-curl-instead-of-wget.patch  | 23 ++---
 ...alidate-when-using-download-template.patch | 85 -------------------
 recipes-containers/lxc/lxc_git.bb             |  7 +-
 5 files changed, 15 insertions(+), 182 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
 delete mode 100644 recipes-containers/lxc/files/fix_c_command.patch
 delete mode 100644 recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch

diff --git a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
deleted file mode 100644
index f0a58139..00000000
--- a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001
-From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
-Date: Mon, 23 Aug 2021 22:04:40 +0200
-Subject: [PATCH] config: enable seccomp profile only when compiled with
- libseccomp
-
-Make lxc fail if seccomp.profile is specified but lxc is compiled
-without seccomp support. Currently, seccomp.profile is silently ignored
-if is specified in such a scenario. This could lead to the false
-impression that the seccomp filter is applied while it actually isn't.
-
-Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
----
- src/lxc/confile.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e]
-
-diff --git a/src/lxc/confile.c b/src/lxc/confile.c
-index d8b96c6921..1cc8da15f1 100644
---- a/src/lxc/confile.c
-+++ b/src/lxc/confile.c
-@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const char *key, const char *value,
- static int set_config_seccomp_profile(const char *key, const char *value,
- 				      struct lxc_conf *lxc_conf, void *data)
- {
-+#ifdef HAVE_SECCOMP
- 	return set_config_path_item(&lxc_conf->seccomp.seccomp, value);
-+#else
-+	return ret_set_errno(-1, ENOSYS);
-+#endif
- }
- 
- static int set_config_execute_cmd(const char *key, const char *value,
-@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const char *key, char *retv, int inle
- static int get_config_seccomp_profile(const char *key, char *retv, int inlen,
- 				      struct lxc_conf *c, void *data)
- {
-+#ifdef HAVE_SECCOMP
- 	return lxc_get_conf_str(retv, inlen, c->seccomp.seccomp);
-+#else
-+	return ret_errno(ENOSYS);
-+#endif
- }
- 
- static int get_config_autodev(const char *key, char *retv, int inlen,
diff --git a/recipes-containers/lxc/files/fix_c_command.patch b/recipes-containers/lxc/files/fix_c_command.patch
deleted file mode 100644
index 1ed8dafd..00000000
--- a/recipes-containers/lxc/files/fix_c_command.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
-From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
-Date: Mon, 23 Aug 2021 15:39:28 +0200
-Subject: [PATCH] attach: Fix -c command
-
-Currently, the -c command (to set the selinux context) seems to be
-broken because the passed context is ignored and always overwritten by
-the context specified in the config file. The intention behind the -c
-imho was to be able to manually overwrite this behavior. This patch
-ensures that the selinux context will be set if passed via the command
-line.
-
-Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
----
- src/lxc/tools/lxc_attach.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-Upstream-Status: Backport [https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch]
-Comment: No change in any hunk
-
-diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
-index 0374d980b4..e6b388b20c 100644
---- a/src/lxc/tools/lxc_attach.c
-+++ b/src/lxc/tools/lxc_attach.c
-@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
- 		attach_options.gid = my_args.gid;
- 
- 	// selinux_context will be NULL if not set
--	attach_options.lsm_label = selinux_context;
-+	if (selinux_context) {
-+		attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
-+		attach_options.lsm_label = selinux_context;
-+	}
- 
- 	if (command.program) {
- 		ret = c->attach_run_wait(c, &attach_options, command.program,
diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index 156df82f..4556293a 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -1,4 +1,4 @@
-From 07890dd8ffdcd08b7be1ddbd9f56ac55482c76bb Mon Sep 17 00:00:00 2001
+From 1db2db7783bd7ec2aa1da86e640019891634c659 Mon Sep 17 00:00:00 2001
 From: Joakim Roubert <joakimr@axis.com>
 Date: Fri, 16 Aug 2019 07:52:48 +0200
 Subject: [PATCH] Use curl instead of wget
@@ -7,16 +7,16 @@ When curl's MIT license is preferable to wget's GPLv3.
 
 Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8
 Signed-off-by: Joakim Roubert <joakimr@axis.com>
-
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
 ---
  templates/lxc-download.in | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/templates/lxc-download.in b/templates/lxc-download.in
-index d7e6128..8a4b567 100644
+index e8570692a..f7291b0cc 100755
 --- a/templates/lxc-download.in
 +++ b/templates/lxc-download.in
-@@ -74,9 +74,9 @@ cleanup() {
+@@ -75,9 +75,9 @@ cleanup() {
    fi
  }
  
@@ -28,18 +28,18 @@ index d7e6128..8a4b567 100644
        return 0
      fi
    done
-@@ -85,8 +85,8 @@ wget_wrapper() {
+@@ -86,8 +86,8 @@ wget_wrapper() {
  }
  
  download_file() {
--  if ! wget_wrapper -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
--    if ! wget_wrapper -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
-+  if ! curl_wrapper -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
-+    if ! curl_wrapper -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
+-  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
+-    if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
++  if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
++    if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
        if [ "$3" = "noexit" ]; then
          return 1
        else
-@@ -271,7 +271,7 @@ while :; do
+@@ -277,7 +277,7 @@ while :; do
  done
  
  # Check for required binaries
@@ -48,3 +48,6 @@ index d7e6128..8a4b567 100644
    if ! command -V "${bin}" >/dev/null 2>&1; then
      echo "ERROR: Missing required tool: ${bin}" 1>&2
      exit 1
+-- 
+2.27.0
+
diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
deleted file mode 100644
index f335e796..00000000
--- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 1c2506434e744d8c6a86e42c9d8bae4cde7553f6 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 31 May 2018 15:14:26 -0400
-Subject: [PATCH] tests: add '--no-validate' when using download template
-
-We are usually running the ptests with core-image-minimal which has no
-mechanism to validate the downloads. Validation isn't really of
-interest to this test at any rate so simply add '--no-validate' to
-avoid failing due to no GPG validation.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
----
- src/tests/lxc-test-apparmor-mount | 2 +-
- src/tests/lxc-test-autostart      | 2 +-
- src/tests/lxc-test-no-new-privs   | 2 +-
- src/tests/lxc-test-unpriv         | 2 +-
- src/tests/lxc-test-usernic.in     | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount
-+++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount
-@@ -170,7 +170,7 @@
-     done
- fi
- 
--run_cmd lxc-create -t download -n $cname -- -d ubuntu -r $release -a $ARCH
-+run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu -r $release -a $ARCH
- 
- echo "test default confined container"
- run_cmd lxc-start -n $cname -d -lDEBUG -o "$logfile"
-Index: lxc-4.0.9/src/tests/lxc-test-autostart
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-autostart
-+++ lxc-4.0.9/src/tests/lxc-test-autostart
-@@ -55,7 +55,7 @@
-     done
- fi
- 
--lxc-create -t download -n $CONTAINER_NAME -B dir -- -d ubuntu -r $release -a $ARCH
-+lxc-create -t download -n $CONTAINER_NAME -B dir -- --no-validate -d ubuntu -r $release -a $ARCH
- CONTAINER_PATH=$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs.path -H) | sed -e 's/dir://')
- cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak
- 
-Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs
-+++ lxc-4.0.9/src/tests/lxc-test-no-new-privs
-@@ -49,7 +49,7 @@
- 	ARCH=$(dpkg --print-architecture)
- fi
- 
--lxc-create -t download -n c1 -- -d ubuntu -r xenial -a $ARCH
-+lxc-create -t download -n c1 -- --no-validate -d ubuntu -r xenial -a $ARCH
- echo "lxc.no_new_privs = 1" >> /var/lib/lxc/c1/config
- 
- lxc-start -n c1
-Index: lxc-4.0.9/src/tests/lxc-test-unpriv
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-unpriv
-+++ lxc-4.0.9/src/tests/lxc-test-unpriv
-@@ -178,7 +178,7 @@
-     cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
-     chown -R $TUSER: $HDIR/.cache/lxc
- 
--run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- -d ubuntu -r $release -a $ARCH
-+run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- --no-validate -d ubuntu -r $release -a $ARCH
- 
- # Make sure we can start it - twice
- 
-Index: lxc-4.0.9/src/tests/lxc-test-usernic.in
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-usernic.in
-+++ lxc-4.0.9/src/tests/lxc-test-usernic.in
-@@ -147,7 +147,7 @@
- fi
- 
- # Create three containers
--run_cmd "lxc-create -t download -n b1 -- -d ubuntu -r $release -a $ARCH"
-+run_cmd "lxc-create -t download -n b1 -- --no-validate -d ubuntu -r $release -a $ARCH"
- run_cmd "lxc-start -n b1 -d"
- p1=$(run_cmd "lxc-info -n b1 -p -H")
- 
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index f5b5128b..ba1cef5a 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -46,15 +46,12 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0 \
 	file://template-make-busybox-template-compatible-with-core-.patch \
 	file://templates-use-curl-instead-of-wget.patch \
 	file://tests-our-init-is-not-busybox.patch \
-	file://tests-add-no-validate-when-using-download-template.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
-        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
-        file://fix_c_command.patch \
 	"
 
-SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
-PV = "4.0.10+git${SRCPV}"
+SRCREV = "48e079bf318982ae7d5684feeb7358870fa71c10"
+PV = "4.0.11+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0

