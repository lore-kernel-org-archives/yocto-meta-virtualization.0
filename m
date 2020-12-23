Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.68])
 by mx.groups.io with SMTP id smtpd.web10.1572.1608755980428762507
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 12:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qDhBQRUF;
 spf=pass (domain: windriver.com, ip: 40.107.243.68, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmwIunXO0LuwimIxTPSvVipBHZvvhzvG6Qa5HX0VG5ZrQpCWb3uIbhRHC5jP3094joNVxzh+WeRBo+trkTtgXxdLveBHm1JNq+YeWx1ryRrybRFKrYZYb2/zyV3s+eP17h/x8mZk2gXp0fatMuewnTy9w58MpLZ6tnZFTFDd4JnBdPZOl2+dDoNoJVLBapXwnHeGCd4f0k8vSooVkKEI4xBJEh4RQPojdoCMTXB1/P7F557+xKkgKHbSUIt3Ljw+y/FxAmyFRk1z2OeiavDHXNKeIFBRxu+J28rEN7zXGxjdlr6eUIfSIrL9HPnyrLHk7bU4adKk6hrgM229cisizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vbqmRhjPLDosPAhkr2rHKgz+TMJQ1/v1stkRx5jDl8=;
 b=YmfimQ41RG1pH9iGz5v7KGprpE8rIzvKE2/l4HlrZ04aOveSnQCp0kysfWS2MBHy2yaJJaeLQAc2IXEJQDHYViCnlQuW76OnAFf1Ob01ZL7e74jntpsmRmlXOzvNmZS7VH4+hNLIquA3LoexvfAth0ziiGeWdbnA900wkHqBqwWPmrbhu9foEzdDgTtBvL0L3fbW1a0OBvU65Ut9PTOAEOyX2qBKn+3OyVGZJphN8ojCOO50FXPyWILSBiXe3Xa39vF0kgwghRu6kLHXqp+l+I88Z+5qk7ePTAZe3hdkYu5yebAm9Na72TOJlFZ1m4RmPqK9GAEL8FqIBzXlyDiL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vbqmRhjPLDosPAhkr2rHKgz+TMJQ1/v1stkRx5jDl8=;
 b=qDhBQRUF/WGJgXdNwjC8EJ35Rjf4/e3tl2Jzv1whM60aaTa9LASds6p4vDL5a9sQJOuubq+YqjIZJpJKcw3ZpPIKXjRCUC/y3I+Qt5Xf6w+vAJrp/zr5LNWSXmOye5zG32woAYvvXfs2vgZuBAUPQHCV13TaJ4LRBmfXC/r69nI=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3708.namprd11.prod.outlook.com (2603:10b6:5:146::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27; Wed, 23 Dec 2020 20:39:38 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::40c9:fbb0:ba76:356b]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::40c9:fbb0:ba76:356b%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 20:39:38 +0000
From: sakib.sajal@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ceph: uprev v15.2.0 -> v15.2.8
Date: Wed, 23 Dec 2020 15:39:16 -0500
Message-ID: <20201223203916.21407-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 20:39:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae34739-88e6-47b7-4ee8-08d8a782de19
X-MS-TrafficTypeDiagnostic: DM6PR11MB3708:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB37086B0E9C2FB6AEAD5D221CF2DE0@DM6PR11MB3708.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UTmJiemzQ1+9/2q2+197t3wJ5wSdGr8ymj8UKIWt0EUVLRSQTYKntYfjz999DNpLQseoko0thuEWrI2SNJaxcLKbw385HnIQ6PtuPYiafhGiT6Egg0vGbZWt8pnRWOHm+c8BUI6w0ymslLqP7atktB81vZGY9M+dgJTxSmuAtOIdZLOxoSASedaPNhhWTgP0uSYGqrcP5BRhNweLfmI7wlI8T1K9b+vbbYPznI1u4UkZAw5ZGo5cjImNuSUu2M9mRcyobdn5qFDL1oGx44t0XKZmdxpqOJh/EMJK9Ti+iNJmX4x+RtHv3foUTqU3WvsxQz0Z5LsDb6z77ptKkDR5u7SmCReApfeXbM5DigeMuJnaUdHwmgxz0yHKI3aJrlLWRozzZoOLQ4ep7/rqt2DJ231xAHbJrYExYfZmj0P/NnqkgZkh+Jz2Hx4OOdMC4Hs2B8XrfYXhU1OJ3tftyIT98cDF9DP289+XMktYu7+whfwwi54DL2iJE8MoKNKGun7oinmDJ3ZL0LgiGeNRqqiQLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(396003)(376002)(136003)(6666004)(6506007)(83380400001)(16526019)(186003)(1076003)(966005)(956004)(66476007)(5660300002)(44832011)(30864003)(8676002)(86362001)(316002)(6916009)(478600001)(8936002)(2616005)(66946007)(2906002)(66556008)(6486002)(36756003)(26005)(52116002)(6512007)(19627235002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?R3ls0fWUY20Kc+Q0TGhBfmzfxZL9xYikJ4yNeXQmZQhr7OJmiGNKqQfJJ54l?=
 =?us-ascii?Q?JWLmTkO4GYTqCInqOuk50BlNLhI9hfsjOdP3qay/LuSBxMv9ksYrwTKIBX3s?=
 =?us-ascii?Q?EoutFK69EDowIJLCDrGgnAdZj1ie2F+yxIc4WKudKIHd+ci6ozdJUX98teIl?=
 =?us-ascii?Q?9P0/1UYpDq2Nv3vlaVdIYLe8Qsgy6i9h2chbeP+yGj9UQxPUYPJeRH4/4N+y?=
 =?us-ascii?Q?zp89PR0fondegP8i0qVUu8GMsUwqT+HoGe10afsi1b8ZIhsROHumnxugg+A5?=
 =?us-ascii?Q?DCruYLp4mBGPEs730Ep78I4Snyl6JxgbMNyWz/Bk9K9Xxp8bwDGXKC9epRQJ?=
 =?us-ascii?Q?VJAZ2njLBxzhEcDLE31RsD+EUrEwkh6TO2SuFL6xVFbvQTYGeXgkBG7A6Of6?=
 =?us-ascii?Q?KqcHX229Fef14Le2NOfL+XlU5XUS3ho1BllPh1IQmzoBjp2J59zBvDCve1LC?=
 =?us-ascii?Q?7uD8isJhTKnMtCx3qUvZF1GNE1xxSso2Sr6aUQkFj1rKchxHDyEBWnHR6zxL?=
 =?us-ascii?Q?5xaGhuUitxd8VUJQTJXH7m8JWA0zliHqB+veN5o3tFVtKkYm3qX0W9ZpJQ8+?=
 =?us-ascii?Q?RyOwExaVMDaEBwMscz5gN56Uf4+Z6AWFsBzJlwFkX+2wdNdd2cZaaCvHeDHK?=
 =?us-ascii?Q?6PDPzksFyOKuYgQil8BnJjIrvaxClwNmmrYVOzYrMuOWLYmfJVpygEp+Pd2F?=
 =?us-ascii?Q?yzLkYQpupPCFXwqikJya8ePGGOrcFP+d3RY0iPXlcV5WUzCPtfdkeHJPCEvv?=
 =?us-ascii?Q?6GvCe8MyY5XejnPZ58we0K4y5Nc9kmS0MFtSTyyeWcCVcsEzlR/1qINN8WGt?=
 =?us-ascii?Q?2oos6eLNYXhU55ErkNYtTZvnyRodFNZM+AO85b3VhHADv56BtWIDOkDaIPou?=
 =?us-ascii?Q?toKoNxJzuNM1Z3G+4EO3E52A+9vBR0c8jlP0QSokiX7ZYljO9XpUZrAulNB3?=
 =?us-ascii?Q?a6liz5+M+Bg8c95CGsyUK8b1b9/FOZcxIAAdanYVY7g378REzLr+J9SfMh9J?=
 =?us-ascii?Q?uAbI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 20:39:38.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: dae34739-88e6-47b7-4ee8-08d8a782de19
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2pgR6PaOz0cXq19vlfn8Gd6GyOJlC4iCKQ7kcvN9Rk8HUxyQ/zwZzKvQXPgimHeqkjmxenCMgdbDrwNdPT9TpfO5OZJgxTxla77PTA3tgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3708
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Removed patches that are contained in newer version.
Contains fixes to CVES:
CVE-2020-27781
CVE 2020-25660
CVE-2020-10753
CVE-2020-10736
CVE-2020-1759
CVE-2020-1760

Built and run tested.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...l-caps-for-pre-octopus-tell-commands.patch | 100 -------
 ...olV2-avoid-AES-GCM-nonce-reuse-vulne.patch | 256 ------------------
 ...pto_onwire-fix-endianness-of-nonce_t.patch |  61 -----
 ...001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch |  33 ---
 ...ol-characters-in-response-header-act.patch |  64 -----
 ...uthenticated-response-header-actions.patch |  36 ---
 ...-for-pre-octopus-client-tell-command.patch |  95 -------
 ...ReleaseNotes-note-about-security-fix.patch |  31 ---
 .../ceph/{ceph_15.2.0.bb =3D> ceph_15.2.8.bb}   |  18 +-
 9 files changed, 5 insertions(+), 689 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-mgr-require-all-caps-fo=
r-pre-octopus-tell-commands.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-av=
oid-AES-GCM-nonce-reuse-vulne.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire=
-fix-endianness-of-nonce_t.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALI=
D_REQUEST.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-reject-control-char=
acters-in-response-header-act.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-rgw-reject-unauthentica=
ted-response-header-actions.patch
 delete mode 100644 recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pr=
e-octopus-client-tell-command.patch
 delete mode 100644 recipes-extended/ceph/ceph/0003-PendingReleaseNotes-not=
e-about-security-fix.patch
 rename recipes-extended/ceph/{ceph_15.2.0.bb =3D> ceph_15.2.8.bb} (81%)

diff --git a/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-o=
ctopus-tell-commands.patch b/recipes-extended/ceph/ceph/0001-mgr-require-al=
l-caps-for-pre-octopus-tell-commands.patch
deleted file mode 100644
index de191bf8..00000000
--- a/recipes-extended/ceph/ceph/0001-mgr-require-all-caps-for-pre-octopus-=
tell-commands.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From de67c1dab5597c91538970421b25f6ec667af492 Mon Sep 17 00:00:00 2001
-From: Josh Durgin <jdurgin@redhat.com>
-Date: Mon, 4 May 2020 17:03:35 -0400
-Subject: [PATCH 1/3] mgr: require all caps for pre-octopus tell commands
-
-This matches the requirements for admin socket commands
-sent via tell elsewhere.
-
-Signed-off-by: Josh Durgin <jdurgin@redhat.com>
-
-Upstream-status: Backport
-[https://github.com/ceph/ceph/commit/347003e13167c428187a5450517850f4d85e0=
9ad]
-
-Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
----
- src/mgr/DaemonServer.cc | 37 ++++++++++++++++++++++---------------
- 1 file changed, 22 insertions(+), 15 deletions(-)
-
-diff --git a/src/mgr/DaemonServer.cc b/src/mgr/DaemonServer.cc
-index becd428a..527326e3 100644
---- a/src/mgr/DaemonServer.cc
-+++ b/src/mgr/DaemonServer.cc
-@@ -808,20 +808,12 @@ public:
- bool DaemonServer::handle_command(const ref_t<MCommand>& m)
- {
-   std::lock_guard l(lock);
--  // a blank fsid in MCommand signals a legacy client sending a "mon-mgr"=
 CLI
--  // command.
--  if (m->fsid !=3D uuid_d()) {
--    cct->get_admin_socket()->queue_tell_command(m);
-+  auto cmdctx =3D std::make_shared<CommandContext>(m);
-+  try {
-+    return _handle_command(cmdctx);
-+  } catch (const bad_cmd_get& e) {
-+    cmdctx->reply(-EINVAL, e.what());
-     return true;
--  } else {
--    // legacy client; send to CLI processing
--    auto cmdctx =3D std::make_shared<CommandContext>(m);
--    try {
--      return _handle_command(cmdctx);
--    } catch (const bad_cmd_get& e) {
--      cmdctx->reply(-EINVAL, e.what());
--      return true;
--    }
-   }
- }
-=20
-@@ -853,8 +845,12 @@ bool DaemonServer::_handle_command(
-   std::shared_ptr<CommandContext>& cmdctx)
- {
-   MessageRef m;
-+  bool admin_socket_cmd =3D false;
-   if (cmdctx->m_tell) {
-     m =3D cmdctx->m_tell;
-+    // a blank fsid in MCommand signals a legacy client sending a "mon-mg=
r" CLI
-+    // command.
-+    admin_socket_cmd =3D (cmdctx->m_tell->fsid !=3D uuid_d());
-   } else {
-     m =3D cmdctx->m_mgr;
-   }
-@@ -888,7 +884,10 @@ bool DaemonServer::_handle_command(
-=20
-   dout(10) << "decoded-size=3D" << cmdctx->cmdmap.size() << " prefix=3D" =
<< prefix  << dendl;
-=20
--  if (prefix =3D=3D "get_command_descriptions") {
-+  // this is just for mgr commands - admin socket commands will fall
-+  // through and use the admin socket version of
-+  // get_command_descriptions
-+  if (prefix =3D=3D "get_command_descriptions" && !admin_socket_cmd) {
-     dout(10) << "reading commands from python modules" << dendl;
-     const auto py_commands =3D py_modules.get_commands();
-=20
-@@ -925,7 +924,10 @@ bool DaemonServer::_handle_command(
-=20
-   bool is_allowed =3D false;
-   ModuleCommand py_command;
--  if (!mgr_cmd) {
-+  if (admin_socket_cmd) {
-+    // admin socket commands require all capabilities
-+    is_allowed =3D session->caps.is_allow_all();
-+  } else if (!mgr_cmd) {
-     // Resolve the command to the name of the module that will
-     // handle it (if the command exists)
-     auto py_commands =3D py_modules.get_py_commands();
-@@ -958,6 +960,11 @@ bool DaemonServer::_handle_command(
-     << "entity=3D'" << session->entity_name << "' "
-     << "cmd=3D" << cmdctx->cmd << ": dispatch";
-=20
-+  if (admin_socket_cmd) {
-+    cct->get_admin_socket()->queue_tell_command(cmdctx->m_tell);
-+    return true;
-+  }
-+
-   // ----------------
-   // service map commands
-   if (prefix =3D=3D "service dump") {
---=20
-2.25.1
-
diff --git a/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES=
-GCM-nonce-reuse-vulne.patch b/recipes-extended/ceph/ceph/0001-msg-async-Pr=
otocolV2-avoid-AES-GCM-nonce-reuse-vulne.patch
deleted file mode 100644
index 54156698..00000000
--- a/recipes-extended/ceph/ceph/0001-msg-async-ProtocolV2-avoid-AES-GCM-no=
nce-reuse-vulne.patch
+++ /dev/null
@@ -1,256 +0,0 @@
-From 20b7bb685c5ea74c651ca1ea547ac66b0fee7035 Mon Sep 17 00:00:00 2001
-From: Ilya Dryomov <idryomov@gmail.com>
-Date: Fri, 6 Mar 2020 20:16:45 +0100
-Subject: [PATCH] msg/async/ProtocolV2: avoid AES-GCM nonce reuse
- vulnerabilities
-
-The secure mode uses AES-128-GCM with 96-bit nonces consisting of a
-32-bit counter followed by a 64-bit salt.  The counter is incremented
-after processing each frame, the salt is fixed for the duration of
-the session.  Both are initialized from the session key generated
-during session negotiation, so the counter starts with essentially
-a random value.  It is allowed to wrap, and, after 2**32 frames, it
-repeats, resulting in nonce reuse (the actual sequence numbers that
-the messenger works with are 64-bit, so the session continues on).
-
-Because of how GCM works, this completely breaks both confidentiality
-and integrity aspects of the secure mode.  A single nonce reuse reveals
-the XOR of two plaintexts and almost completely reveals the subkey
-used for producing authentication tags.  After a few nonces get used
-twice, all confidentiality and integrity goes out the window and the
-attacker can potentially encrypt-authenticate plaintext of their
-choice.
-
-We can't easily change the nonce format to extend the counter to
-64 bits (and possibly XOR it with a longer salt).  Instead, just
-remember the initial nonce and cut the session before it repeats,
-forcing renegotiation.
-
-Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
-Reviewed-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
-Reviewed-by: Sage Weil <sage@redhat.com>
-
-Conflicts:
-	src/msg/async/ProtocolV2.h [ context: commit ed3ec4c01d17
-	  ("msg: Build target 'common' without using namespace in
-	  headers") not in octopus ]
-
-CVE: CVE-2020-1759
-Upstream Status: Backport [20b7bb685c5ea74c651ca1ea547ac66b0fee7035]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/msg/async/ProtocolV2.cc    | 62 ++++++++++++++++++++++++----------
- src/msg/async/ProtocolV2.h     |  5 +--
- src/msg/async/crypto_onwire.cc | 17 ++++++++--
- src/msg/async/crypto_onwire.h  |  5 +++
- 4 files changed, 67 insertions(+), 22 deletions(-)
-
-diff --git a/src/msg/async/ProtocolV2.cc b/src/msg/async/ProtocolV2.cc
-index 8fc02db6e5..c69f2ccf79 100644
---- a/src/msg/async/ProtocolV2.cc
-+++ b/src/msg/async/ProtocolV2.cc
-@@ -533,7 +533,10 @@ ssize_t ProtocolV2::write_message(Message *m, bool mo=
re) {
- 			     m->get_payload(),
- 			     m->get_middle(),
- 			     m->get_data());
--  connection->outgoing_bl.append(message.get_buffer(session_stream_handle=
rs));
-+  if (!append_frame(message)) {
-+    m->put();
-+    return -EILSEQ;
-+  }
-=20
-   ldout(cct, 5) << __func__ << " sending message m=3D" << m
-                 << " seq=3D" << m->get_seq() << " " << *m << dendl;
-@@ -566,15 +569,17 @@ ssize_t ProtocolV2::write_message(Message *m, bool m=
ore) {
-   return rc;
- }
-=20
--void ProtocolV2::append_keepalive() {
--  ldout(cct, 10) << __func__ << dendl;
--  auto keepalive_frame =3D KeepAliveFrame::Encode();
--  connection->outgoing_bl.append(keepalive_frame.get_buffer(session_strea=
m_handlers));
--}
--
--void ProtocolV2::append_keepalive_ack(utime_t &timestamp) {
--  auto keepalive_ack_frame =3D KeepAliveFrameAck::Encode(timestamp);
--  connection->outgoing_bl.append(keepalive_ack_frame.get_buffer(session_s=
tream_handlers));
-+template <class F>
-+bool ProtocolV2::append_frame(F& frame) {
-+  ceph::bufferlist bl;
-+  try {
-+    bl =3D frame.get_buffer(session_stream_handlers);
-+  } catch (ceph::crypto::onwire::TxHandlerError &e) {
-+    ldout(cct, 1) << __func__ << " " << e.what() << dendl;
-+    return false;
-+  }
-+  connection->outgoing_bl.append(bl);
-+  return true;
- }
-=20
- void ProtocolV2::handle_message_ack(uint64_t seq) {
-@@ -612,7 +617,15 @@ void ProtocolV2::write_event() {
-   connection->write_lock.lock();
-   if (can_write) {
-     if (keepalive) {
--      append_keepalive();
-+      ldout(cct, 10) << __func__ << " appending keepalive" << dendl;
-+      auto keepalive_frame =3D KeepAliveFrame::Encode();
-+      if (!append_frame(keepalive_frame)) {
-+        connection->write_lock.unlock();
-+        connection->lock.lock();
-+        fault();
-+        connection->lock.unlock();
-+        return;
-+      }
-       keepalive =3D false;
-     }
-=20
-@@ -663,13 +676,16 @@ void ProtocolV2::write_event() {
-     if (r =3D=3D 0) {
-       uint64_t left =3D ack_left;
-       if (left) {
--        auto ack =3D AckFrame::Encode(in_seq);
--        connection->outgoing_bl.append(ack.get_buffer(session_stream_hand=
lers));
-         ldout(cct, 10) << __func__ << " try send msg ack, acked " << left
-                        << " messages" << dendl;
--        ack_left -=3D left;
--        left =3D ack_left;
--        r =3D connection->_try_send(left);
-+        auto ack_frame =3D AckFrame::Encode(in_seq);
-+        if (append_frame(ack_frame)) {
-+          ack_left -=3D left;
-+          left =3D ack_left;
-+          r =3D connection->_try_send(left);
-+        } else {
-+          r =3D -EILSEQ;
-+        }
-       } else if (is_queued()) {
-         r =3D connection->_try_send();
-       }
-@@ -769,7 +785,13 @@ template <class F>
- CtPtr ProtocolV2::write(const std::string &desc,
-                         CONTINUATION_TYPE<ProtocolV2> &next,
-                         F &frame) {
--  ceph::bufferlist bl =3D frame.get_buffer(session_stream_handlers);
-+  ceph::bufferlist bl;
-+  try {
-+    bl =3D frame.get_buffer(session_stream_handlers);
-+  } catch (ceph::crypto::onwire::TxHandlerError &e) {
-+    ldout(cct, 1) << __func__ << " " << e.what() << dendl;
-+    return _fault();
-+  }
-   return write(desc, next, bl);
- }
-=20
-@@ -1672,7 +1694,11 @@ CtPtr ProtocolV2::handle_keepalive2(ceph::bufferlis=
t &payload)
-   ldout(cct, 30) << __func__ << " got KEEPALIVE2 tag ..." << dendl;
-=20
-   connection->write_lock.lock();
--  append_keepalive_ack(keepalive_frame.timestamp());
-+  auto keepalive_ack_frame =3D KeepAliveFrameAck::Encode(keepalive_frame.=
timestamp());
-+  if (!append_frame(keepalive_ack_frame)) {
-+    connection->write_lock.unlock();
-+    return _fault();
-+  }
-   connection->write_lock.unlock();
-=20
-   ldout(cct, 20) << __func__ << " got KEEPALIVE2 "
-diff --git a/src/msg/async/ProtocolV2.h b/src/msg/async/ProtocolV2.h
-index 2dbe647ae5..9897d18cf2 100644
---- a/src/msg/async/ProtocolV2.h
-+++ b/src/msg/async/ProtocolV2.h
-@@ -129,6 +129,9 @@ private:
-                         CONTINUATION_TYPE<ProtocolV2> &next,
-                         bufferlist &buffer);
-=20
-+  template <class F>
-+  bool append_frame(F& frame);
-+
-   void requeue_sent();
-   uint64_t discard_requeued_up_to(uint64_t out_seq, uint64_t seq);
-   void reset_recv_state();
-@@ -140,8 +143,6 @@ private:
-   void prepare_send_message(uint64_t features, Message *m);
-   out_queue_entry_t _get_next_outgoing();
-   ssize_t write_message(Message *m, bool more);
--  void append_keepalive();
--  void append_keepalive_ack(utime_t &timestamp);
-   void handle_message_ack(uint64_t seq);
-=20
-   CONTINUATION_DECL(ProtocolV2, _wait_for_peer_banner);
-diff --git a/src/msg/async/crypto_onwire.cc b/src/msg/async/crypto_onwire.=
cc
-index acf3f66689..07e7fe6553 100644
---- a/src/msg/async/crypto_onwire.cc
-+++ b/src/msg/async/crypto_onwire.cc
-@@ -22,6 +22,10 @@ static constexpr const std::size_t AESGCM_BLOCK_LEN{16}=
;
- struct nonce_t {
-   std::uint32_t random_seq;
-   std::uint64_t random_rest;
-+
-+  bool operator=3D=3D(const nonce_t& rhs) const {
-+    return !memcmp(this, &rhs, sizeof(*this));
-+  }
- } __attribute__((packed));
- static_assert(sizeof(nonce_t) =3D=3D AESGCM_IV_LEN);
-=20
-@@ -35,7 +39,8 @@ class AES128GCM_OnWireTxHandler : public ceph::crypto::o=
nwire::TxHandler {
-   CephContext* const cct;
-   std::unique_ptr<EVP_CIPHER_CTX, decltype(&::EVP_CIPHER_CTX_free)> ectx;
-   ceph::bufferlist buffer;
--  nonce_t nonce;
-+  nonce_t nonce, initial_nonce;
-+  bool used_initial_nonce;
-   static_assert(sizeof(nonce) =3D=3D AESGCM_IV_LEN);
-=20
- public:
-@@ -44,7 +49,7 @@ public:
- 			    const nonce_t& nonce)
-     : cct(cct),
-       ectx(EVP_CIPHER_CTX_new(), EVP_CIPHER_CTX_free),
--      nonce(nonce) {
-+      nonce(nonce), initial_nonce(nonce), used_initial_nonce(false) {
-     ceph_assert_always(ectx);
-     ceph_assert_always(key.size() * CHAR_BIT =3D=3D 128);
-=20
-@@ -61,6 +66,7 @@ public:
-=20
-   ~AES128GCM_OnWireTxHandler() override {
-     ::ceph::crypto::zeroize_for_security(&nonce, sizeof(nonce));
-+    ::ceph::crypto::zeroize_for_security(&initial_nonce, sizeof(initial_n=
once));
-   }
-=20
-   std::uint32_t calculate_segment_size(std::uint32_t size) override
-@@ -78,6 +84,13 @@ public:
- void AES128GCM_OnWireTxHandler::reset_tx_handler(
-   std::initializer_list<std::uint32_t> update_size_sequence)
- {
-+  if (nonce =3D=3D initial_nonce) {
-+    if (used_initial_nonce) {
-+      throw ceph::crypto::onwire::TxHandlerError("out of nonces");
-+    }
-+    used_initial_nonce =3D true;
-+  }
-+
-   if(1 !=3D EVP_EncryptInit_ex(ectx.get(), nullptr, nullptr, nullptr,
-       reinterpret_cast<const unsigned char*>(&nonce))) {
-     throw std::runtime_error("EVP_EncryptInit_ex failed");
-diff --git a/src/msg/async/crypto_onwire.h b/src/msg/async/crypto_onwire.h
-index bd682e8c71..0c544f205a 100644
---- a/src/msg/async/crypto_onwire.h
-+++ b/src/msg/async/crypto_onwire.h
-@@ -45,6 +45,11 @@ struct MsgAuthError : public std::runtime_error {
-   }
- };
-=20
-+struct TxHandlerError : public std::runtime_error {
-+  TxHandlerError(const char* what)
-+    : std::runtime_error(std::string("tx handler error: ") + what) {}
-+};
-+
- struct TxHandler {
-   virtual ~TxHandler() =3D default;
-=20
---=20
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-en=
dianness-of-nonce_t.patch b/recipes-extended/ceph/ceph/0001-msg-async-crypt=
o_onwire-fix-endianness-of-nonce_t.patch
deleted file mode 100644
index ad8a2055..00000000
--- a/recipes-extended/ceph/ceph/0001-msg-async-crypto_onwire-fix-endiannes=
s-of-nonce_t.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From dfd1d81cec62e21e21696dc87d4db5f920e51a67 Mon Sep 17 00:00:00 2001
-From: Ilya Dryomov <idryomov@gmail.com>
-Date: Fri, 6 Mar 2020 20:16:45 +0100
-Subject: [PATCH] msg/async/crypto_onwire: fix endianness of nonce_t
-
-As a AES-GCM IV, nonce_t is implicitly shared between server and
-client.  Currently, if their endianness doesn't match, they are unable
-to communicate in secure mode because each gets its own idea of what
-the next nonce should be after the counter is incremented.
-
-Several RFCs state that the nonce counter should be BE, but since we
-use LE for everything on-disk and on-wire, make it LE.
-
-Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
-Reviewed-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
-Reviewed-by: Sage Weil <sage@redhat.com>
-
-CVE: CVE-2020-1759
-Upstream Status: Backport [dfd1d81cec62e21e21696dc87d4db5f920e51a67]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/msg/async/crypto_onwire.cc | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/msg/async/crypto_onwire.cc b/src/msg/async/crypto_onwire.=
cc
-index 07e7fe6553..c39632cbd6 100644
---- a/src/msg/async/crypto_onwire.cc
-+++ b/src/msg/async/crypto_onwire.cc
-@@ -20,8 +20,8 @@ static constexpr const std::size_t AESGCM_TAG_LEN{16};
- static constexpr const std::size_t AESGCM_BLOCK_LEN{16};
-=20
- struct nonce_t {
--  std::uint32_t random_seq;
--  std::uint64_t random_rest;
-+  ceph_le32 random_seq;
-+  ceph_le64 random_rest;
-=20
-   bool operator=3D=3D(const nonce_t& rhs) const {
-     return !memcmp(this, &rhs, sizeof(*this));
-@@ -99,7 +99,7 @@ void AES128GCM_OnWireTxHandler::reset_tx_handler(
-   buffer.reserve(std::accumulate(std::begin(update_size_sequence),
-     std::end(update_size_sequence), AESGCM_TAG_LEN));
-=20
--  ++nonce.random_seq;
-+  nonce.random_seq =3D nonce.random_seq + 1;
- }
-=20
- void AES128GCM_OnWireTxHandler::authenticated_encrypt_update(
-@@ -204,7 +204,7 @@ void AES128GCM_OnWireRxHandler::reset_rx_handler()
- 	reinterpret_cast<const unsigned char*>(&nonce))) {
-     throw std::runtime_error("EVP_DecryptInit_ex failed");
-   }
--  ++nonce.random_seq;
-+  nonce.random_seq =3D nonce.random_seq + 1;
- }
-=20
- ceph::bufferlist AES128GCM_OnWireRxHandler::authenticated_decrypt_update(
---=20
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUE=
ST.patch b/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST=
.patch
deleted file mode 100644
index 30906d7c..00000000
--- a/recipes-extended/ceph/ceph/0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patc=
h
+++ /dev/null
@@ -1,33 +0,0 @@
-From 92da834cababc4dddd5dbbab5837310478d1e6d4 Mon Sep 17 00:00:00 2001
-From: Abhishek Lekshmanan <abhishek@suse.com>
-Date: Fri, 27 Mar 2020 19:29:01 +0100
-Subject: [PATCH] rgw: EPERM to ERR_INVALID_REQUEST
-
-As per Robin's comments and S3 spec
-
-Signed-off-by: Abhishek Lekshmanan <abhishek@suse.com>
-
-CVE: CVE-2020-1760
-Upstream Status: Backport [92da834cababc4dddd5dbbab5837310478d1e6d4]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/rgw/rgw_rest_s3.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
-index 1bfc8312de..f13ae23dd6 100644
---- a/src/rgw/rgw_rest_s3.cc
-+++ b/src/rgw/rgw_rest_s3.cc
-@@ -301,7 +301,7 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferli=
st& bl, off_t bl_ofs,
- 	/* reject unauthenticated response header manipulation, see
- 	 * https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html */
- 	if (s->auth.identity->is_anonymous()) {
--	  return -EPERM;
-+	  return -ERR_INVALID_REQUEST;
- 	}
- 	if (strcmp(p->param, "response-content-type") !=3D 0) {
- 	  response_attrs[p->http_attr] =3D val;
---=20
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-=
in-response-header-act.patch b/recipes-extended/ceph/ceph/0001-rgw-reject-c=
ontrol-characters-in-response-header-act.patch
deleted file mode 100644
index af0fc79a..00000000
--- a/recipes-extended/ceph/ceph/0001-rgw-reject-control-characters-in-resp=
onse-header-act.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From be7679007c3dfab3e19c22c38c36ccac91828e3b Mon Sep 17 00:00:00 2001
-From: "Robin H. Johnson" <rjohnson@digitalocean.com>
-Date: Fri, 27 Mar 2020 20:48:13 +0100
-Subject: [PATCH] rgw: reject control characters in response-header actions
-
-S3 GetObject permits overriding response header values, but those inputs
-need to be validated to insure only characters that are valid in an HTTP
-header value are present.
-
-Credit: Initial vulnerability discovery by William Bowling (@wcbowling)
-Credit: Further vulnerability discovery by Robin H. Johnson <rjohnson@digi=
talocean.com>
-Signed-off-by: Robin H. Johnson <rjohnson@digitalocean.com>
-
-CVE: CVE-2020-1760
-Upstream Status: Backport [be7679007c3dfab3e19c22c38c36ccac91828e3b]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/rgw/rgw_rest_s3.cc | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
-index f13ae23dd6..0de040968c 100644
---- a/src/rgw/rgw_rest_s3.cc
-+++ b/src/rgw/rgw_rest_s3.cc
-@@ -189,6 +189,15 @@ int decode_attr_bl_single_value(map<string, bufferlis=
t>& attrs, const char *attr
-   return 0;
- }
-=20
-+inline bool str_has_cntrl(const std::string s) {
-+  return std::any_of(s.begin(), s.end(), ::iscntrl);
-+}
-+
-+inline bool str_has_cntrl(const char* s) {
-+  std::string _s(s);
-+  return str_has_cntrl(_s);
-+}
-+
- int RGWGetObj_ObjStore_S3::send_response_data(bufferlist& bl, off_t bl_of=
s,
- 					      off_t bl_len)
- {
-@@ -303,6 +312,19 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferl=
ist& bl, off_t bl_ofs,
- 	if (s->auth.identity->is_anonymous()) {
- 	  return -ERR_INVALID_REQUEST;
- 	}
-+        /* HTTP specification says no control characters should be presen=
t in
-+         * header values: https://tools.ietf.org/html/rfc7230#section-3.2
-+         *      field-vchar    =3D VCHAR / obs-text
-+         *
-+         * Failure to validate this permits a CRLF injection in HTTP head=
ers,
-+         * whereas S3 GetObject only permits specific headers.
-+         */
-+        if(str_has_cntrl(val)) {
-+          /* TODO: return a more distinct error in future;
-+           * stating what the problem is */
-+          return -ERR_INVALID_REQUEST;
-+        }
-+
- 	if (strcmp(p->param, "response-content-type") !=3D 0) {
- 	  response_attrs[p->http_attr] =3D val;
- 	} else {
---=20
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-res=
ponse-header-actions.patch b/recipes-extended/ceph/ceph/0001-rgw-reject-una=
uthenticated-response-header-actions.patch
deleted file mode 100644
index ae241473..00000000
--- a/recipes-extended/ceph/ceph/0001-rgw-reject-unauthenticated-response-h=
eader-actions.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8f90658c731499722d5f4393c8ad70b971d05f77 Mon Sep 17 00:00:00 2001
-From: Matt Benjamin <mbenjamin@redhat.com>
-Date: Fri, 27 Mar 2020 18:13:48 +0100
-Subject: [PATCH] rgw: reject unauthenticated response-header actions
-
-Signed-off-by: Matt Benjamin <mbenjamin@redhat.com>
-Reviewed-by: Casey Bodley <cbodley@redhat.com>
-(cherry picked from commit d8dd5e513c0c62bbd7d3044d7e2eddcd897bd400)
-
-CVE: CVE-2020-1760
-Upstream Status: Backport [8f90658c731499722d5f4393c8ad70b971d05f77]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/rgw/rgw_rest_s3.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/rgw/rgw_rest_s3.cc b/src/rgw/rgw_rest_s3.cc
-index 532d738b58..1bfc8312de 100644
---- a/src/rgw/rgw_rest_s3.cc
-+++ b/src/rgw/rgw_rest_s3.cc
-@@ -298,6 +298,11 @@ int RGWGetObj_ObjStore_S3::send_response_data(bufferl=
ist& bl, off_t bl_ofs,
-       bool exists;
-       string val =3D s->info.args.get(p->param, &exists);
-       if (exists) {
-+	/* reject unauthenticated response header manipulation, see
-+	 * https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html */
-+	if (s->auth.identity->is_anonymous()) {
-+	  return -EPERM;
-+	}
- 	if (strcmp(p->param, "response-content-type") !=3D 0) {
- 	  response_attrs[p->http_attr] =3D val;
- 	} else {
---=20
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octop=
us-client-tell-command.patch b/recipes-extended/ceph/ceph/0002-mon-enforce-=
caps-for-pre-octopus-client-tell-command.patch
deleted file mode 100644
index 79f2174b..00000000
--- a/recipes-extended/ceph/ceph/0002-mon-enforce-caps-for-pre-octopus-clie=
nt-tell-command.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From ddbac9b2779172876ebd2d26b68b04b02350a125 Mon Sep 17 00:00:00 2001
-From: Josh Durgin <jdurgin@redhat.com>
-Date: Thu, 23 Apr 2020 00:22:10 -0400
-Subject: [PATCH 2/3] mon: enforce caps for pre-octopus client tell command=
s
-
-This affects only the commands whitelisted here - in particular
-injectargs requires write access to the monitors.
-
-Signed-off-by: Josh Durgin <jdurgin@redhat.com>
-
-Upstream-status: Backport=20
-[https://github.com/ceph/ceph/commit/fc5e56b75a97c4652c87e9959aad1c4dec450=
10d]
-
-Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
----
- src/mon/Monitor.cc | 56 +++++++++++++++++++++++-----------------------
- 1 file changed, 28 insertions(+), 28 deletions(-)
-
-diff --git a/src/mon/Monitor.cc b/src/mon/Monitor.cc
-index b7cb3eae..eecd2f68 100644
---- a/src/mon/Monitor.cc
-+++ b/src/mon/Monitor.cc
-@@ -3226,34 +3226,6 @@ void Monitor::handle_command(MonOpRequestRef op)
-     return;
-   }
-=20
--  // compat kludge for legacy clients trying to tell commands that are
--  // new.  see bottom of MonCommands.h.  we need to handle both (1)
--  // pre-octopus clients and (2) octopus clients with a mix of pre-octopu=
s
--  // and octopus mons.
--  if ((!HAVE_FEATURE(m->get_connection()->get_features(), SERVER_OCTOPUS)=
 ||
--       monmap->min_mon_release < ceph_release_t::octopus) &&
--      (prefix =3D=3D "injectargs" ||
--       prefix =3D=3D "smart" ||
--       prefix =3D=3D "mon_status" ||
--       prefix =3D=3D "heap")) {
--    if (m->get_connection()->get_messenger() =3D=3D 0) {
--      // Prior to octopus, monitors might forward these messages
--      // around. that was broken at baseline, and if we try to process
--      // this message now, it will assert out when we try to send a
--      // message in reply from the asok/tell worker (see
--      // AnonConnection).  Just reply with an error.
--      dout(5) << __func__ << " failing forwarded command from a (presumab=
ly) "
--	      << "pre-octopus peer" << dendl;
--      reply_command(
--	op, -EBUSY,
--	"failing forwarded tell command in mixed-version mon cluster", 0);
--      return;
--    }
--    dout(5) << __func__ << " passing command to tell/asok" << dendl;
--    cct->get_admin_socket()->queue_tell_command(m);
--    return;
--  }
--
-   string module;
-   string err;
-=20
-@@ -3368,6 +3340,34 @@ void Monitor::handle_command(MonOpRequestRef op)
-       << "entity=3D'" << session->entity_name << "' "
-       << "cmd=3D" << m->cmd << ": dispatch";
-=20
-+  // compat kludge for legacy clients trying to tell commands that are
-+  // new.  see bottom of MonCommands.h.  we need to handle both (1)
-+  // pre-octopus clients and (2) octopus clients with a mix of pre-octopu=
s
-+  // and octopus mons.
-+  if ((!HAVE_FEATURE(m->get_connection()->get_features(), SERVER_OCTOPUS)=
 ||
-+       monmap->min_mon_release < ceph_release_t::octopus) &&
-+      (prefix =3D=3D "injectargs" ||
-+       prefix =3D=3D "smart" ||
-+       prefix =3D=3D "mon_status" ||
-+       prefix =3D=3D "heap")) {
-+    if (m->get_connection()->get_messenger() =3D=3D 0) {
-+      // Prior to octopus, monitors might forward these messages
-+      // around. that was broken at baseline, and if we try to process
-+      // this message now, it will assert out when we try to send a
-+      // message in reply from the asok/tell worker (see
-+      // AnonConnection).  Just reply with an error.
-+      dout(5) << __func__ << " failing forwarded command from a (presumab=
ly) "
-+	      << "pre-octopus peer" << dendl;
-+      reply_command(
-+	op, -EBUSY,
-+	"failing forwarded tell command in mixed-version mon cluster", 0);
-+      return;
-+    }
-+    dout(5) << __func__ << " passing command to tell/asok" << dendl;
-+    cct->get_admin_socket()->queue_tell_command(m);
-+    return;
-+  }
-+
-   if (mon_cmd->is_mgr()) {
-     const auto& hdr =3D m->get_header();
-     uint64_t size =3D hdr.front_len + hdr.middle_len + hdr.data_len;
---=20
-2.25.1
-
diff --git a/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about=
-security-fix.patch b/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-n=
ote-about-security-fix.patch
deleted file mode 100644
index ed2a63e7..00000000
--- a/recipes-extended/ceph/ceph/0003-PendingReleaseNotes-note-about-securi=
ty-fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 56800925651857821034ac9c8ec82d45635cc3b8 Mon Sep 17 00:00:00 2001
-From: Josh Durgin <jdurgin@redhat.com>
-Date: Wed, 13 May 2020 21:34:56 -0700
-Subject: [PATCH 3/3] PendingReleaseNotes: note about security fix
-
-Signed-off-by: Josh Durgin <jdurgin@redhat.com>
-
-Upstream-status: Backport=20
-[https://github.com/ceph/ceph/commit/06f239fc35f35865d2cf92dda1ac8f4d5fe82=
bde]
-
-Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
----
- PendingReleaseNotes | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/PendingReleaseNotes b/PendingReleaseNotes
-index c9fd4c79..6e07ce6d 100644
---- a/PendingReleaseNotes
-+++ b/PendingReleaseNotes
-@@ -1,6 +1,8 @@
- >=3D15.0.0
- --------
-=20
-+* CVE-2020-10736: Fixes an authorization bypass in monitor and manager da=
emons
-+
- * The RGW "num_rados_handles" has been removed.
-   * If you were using a value of "num_rados_handles" greater than 1
-     multiply your current "objecter_inflight_ops" and=20
---=20
-2.25.1
-
diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/c=
eph_15.2.8.bb
similarity index 81%
rename from recipes-extended/ceph/ceph_15.2.0.bb
rename to recipes-extended/ceph/ceph_15.2.8.bb
index 8454a200..f771baa2 100644
--- a/recipes-extended/ceph/ceph_15.2.0.bb
+++ b/recipes-extended/ceph/ceph_15.2.8.bb
@@ -12,23 +12,15 @@ SRC_URI =3D "http://download.ceph.com/tarballs/ceph-${P=
V}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
-           file://0001-msg-async-ProtocolV2-avoid-AES-GCM-nonce-reuse-vuln=
e.patch \
-           file://0001-msg-async-crypto_onwire-fix-endianness-of-nonce_t.p=
atch \
-           file://0001-rgw-reject-unauthenticated-response-header-actions.=
patch \
-           file://0001-rgw-EPERM-to-ERR_INVALID_REQUEST.patch \
-           file://0001-rgw-reject-control-characters-in-response-header-ac=
t.patch \
-           file://0001-mgr-require-all-caps-for-pre-octopus-tell-commands.=
patch \=20
-           file://0002-mon-enforce-caps-for-pre-octopus-client-tell-comman=
d.patch \
-           file://0003-PendingReleaseNotes-note-about-security-fix.patch \
            file://0001-add-missing-include-for-atomic-bool.patch \
            file://0001-cmake-add-support-for-python3.9.patch \
 "
=20
-SRC_URI[md5sum] =3D "1f9af648b4c6d19975aab2583ab99710"
-SRC_URI[sha256sum] =3D "4292c473d1714a6602c525d7582e4e03ec608f0a1cbc0dd338=
207e5c7068e0d3"
-SRC_URI[sha1sum] =3D "7158806ece1483fcccdf1172c20cc34d9401c543"
-SRC_URI[sha384sum] =3D "20e996dbf30d1e33a6d6aae36960190125ce263d306415bcec=
5d2b3032b8b8f730deeba3ca318576573127d08909404a"
-SRC_URI[sha512sum] =3D "07a3ff2ccf1a3abac652ff8c5f1611e7c628fcedcb280adc6c=
d49792b46fa50c7c29437dc57c2c4a6af708a6833abf8c1a386ef2142d30bd5e1f214ba7aec=
4f2"
+SRC_URI[md5sum] =3D "cab93dadfe38888561d390fd58b8c947"
+SRC_URI[sha256sum] =3D "64c5eaf8c1e4092e59bc538e9241b6d5cf4ffca92563031abb=
ea8b37b4cab9da"
+SRC_URI[sha1sum] =3D "77b60c3775cd6e38f2d07870aee550368105c74b"
+SRC_URI[sha384sum] =3D "2173c5176e9ff3745e4bc493585a8cf14e9e7737cf575551a0=
10b7b84cd6b88b378dc93e6509b3a696732c51f530fa60"
+SRC_URI[sha512sum] =3D "66c7322575165b4747955ac9de34f9f9e2d4361c8cd8498819=
383883045601b92f786c4336c79369d6f019db1c4524c492faa40cdceed7fc1b2b373ca6ab5=
065"
=20
 DEPENDS =3D "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
--=20
2.29.2

