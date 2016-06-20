Return-Path: <collin.richards@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B83BFE00951; Mon, 20 Jun 2016 15:22:10 -0700 (PDT)
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
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0108.outbound.protection.outlook.com [157.56.111.108])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89169E00927
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jun 2016 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PA9hE+KTDvd3qJEbEH29RQdUbMaew08fBGK3D5RvUFI=;
	b=a06vAQoI8vVjNFS7vO7JH7WT1SN5OMBxam9ke3tlryeR/R+aogoqzu8qbyVIS0iSiYk747lsjSUyaY4mZiYzpcI7fRPikRsJJAu4PfWV/UpwYI8azxtElTvO3EH4it8L2uAgFps3UTRuYOkcIc8loh43YfdsGbcNTlAsgrwYy7k=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=collin.richards@ni.com; 
Received: from titan.amer.corp.natinst.com (130.164.62.220) by
	SN1PR04MB2061.namprd04.prod.outlook.com (10.169.124.11) with Microsoft
	SMTP Server (TLS) id 15.1.523.12; Mon, 20 Jun 2016 22:22:04 +0000
From: Collin Richards <collin.richards@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 20 Jun 2016 17:21:56 -0500
Message-ID: <1466461316-23791-2-git-send-email-collin.richards@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466461316-23791-1-git-send-email-collin.richards@ni.com>
References: <1466461316-23791-1-git-send-email-collin.richards@ni.com>
MIME-Version: 1.0
X-Originating-IP: [130.164.62.220]
X-ClientProxiedBy: BY1PR15CA0020.namprd15.prod.outlook.com (10.162.17.158) To
	SN1PR04MB2061.namprd04.prod.outlook.com (10.169.124.11)
