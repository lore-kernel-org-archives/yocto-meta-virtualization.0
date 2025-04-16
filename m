Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F66C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 12:59:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18547.1744808345283306586
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 05:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6201482bd1=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GB8Laj020078;
	Wed, 16 Apr 2025 12:58:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1mspe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 12:58:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPLToOHbQ3sK8a+3RBpJWEM8IHumJ1q3fkNfqe40hkVZr32GoWHTiStVPqY/eWllpwxGK5Kzp3XYRRGxbLHDkaVTZh4FxLugFcC0bQ+IMBLrYWZtpIM1jSpnGg4HscMeTt7aKsXWPU3XcCswYTafX1CtVlEMxW5anNrDT4WoL3tgy3huhaIwn+TWu+cJO8XD+vujN+C7Vy8PDZFFtTND7VFJf/2tpEv4V/YMVue3v+Db79i2mGGwOvlCEMkij/9LzOsc6QQM5Sr3hlnuBr6ZJhPeHdOQjNxgmx/93UVy/xAeF3LUqJ+iRnqHO2lPaFQYS3Ikzs9aM66J1OKc8xek/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFJJovVCAKGZXNUI5+KMpG+OkW8wlaz+4KyJtF7HeEs=;
 b=ShTtXfFxfCa7uE/+PP3d49AXIwzB9iP2nfd0UAHcnngODoAC2Iy16+QrLPuqWYblAl6CGSQjmu2oMeerIBCYnZgiWMGrkFgnXxtxur8VLwOQC6YYcQ42hJhhtya9baH9NFIhstWCOqDODTbCOK3VKiEy//5gWdM0frmfqcevEXdNIKpmkSy60UxZl5MSBHVhg5KnNpiadHPwgsmvwdebNJgUaG8xE7VkpGb+Cm1+7hTA5UJIVDdwayCygWdKKOOKxIeiy8dh4kNQkB/OAkSGSWhQHELSvWgfe8hB0RQFExzWeZJxx38zQp/v4UnmtL8iNmcYlGJekuwL9pVxOeUL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.22; Wed, 16 Apr 2025 12:58:43 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 12:58:43 +0000
