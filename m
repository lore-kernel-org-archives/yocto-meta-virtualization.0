Return-Path: <collin.richards@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0983E00984; Mon, 20 Jun 2016 15:22:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.108 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 21969 seconds by postgrey-1.32 at yocto-www;
	Mon, 20 Jun 2016 15:22:06 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0108.outbound.protection.outlook.com [157.56.111.108])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FBDEE005A9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jun 2016 15:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3p1aCWUq5kVbbz8INCnu0wwoiAVi8wYnDfFEpwO8t2I=;
	b=M3mZmQcIWas12gWgQtg/VsojEQFRboP/rhAIhcW9PzbBLrhdmx71Ok95REJOdL8qWeu90X3voswmQ+J8awnFXUWavLz5JbRpnOvvM8jjveklZPjIuU9MaZ1egXybyjnKoEgTnwocB+bBi3Xwsoan5y3R3YDp/N2GyR72uHsJJtk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=collin.richards@ni.com; 
Received: from titan.amer.corp.natinst.com (130.164.62.220) by
	SN1PR04MB2061.namprd04.prod.outlook.com (10.169.124.11) with Microsoft
	SMTP Server (TLS) id 15.1.523.12; Mon, 20 Jun 2016 22:22:04 +0000
From: Collin Richards <collin.richards@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 20 Jun 2016 17:21:55 -0500
Message-ID: <1466461316-23791-1-git-send-email-collin.richards@ni.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [130.164.62.220]
X-ClientProxiedBy: BY1PR15CA0020.namprd15.prod.outlook.com (10.162.17.158) To
	SN1PR04MB2061.namprd04.prod.outlook.com (10.169.124.11)