X-MS-Office365-Filtering-Correlation-Id: f5a3980e-c1b9-46ab-6784-08d399594f5a
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	2:D2cg86b5VyN3InZ7zO1I/8wZRcC2M3iu0l2u2VpICH7F3d4fm8tHPoo/Bmg58uhyc8UyArABTbEKObMkvnHkfuKr/+jBolQ9of/TC0uGvleBH7imK+k/usPUG9Lll4QXYK8/EuDwh1BHsLi1txIeZnvucteHrtgimYtCyGlAmMUz04+zoJuw0J3Eido2+18F;
	3:xI43QUH1UDeQBeOZqrC4yMuPTIpLxC1urQTSx7gWNogGXmd6sLcGaIyAUziUVAWmvuJZG6ImaHdWDqn+9w5FCbEYxn9/xhv0519CIBgpOeBFj4tTv0aRc7cvkEMwPPzH
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR04MB2061;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	25:GW7QwjeNL0X9DIAyvFUSFXq3V7w2Va5GlHqq89NaFM+A7IdLXQKrH7Wsvj1sQpnOSPttv9avs/GtGcZbtSf4F4Z0YT5OWJn7Tc4E0vZOAs2jhwqgyi12jSHdYJTzpN+KZsqAzfMjevrB3VVuJnPjD5vvFOfBoM+IklcK13P/zI2lwjzR1f1k71NKY75pFsyK0AMKJ9yMoGn0p/b+cGIn+SkA60NC6LKvhngB1j+lIgBtP3C7gYAUrEGMyt9gag5WX689VusttrhHe4eD/VLA+S+gonePFRcrl8fnbu8Y6Zhz1r4hP6JzF8yq82aeQ0nx0nJ9eHh5XwvqTlf0Y4Awu1KbhkDaeQIzOnt98Uo/0FvBRE1fTI1kFNAOOTt7pugBPnW2wuQL6u7OnXlPyi5vr+f3w9Q+3yPkeTYqS6lZMeiRATrQ6ZT7p3uJuYBpApUX/M0rRJp+0wjvIHhprD8vjx5Xd07Z5PR8cPUv1OsvhkuYcPa9Xyuc30oNzp9L0Jr4CFIBap5Avd89EYjdAZOytYV1NH+cj+zIZ/LSySRe9oxck7NlWzCwGtcL4LY9F5yeM8eeJx1NVqBh6dvZEPI5p9rkCWu/svAu9nneusG+x1VKnGmTCdvzGjZRXdX4xxM1WSKR9Ri1CoQybjItbDmniqYGRsaOiQGeIbA6Kq1XnijxOO8Vc54HbKPD6kSQ4xoX9jCsi0vBhuZkcj2yqNrI304djyo16ptjFVMJpiFxbh+VlM7mZIYBNUMvSL6hpW4TRArocwaBCbpRAsbL74hlEw==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	20:gPfhMyZl3T94lrpm1KCXqJC7EZPs3HpJ8pGuXzL4NhWlPOo9zbWpxpazGi5M+xsPPC0cvxtNBg0PTc1XiY+10qmEcuBA6gdWuFDBJrSsnk7IzLHmvdI/0U0U4e0xybDcvmPRnogDvK5z1//69hZpog/peCuIVFMoZRj1Xud+hOgkYMQg3UHqh7mmlspHJHQOs40pSZQ0Lv33zCnqod7E7MxuaP/G1LJykrrpZ95O9tuvyRKbEq0+jNF+jdfOFQzjuSuKIzondTouuexcdz6EKtJ29fIksUYX2uBm4skrYoueI4YhXPUB/ta8s6c7/xYqzOg//TLg0e2OuLa8bj06jm2F0kcug8dyHtocWBPdgRRz72ce9XkYQAWQ6XdrynbyA0fBB/g0fBkN3VT+NvvDHH3bJJT8yduKcnc6O4X1m9wOqYtlAJBbS5OafRjGfkuIQnrARdWwxjXBBgSGYjHtwgAW2kDlTykXEOAZim9FBDO5fuwa1G9/tRnUmJyQ6EFR+r/BXMB5VXrI/qM6Ntk48nxURUMPiiletHxzXHVOnhMI1OAusUFG+iYZKTrRIUeJWGL1ek3dIz58L8+vvYdnbAY24F3g/WOAdDE3L+dr4+g=
X-Microsoft-Antispam-PRVS: <SN1PR04MB20619F3974507A0737852335832A0@SN1PR04MB2061.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR04MB2061; BCL:0; PCL:0; RULEID:; SRVR:SN1PR04MB2061; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	4:8uhr33M8wLiIJDuelUCPXUaIFhZUAZntL1z6d3wDAY7eMQCzB6Y7fMzYZecyDQIuCGw6PwKBsFKwNP4bvUo09PQ3CT0qeLCs1jGeA2pLw52dY5BiFWHuWVOctr/VIIL++PrvNZkrkJwOtadP7/GS/RI97qK1buskvsh20UOk7Yw1YHLS/P0stNQDOuMnWVReet7Udmh1eieWvl7iIJl/b9vL99kizqTU1cUf1SyKsx5q4csqjh4crIIIalTVgR2rH7p7e+O+rz2i5A6fc1xH67+onIEzV9TD83Uz5yUqauSEpoKSgreMHTjVQkgC2GN2PSYavDSmtzZBJzIz6LT+fyrwTQTi2SnIpg6lZaMoVzCt221PAzlqUTi8ezKiBOkGTyNUz4VUAVdkIm4tT4Y0EcdUVJiCUqKqyQLhyXf63Yo=
X-Forefront-PRVS: 09796A1B83
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(189002)(199003)(2906002)(2950100001)(77096005)(105586002)(8676002)(81166006)(19580395003)(81156014)(4326007)(3846002)(68736007)(229853001)(106356001)(50466002)(19580405001)(2351001)(110136002)(48376002)(42186005)(50986999)(76176999)(97736004)(92566002)(66066001)(586003)(5003940100001)(50226002)(36756003)(33646002)(86362001)(47776003)(189998001)(450100001)(7846002)(7736002)(6116002)(101416001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR04MB2061;
	H:titan.amer.corp.natinst.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR04MB2061;
	23:q9zefC3gJpUVqdbcBWnUqZmE/TvtBG9uf1na8Uvx1?=
	=?us-ascii?Q?Y9vHKK8F9FoqxFjfYUiU2qzWDLm1lH+kDYvRGQJUPEbYRl/s28NWEb3LEMU7?=
	=?us-ascii?Q?b+qODaC1LNSNbcoR7Hjt+zkL6o8a+Glp+/77T2YD3TeUKtKXsC4i2FWyvmik?=
	=?us-ascii?Q?uHf4A/8V3QMN74TJf5/JGfRUALtu6upJzBFMT/dvAwwUlSWeoJv7QKvLRrrX?=
	=?us-ascii?Q?kx9PUfmS7lE9ElmDPYKlBXOT619OGiOMWycAmvSS7ylK3cor47FMr5Z/GdSX?=
	=?us-ascii?Q?0pA8qjPvdsR+7v7E9CXa7qRcxBYpjvOp6B+Gmda3y0rNyOKBHFMGhaTVE+a9?=
	=?us-ascii?Q?0gK+0c0o7U6N1+4Zbj0LLhwi8CzlPvADTrv91m17aIvUkEFdCgljJF+yDgLZ?=
	=?us-ascii?Q?ic42jSOMFf6d3quTfwENeNws1j+sskA85sLf4DI2wLQMWEiD4/NxC4zTv89D?=
	=?us-ascii?Q?4mobJFEaROa0GvFx1Fi3UEPi9DNMzwEEgjhAziU0pvJNLQL54xWyi684ygsw?=
	=?us-ascii?Q?Tn4E445wIVeyCFbCgd79LPogG0UBa+IvxcsBO6isz5on6ZiRk/nouccMIY8j?=
	=?us-ascii?Q?pNoOwIXErY4gmy2VyA8QDErEj+gMIB3W9bi+ar99kVYW/p6xNNCYiiUQ3AlB?=
	=?us-ascii?Q?RuARXWTfGO4vd+jFOhQ3kjN5JfdxgcxXTYMlxqIm61vtHw+eV4iP7h/TDI/c?=
	=?us-ascii?Q?HJtWC755x70NKfBYeMcJeogaTjCI1SDhLWdCDpfien673mswjaRydWQtIBr3?=
	=?us-ascii?Q?w7OyIi0eC1LXL77foHkF4VfthU/sN8Bc6uDBxGeTClwetq02JBZZ48kJukGu?=
	=?us-ascii?Q?ue6MyrgPr05NVG9q+PNBLQnvGhFoqJTQcDmldQF4f9qad6r9K3/Hxv9fCTBH?=
	=?us-ascii?Q?+u3B4dzxasnqanLYiD4P70pem5DIzKyNNdp6mM0+D4SZmCghoRstUJ9XKvzo?=
	=?us-ascii?Q?IqDPjo05Z5fh87Yn7pu93G5HmPhU2QAjh8RalJNtHvu/C9eHksoM/8o7N1eV?=
	=?us-ascii?Q?+GHE+fA7aWJBi8HyCuqxUJKml4PIxS8GD0rGGkMtmjWng=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR04MB2061;
	6:a/m7S8bnnQnugHa8BL/vjFvBGsTyfWJpJzuGidnZb8Qx0y38aCJRb5IP7NMl+WLMO/Y0A+Nsulp9RQ4I9PEo7R055N0li5xCy0fvxagk/LHyU6uF8ZaPi/P8920fNHe3+0pw/QQrMG5r026RzV6/v5qQzuOCcACg3lqhBxtDHXokCYF1KXy2Z6aCMIfigb8J1hJfyo8QB4En05GReVpYwiqSOx56LwLwNAfo2NcpyRQpP0hlSaRHuQculqVgISPuKgnjk65KdZr8J1Vwi7rNa++ONQrM/EgnsWpUHfau+3E=;
	5:FkH9Qu9w/Gp7d7BYog8rpDlryiMmsJgrq4r2bYRW0jDJ9palaPU2xmiTZCs9BY5Dv73Yvdovo9DiySA2Uul2wtsmz5amhsMCP0ZbjsIozFhhQcEKAjy2wX1ecqvG4bJdsmzFRwKvqPTfidIolPhm9g==;
	24:K9kuAq+g9BRCvK5A8Uwaw8CimKEniP2tkU3pxWX43aqFDsZnbLzuH+SKj3oqKcvpK96Wluy/7ovg+cH61+ABAsXGt1YdKR6n6K2yywA6x8o=;
	7:6CWlsJ4pCHOv8TPlHv8pxPsMCo/WoRqcL0oJy9E6oGp3a5dC2WTBQl/lHYN9NTt7rYPgBfC6MMg75i8TY4jJi6luhhjeStcu1i7bsI807lR+hcMkr+0D4ULF6cT68gYMKV0ctKsa0hzhlg4pr567nL5HgCSl0laMdFO0oD7VKWPhT6GpfLDGtHWVQHeIU5w6KrTaxbHXXqdKy2AObOtWx6Yu/AAA1kvGRDzQKyqQrqcv84Kun6WySO5T0wIX3Cd/
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2016 22:22:04.8533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR04MB2061
Subject: [PATCH 2/2] salt: Add the salt test suite
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

* Add salt-tests - package for salt test suite

The salt test suite can be run from:
/usr/lib/python2.7/site-packages/salt-tests/tests/runtests.py

Signed-off-by: Collin Richards <collin.richards@ni.com>
Natinst-ReviewBoard-ID: 142234
---
 meta-openstack/recipes-support/salt/salt_2016.3.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
index f3bbdba..a99296a 100644
--- a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
@@ -35,7 +35,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools update-rc.d
 
+# Note ${PN}-tests must be before ${PN}-common in the PACKAGES variable
+# in order for ${PN}-tests to own the correct FILES.
 PACKAGES += "\
+           ${PN}-tests \
            ${PN}-api \
            ${PN}-cloud \
            ${PN}-common \
@@ -62,6 +65,9 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/cloud ${D}${sysconfdir}/${PN}/cloud
         install -m 0644 ${WORKDIR}/roster ${D}${sysconfdir}/${PN}/roster
         install -d ${D}${sysconfdir}/${PN}/cloud.conf.d ${D}${sysconfdir}/${PN}/cloud.profiles.d ${D}${sysconfdir}/${PN}/cloud.providers.d
+
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}-tests/
+        cp -r ${S}/tests/ ${D}${PYTHON_SITEPACKAGES_DIR}/${PN}-tests/
 }
 
 ALLOW_EMPTY_${PN} = "1"
@@ -147,4 +153,9 @@ RSUGGESTS_${PN}-cloud = "python-netaddr python-botocore"
 CONFFILES_${PN}-cloud = "${sysconfdir}/${PN}/cloud"
 FILES_${PN}-cloud = "${bindir}/${PN}-cloud ${sysconfdir}/${PN}/cloud.conf.d/ ${sysconfdir}/${PN}/cloud.profiles.d/ ${sysconfdir}/${PN}/cloud.providers.d/ ${CONFFILES_${PN}-cloud}"
 
+SUMMARY_${PN}-tests = "salt stack test suite"
+DESCRIPTION_${PN}-tests ="${DESCRIPTION_COMMON} This particular package provides the salt unit test suite."
+RDEPENDS_${PN}-tests = "${PN}-common python-salttesting python-tests python-image bash"
+FILES_${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/salt-tests/tests/"
+
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/${PN}-common"
-- 
1.9.1