From: libo.chen.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Cc: christian.ege@ifm.com
Subject: [kirkstone][PATCH] python3-docker: Fix for requests 2.32.0: CVE-2024-35195 backport
Date: Wed, 16 Apr 2025 20:58:05 +0800
Message-Id: <20250416125805.1672302-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: c424a715-2855-4222-9fc0-08dd7ce66afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jzjDTHNFEAmoz578ApvAxanJ6MidesQ1qWQ0+l0xOtAyN87OCLlIdq1DMpRM?=
 =?us-ascii?Q?KHwkKwSplNHymxMen1Q0/84GWJBdfhlbwp1tG7LeErin0V6gLh/XQwp3nsEo?=
 =?us-ascii?Q?CTniapd1t6KpY0x08KTbvtj+bOH6hfghTx0KBf40szc9uCRVJGyrRYPVcATF?=
 =?us-ascii?Q?Yk0TOdyecjmgjkwPV+FS5MniZvY2H+Sp4txThW1WU73oNKm/U4SWu+CE+AKF?=
 =?us-ascii?Q?Ocp+fa5LJZRWd9Ixmm28qNwnJCsz5PWKu9cWoyHyqeHudZr+R81uWebnYv7k?=
 =?us-ascii?Q?/1XmGu/vsSIEnoSlYV5mqlTdTCzi+Nl13u/TwKqC/Rc6fIBUMwOZ0uyHBwtZ?=
 =?us-ascii?Q?R3fl2jFXxfUFpwmds3eZ8kEPlchiGj0sGYoTcygZ2a3pdzRN+gPr8/S20dvj?=
 =?us-ascii?Q?vcaYUTYLUu202WPr7oseDBNNpoo/0tSGZ+Ju0x+a6CVP9bvfBC2OItZ1PN74?=
 =?us-ascii?Q?5RAH7CR8HXEM4OPQKq+hQs/1aqegDrj34ilfGwVvj1QVyjrilRoohXFgfNAY?=
 =?us-ascii?Q?iJuhebhEHCusTd3KXV5SWscnkHa5/U/QRUEHGBjOkJjnNYYX64R64ipesfcQ?=
 =?us-ascii?Q?SxrNMsvAkNWQWjzr6rW6EGElpMHzW0faFgi1JK8UUoR6y33BRilmaCk1QkxD?=
 =?us-ascii?Q?PgBxcclU1pN3UyVxYXkP4m/DeU2iih38Wjmsa4gf7QEU6Md5gQNScUCggfKC?=
 =?us-ascii?Q?cx+umTnIrgZdq7sDlXCLDuBWZRRj3uxTtKRLbwwG5EBB2tCaEuksr++Q3aic?=
 =?us-ascii?Q?7SiewANo7TD/+NiPOAYFsm59RY0xUYG7ytdQNIB5bnCPwWDQDKgcQZm54ZU4?=
 =?us-ascii?Q?Py/SLnnByci/S/YGgK6x5s/wIKyQQk/rLQQLQ9oJFmyssPHFmHGAyj8Shjn/?=
 =?us-ascii?Q?CiSr6kGa07vtOg8yzRQ6JesGkDvWeB2f3ApFTfWDhe/N3hnLuHz9JiSrTyaw?=
 =?us-ascii?Q?qP83CAmmR8t9XkXDlQ/EOBIRmxSBHS92SoPVU25WL47i84MdaSWTAKZ+o+bF?=
 =?us-ascii?Q?ntiF80NJOUWznYMGwnw9sU63ELOJz5W2UF8fYe7H4oDGiGC048ffZMVO6A3H?=
 =?us-ascii?Q?NjR6OJtkSERr3y6EtkOE4B0omNDafWbtiQ7AUji3AjzjG4keUAZ2x17SsEwh?=
 =?us-ascii?Q?9oWo3YYY2x88x5Ld2NAcfPrvdPnqfYKlykuDTTurQ13vRQEHYpC+o4zV7A47?=
 =?us-ascii?Q?lvNHEp/f3tp63AB0xdPbED80s/lw05i9RthRWr/j+InWB9iIuIBaqmjMcct/?=
 =?us-ascii?Q?Icxf3YbyLeBhgxl7cd7vYnftnboU6l9XVsg6P88xP8bPcBV+M5khcS1pK7bQ?=
 =?us-ascii?Q?hSYWfGOQOWVAuPfTfDBi3iRa7AqypmvmH7MNYA0ERMsMs26/VUTqeaxkwd1N?=
 =?us-ascii?Q?sjuDSw2+8XxpPgOwjzA+aChnxMgVM4atWvuYTYbk/vsvBwm0FFzLk8D2J06n?=
 =?us-ascii?Q?fzu8uv5unB0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+PwnNeAggmZg1IJxMn+8N/Ue+JmAygD2KIgNnIc5bWlHog++kQPd1Zmrm260?=
 =?us-ascii?Q?uAWG+0+CTga2kLzUSN30HilfkA7gsaxIBFpuB0CGWXudAY7iEvPAuwV4NCEE?=
 =?us-ascii?Q?xOM/qvGlChL9hktQOCpYD5jseUhQT1Bsz3Ao69ymQ27kkXizXXwbvaO81Rw3?=
 =?us-ascii?Q?Tb6SZaW+3MmZwix8UqDk02RpVprxr+c4SQSXsv0m6Y+7oN1ZRvDI5KHKsK50?=
 =?us-ascii?Q?pcmo4gCq3DjDKSDoL8YjmR5Wd4YRYUJc5oMe7QrsjVUfugw9yF6GLlkGyGQ5?=
 =?us-ascii?Q?snfas7gkbGHtOzBAvJRaT+dYKLpLzK3FX/XkoVX9oQk4gHvKZXdKZZI9bO53?=
 =?us-ascii?Q?AUMrSgJ4C/ZSCDty8xykTswSLZMo1eFOT5YfP8ebk5ugfoPKmVKRlZRd0H+B?=
 =?us-ascii?Q?jyaJePkEOhn8CcFO9lrW5BXRHaGfwQnQRaN1BLW77yduwrVtE4ZAWlQyLHq7?=
 =?us-ascii?Q?KC2ASGOI40M44ja2Sm4iV94I/W04BnTOOuMovuZQaSQsIrlT8TdnxmXa22PN?=
 =?us-ascii?Q?x7QGhRTg3aNk5n/pM76LG6MMuVudBNLwuVEN34PwChZwkmzsa8CqZMoe16vd?=
 =?us-ascii?Q?1N18P7AYrA3eYEBE6BlDv1Agz5Aqyai5IBYci8fvx7lYr5XsTsroUlwyIvIx?=
 =?us-ascii?Q?YmJUV1s1XCaiimQqsqQ4ovUFRUGRzVyh3JPHtkMpcqsLCTQpc99cxZhw56EB?=
 =?us-ascii?Q?CF+zOWfKjIKryyNrbcm6SlWZT0pFWra76CRBhmJ3A+cEUpqXQdZevsE51HQh?=
 =?us-ascii?Q?e8UVuFE93rKarEdrl3bGW/HeJHJRSdsBkp6/H4XlrXVRqZKSU6p/JuSsVm2i?=
 =?us-ascii?Q?HL//qP6UcdjT8wN5kwjCwZ/rVFr7SFDB7S9haoUEKUI1u0Z2dUXlLuXc2MjB?=
 =?us-ascii?Q?kf7rp0TvM9EJLiRqkIVLV4xFmTdzySVMEz/JwMHr7w5K8UlEktTIBW89TQev?=
 =?us-ascii?Q?NIA44UxVfe78tkjf9jNDSj75Yp47Gs+gtFioKsxQnxYqhD2j2m4hLopkJ+EY?=
 =?us-ascii?Q?6JcRenKezP9D10AEVGGm70u416jRbE46ef+CtkPwa+6j4P662tPzyAmbEbb+?=
 =?us-ascii?Q?l2HfgleKkTUv1MaGIxueI3BsNKKLw327hfi0ROfdqw2vJt6pQtl3cKXWJQT7?=
 =?us-ascii?Q?fnycvF/8KVPpHhVQrW8wy6w+1r+QT+3te9gJiIlZrrRFcmVMTPjxvQ+osvRw?=
 =?us-ascii?Q?t9YfF8WraCqzZxXnmwP87uGs//AFnHz0fQLg9CCwrmz1zvfep8hd8ftlUGq5?=
 =?us-ascii?Q?HhnkBLagl1HkVAktKayJycf0QcQxdcS2EH5U6pXQPePjOEYdXxA9JiSJrkyp?=
 =?us-ascii?Q?nPeCXCeO8AY5E1ER7Nk1/TbPv1WROCr7FnFHJEh92IijxX4/twvHjskyIKRk?=
 =?us-ascii?Q?Vqb6+xDU4sn2Cx0aKzO2EFC0rqRWjdE/TaCaA5Hu2GRH/rnvy7afkVFdLb6g?=
 =?us-ascii?Q?NNK/Ybvu3ths7PoskIWSkAdxRl8WccQccaqZHqLY9KOdL3SynNnNapRWGDe/?=
 =?us-ascii?Q?WBXUkTQYA19uIRZvvWGbEuZxARAOOOihbl9OmS83Sg/6ESdQdOPtSk4v2f+1?=
 =?us-ascii?Q?bufaOkfcK8H0jIRejEpUwmi5mcgbY8+3SCHoSIFmPw5gJ5469R6ATbjpY8BW?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c424a715-2855-4222-9fc0-08dd7ce66afb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:58:43.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZFyrHKdZOajR28NBZWZpWk6iYZ4UKXb86RykAxgz/s+EIVgyobay+gxpv5hKU+EPqI5gQqyDLD0YV6SYC0TelnbXUc5BO8gwZDJkIngiEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