X-MS-Office365-Filtering-Correlation-Id: cfa06c8b-989f-4536-3bf1-08d399594ee0
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	2:UkL4H3t27DSDPiOfw6gpLLdM3dxR9t5SC2BLL6PqVpJsUtkORx6b8VERpvst5gOSo9Z3wOl2hJrKNoEdKasR9jbjjFWOywl2nayFeGpwy+pixCgjecHaODqgqQkTADrtqPGOV/tnIZrbzpjFvtVM65gIjvEN0GP7vsNJBYgd2yzH4SNM2Wv7vQOnSmNw9aqq;
	3:Kt3/9C4MuYtcbWewPVGHbR13XhurodAvaGIzGoGs4vLZXYTP5zBsXZNpAkE4hAL5+EvhJgd/VkNl24qmPauB35z/mMRul1zy2ibydmaF6NiRYPiMTx/C+OcJqGDBdMhe
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR04MB2061;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	25:RwWGAYgD4htCbmPT0Z4HPqd4qiFuUiMPQ2GSUz625FtNtnUH23b5umJFUhlLm+7jWjiDkb9xGu6mK1nm68Ia/KSBcU9FCJrdPbGpZ2kzsZahOmlzKyLUUdan9YWgyprHqiq0meO6nD3XBhPK1hbBI3Vu3JJ7PEhZYPjlDfbRbFxXWCh6L2bVmT/RrzZB0Vk98LYjqY0VkuW7ufMKixfQD4KSrSr++KJwzSaMqLFBEAHH9vmHu3SVGjC8nxFpW0JIGss1eA9yfI24NUdf38ctxTrA4FQduWQ3E8xSpNiSxFa2i/ANT7/4SphwGB2ZgAojIryYk54iXgOQlYeZod/NHENORsOjxVhSFuSCFv6JY4qnJ40mSKDhJ71R6K6ggbvoSsDxSE7sh7SfciDJ9kTvFAgUlSJxxiuOKt/C73aZ5CmOyGmb3BLaIwnxKzBP3+yCeL7Yy7gfNuSye6L7ELFO6duH84+jVRLUY5NduVRPTrnwvS+ZNOiCwogBLkgNsRZnXkJvlsb484kCcRH7e2vukXgIMzXjLJOeu+Dan60YuzkXL6U6rYqnAY2TVXXpdec7TA+AfHJW/XuW1wV3yM4/bBbrfYf+w1QUDlDN3jN/Rjqu++QUv6xOk+g4qcVeKMZxA9qhZTl295usJ721iuiyZygI1I+c54kpBpLwdWv8nas18wn8m3erEFTq44QP7nLcuANXcoq2DglmdC81H0NsUyeyQ0HflzPGwMZYP7BWB3g+Sdgbuqifuv2lJePoIrRplh860G8zs0NM5ZISpAFlITabSFvilROYtZ8bz4fg76i4fF2yBd3Gy0RUbWRelkn11BQRvMKlk4a0BqDvv5MxdZfEV+ARfA/3/hNb3bDLWktAkAEZT513nm3sY9x9AMgK
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	20:6u1e0nq+EDiru/DKYoM5T9Rwng27JeMqORKYXyo/SOYTztEW6xe4BpJHmb0qSihGu+xQJHTa4lzKDAy+LpR2vyJNHl3aECOi7vatOmOHIFM1r4QzQv84/4Nr6ivSWWLYEgBAYY41hg6HoFjDEapLd6GkPx5LIJC7Fstfi4nbgvL9RDq+G68pyoeNl3sBkQm83jgeLeo/GShd7Lc0O5cohh7eqVkDLLyOx3DLtHpaxBVS3LrbH0c/Oq3gP3q+lrtjpo2aMluV2gczZae4o47Ntl305kbqPqHZfxUCl66g2hlrkCul+MOcMSSjJumRFyFcgQYiPDZY8g8kIdiB3OUnnoF3lUadaIFaghNvJ5CI3f/wjObAPHaTMqP5rzCBP4+sT186xCXAS78UGU5vbu6dHq0yfH1Z/OEtb5fQV0aa3vgHYY26l/5xwtATsJyt5VhzKgY7UvtrrkpsvVEcarCcu0Yg56AR6/DKzdVkpAc1se5+isxeiy0DEng8i/NUjoFix9vzbGWDAEtmlvg7rYuAkJPIhGuirVZ4JDhT+couyS5g2NpIuhqmZ4dAHxj1qgao8CjeJIHcoBQeC4D2W9cLpCCWoUInkSA0BqWwF1T8Bo8=
X-Microsoft-Antispam-PRVS: <SN1PR04MB2061BD4FDBA3858D2849794B832A0@SN1PR04MB2061.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(5213294742642)(145744241990776); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR04MB2061; BCL:0; PCL:0; RULEID:; SRVR:SN1PR04MB2061; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	4:lLWkjUJH6qodz+8JWoD0tvdVxElmqY7vPWPH4wnPcXi6NI5q1WCFaL17ubD5eW1ytXrSGRAm3cb/saHvRL6TenFQuk0d+J2/EpiRv0ZDB0Q3IuWUAF7T9wjLTig+H3689xqZyNx3BRnovB/fxFS0qEblJwXz6bx4lD73sjVrA2p5yzF9nJv7AXTP5TE4KubVOdwaYtpnpLMe79Syd74BfEoAJxkCL00DQvHccIjvDkwmGQyo/Wcqe3S+AmZfvzi4UFgI4j3hLG2xPP2qL8fp2CFeVyBq7AaahKai4hciswHgd/r+YtDdUldsPIsGUZSFSvLpR1BvhH5KZpoSXxUjEU4VBR0B7Ulik7tCtLKalu5HvpAB6tMeRbjyB5AMiVySm+D4VhCvr71g0cXUeFIAvUqbU1yBXvY2J7J4XS4T8gvTvW24wTAIyRU85JWG9aPXXs7L3jnqVPJVMn0t92hgC1WfcE5SkZbIcoxMlgGglBo=
X-Forefront-PRVS: 09796A1B83
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(189002)(199003)(2906002)(77096005)(105586002)(8676002)(81166006)(19580395003)(81156014)(4326007)(3846002)(68736007)(229853001)(106356001)(50466002)(19580405001)(15975445007)(2351001)(110136002)(48376002)(42186005)(50986999)(97736004)(92566002)(66066001)(586003)(5003940100001)(50226002)(36756003)(33646002)(86362001)(47776003)(189998001)(450100001)(7846002)(7736002)(6116002)(101416001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR04MB2061;
	H:titan.amer.corp.natinst.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR04MB2061;
	23:W0X6YuhQ/zcLSQ+tq7OlVToocqU58purJSPBwW1EA?=
	=?us-ascii?Q?vCHVCAUAfmJgdtqUonhAAVNVLQy2TaePO/bX4Eo2cbR3JLVZj7oC436laxby?=
	=?us-ascii?Q?xrhDAErxv5K0VPvxS5YgRGSuHqmKszQf+pH7+DxZn2VcFg0YNg2/W4z12nNN?=
	=?us-ascii?Q?ZH1KFsLD5iwY7sGMAgnI7bQmbBP/hGKALBBffmUx/hULCxJWEv1AlPxCtrjG?=
	=?us-ascii?Q?Ydyixcid7FyMd/yTtMTftzxfkseyvNG0sl+5tMCRkvIOzMiJ8gafIxqMwbXU?=
	=?us-ascii?Q?+RX2HUfmdgSXMBW32ctgi/0euQTEoJntLDNn5llQ5eLM2v4zUc4BGAmigZWk?=
	=?us-ascii?Q?f4LvsvWwKJYfoYJm8YvrRGwmjQdkzdhD2sUymacSKyPnktTZEZelpFpyJJzb?=
	=?us-ascii?Q?d6bwVIzUonCJcXJx+QcEKRXTB2SWs/hQreBQ7pfrZpayNMhtgqE/8yR+ZwkW?=
	=?us-ascii?Q?ByiHwYE1Iq1wUeXJXzbj2GEXVHWApilce9LiqQJbovdWHIX3tabH295vBx0S?=
	=?us-ascii?Q?nlg4XqWdKqi4tvznSSLPqu70B9rXZNDsuGJjp0Lb+tOp3+Ffe1TIgOUGYywM?=
	=?us-ascii?Q?gLnAN/XyLajavwCL0HUADN4nGtaWftEQKwwK4sLTzQ0otY65KuoxzJ36ZWz1?=
	=?us-ascii?Q?gKcEACtpybhmONTo4DdOJc3X+3RaS7R9CQLmjYS6srl3unwIRAYNidsCHbzP?=
	=?us-ascii?Q?+x7sJfaEQ3M9xj0sgdncKDqrvJpIWLnVJr1eCSjqA6MDKgLTdDMCR/sUBpr8?=
	=?us-ascii?Q?zxalTwFIEwNDXBKITogoxUdMBOGbZ1Tl6JolYRsj/R14tm0lspnAhyE2QxjA?=
	=?us-ascii?Q?Hd9Kj8sVDaGmodolBlsoTIoDepdwt6ceMVk/lsMvIN2svnfKxn/2a0Ntvl1B?=
	=?us-ascii?Q?Krj4MceAEQVb25Ct183UEGxCbDxc1qkQSAewSdIp4lPXrZvrSZ8M/jzCHqXU?=
	=?us-ascii?Q?dKbpLpip/SSwxXWlRD8BItdYPEsOo5hXXvGk9WLJhX0MelQrNPKo9/6cTPqI?=
	=?us-ascii?Q?KgMHHdPklAz4tfpkjwAKf8P?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	6:2XkMsLvYXMV6SpvPjtBq0oYV7MnyAOeTY1kXyQVyE+56OFOYUh3II/G97QG+IPh4eNZoQRPRfQXtY+83UJBAz4e95oeXNZ/oELfOwImbHH3/xMBiqMDZToqlWZlB2L40E9X/gKtXcbNPHqxQryAZVE88iBbshxk5wNSLXf4Daikjh8e2LHRQ2f4h5W8h08TrOVakNQrHO7g03S8tg1hVsZXxj9NXd4kKbRPvafw+V5PFjHtLC4uxOatZlWELTCPlBEh7RdKeMtouG4B3OY5EnjhoKjUguJFIVpbRcin3SR0=;
	5:MjM1OdTlCdNWaREFpPgyFZh6nsKuXm9ZQLkhNMQvX9MUyAV5tcc3Ved20RYLzbd1I+5QrqzjUyG20tuj9qO33MKWoY31jg6udnuzP1eDUzKFXpDkWSBR6rFhdJm+p26fLt97iNSLmYuZ93dHMSfkmQ==;
	24:sz8HZitNhaKY+iqjqdWintq9Gow3NtI0VuIFhncHrNAyPmKJbuMp4ReaMqul7JWQPzEFLzHuCtVWtPHKLnodFvJRReYMMnwQ8mvbBfZ8ORE=;
	7:CHhfj+qJ3Io4mEhUTecrn5gg/gLLczgr3/IQnONrwj8BfCWaPiPPPE5Z5ZBU87kEXpVC1CXwK/oXw/lbrSsW2WylaS5MO/7JGiJsKDCxY7BuCkeI/XzxJUKm5WxDYwCPBAtOOnQ2zO5UUJDwQiluwY0PqAXWgmx93gt8bwsh/hDBZEjOxKML4f4PwazESnLboUWCYqyuaRgQy2gjc/9syW6rvETwYgZ3x3NMEsqhXsUZ14W1Y+07wPc77hsNEZLu
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2016 22:22:04.0516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR04MB2061
Subject: [PATCH 1/2] python-salttesting: initial version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 22:22:10 -0000
Content-Type: text/plain

This package provides testing tools used by the salt project.

Signed-off-by: Collin Richards <collin.richards@ni.com>
Natinst-ReviewBoard-ID: 142234
---
 .../python/python-salttesting_2015.2.16.bb           | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb

diff --git a/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb b/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
new file mode 100644
index 0000000..78ad879
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-salttesting_2015.2.16.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Common testing tools used in the Salt Stack projects"
+HOMEPAGE = "https://github.com/saltstack/salt-testing"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
+SRCNAME = "salt-testing"
+
+SRC_URI = "https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz"
+SRC_URI[md5sum] = "8ca55a796e9ad7ba72bc143043753ccf"
+SRC_URI[sha256sum] = "0ef4be6a8a9b505ae1c328394dfad50493674af6100c7e2c220f374533d86edc"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+RDEPENDS_${PN} = "\
+                  python-mock \
+                  python-unittest \
+"
+
+inherit setuptools
+
-- 
1.9.1