X-Proofpoint-ORIG-GUID: lileASOJ8SgO6L_Y7s-qQbhj-oeOYTYm
X-Proofpoint-GUID: lileASOJ8SgO6L_Y7s-qQbhj-oeOYTYm
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67ffa986 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=W5idTISOAAAA:8 a=t7CeM3EgAAAA:8 a=q6F-0hWrsrku3XXWygkA:9 a=RPtaIdDB-f1icXQq6S4k:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=707 impostorscore=0 suspectscore=0 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504160106
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Apr 2025 12:59:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9229

From: Christian Ege <christian.ege@ifm.com>

After backporting the CVE-2024-35195 in poky, parts of python3-requests
got updated to 2.32.0 which is incompatible with the current
docker-compose command.

This patch will fix the following error message:

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/bin/docker-compose", line 8, in <module>
    sys.exit(main())
  File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 81, in main
    command_func()
  File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 200, in perform_command
    project = project_from_options('.', options)
  File "/usr/lib/python3.10/site-packages/compose/cli/command.py", line 60, in project_from_options
    return get_project(
  File "/usr/lib/python3.10/site-packages/compose/cli/command.py", line 152, in get_project
    client = get_client(
  File "/usr/lib/python3.10/site-packages/compose/cli/docker_client.py", line 41, in get_client
    client = docker_client(
  File "/usr/lib/python3.10/site-packages/compose/cli/docker_client.py", line 170, in docker_client
    client = APIClient(use_ssh_client=not use_paramiko_ssh, **kwargs)
  File "/usr/lib/python3.10/site-packages/docker/api/client.py", line 197, in __init__
    self._version = self._retrieve_server_version()
  File "/usr/lib/python3.10/site-packages/docker/api/client.py", line 221, in _retrieve_server_version
    raise DockerException(
docker.errors.DockerException: Error while fetching server API version: Not supported URL scheme http+docker

Signed-off-by: Christian Ege <christian.ege@ifm.com>

Reference: https://github.com/graugans/meta-virtualization/commit/4149812ca9581a313de27c45a0f2dfa7bd8f53df

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../0001-hotfix-requests-issue.patch          | 31 +++++++++++++++++++
 .../python/python3-docker_5.0.0.bb            |  4 +++
 2 files changed, 35 insertions(+)
 create mode 100644 recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch

diff --git a/recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch b/recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch
new file mode 100644
index 00000000..70ad8f49
--- /dev/null
+++ b/recipes-devtools/python/python3-docker/0001-hotfix-requests-issue.patch
@@ -0,0 +1,31 @@
+From 2efec099ad80c18136dc38d9dafd1bb868bf4c90 Mon Sep 17 00:00:00 2001
+From: Felix Fontein <felix@fontein.de>
+Date: Mon, 20 May 2024 21:08:25 +0200
+Subject: [PATCH] Add hotfix for requests 2.32.0. (#861)
+
+Upstream-Status: Backport
+[https://github.com/ansible-collections/community.docker/commit/ab8b6662c28a2c7b0473d43fcf0b26adb2877ede]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ docker/transport/basehttpadapter.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/docker/transport/basehttpadapter.py b/docker/transport/basehttpadapter.py
+index 4d819b6..3ffe78b 100644
+--- a/docker/transport/basehttpadapter.py
++++ b/docker/transport/basehttpadapter.py
+@@ -6,3 +6,10 @@ class BaseHTTPAdapter(requests.adapters.HTTPAdapter):
+         super(BaseHTTPAdapter, self).close()
+         if hasattr(self, 'pools'):
+             self.pools.clear()
++
++    # Hotfix for requests 2.32.0: its commit
++    # https://github.com/psf/requests/commit/c0813a2d910ea6b4f8438b91d315b8d181302356
++    # changes requests.adapters.HTTPAdapter to no longer call get_connection() from
++    # send(), but instead call _get_connection().
++    def _get_connection(self, request, *args, **kwargs):
++        return self.get_connection(request.url, kwargs.get('proxies'))
+-- 
+2.35.5
+
diff --git a/recipes-devtools/python/python3-docker_5.0.0.bb b/recipes-devtools/python/python3-docker_5.0.0.bb
index 44d65b05..3ad359c3 100644
--- a/recipes-devtools/python/python3-docker_5.0.0.bb
+++ b/recipes-devtools/python/python3-docker_5.0.0.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://github.com/docker/docker-py"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
 
+SRC_URI:append = " \
+                file://0001-hotfix-requests-issue.patch \
+"
+
 SRC_URI[md5sum] = "9cc5156a2ff6458a8f52114b9bbc0d7e"
 SRC_URI[sha256sum] = "3e8bc47534e0ca9331d72c32f2881bb13b93ded0bcdeab3c833fb7cf61c0a9a5"
 
-- 
2.34.1


