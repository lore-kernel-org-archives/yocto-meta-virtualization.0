Return-Path: <nicolai.weis@web.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 934F4E00903; Tue, 22 May 2018 04:44:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE,MIME_HTML_ONLY,RCVD_IN_DNSWL_LOW,TO_NO_BRKTS_HTML_ONLY
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nicolai.weis[at]web.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.227.17.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.7 MIME_HTML_ONLY BODY: Message only has text/html MIME parts
	*  1.3 TO_NO_BRKTS_HTML_ONLY To: lacks brackets and HTML only
X-Greylist: delayed 302 seconds by postgrey-1.32 at yocto-www;
	Tue, 22 May 2018 04:43:58 PDT
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E163E0086B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 May 2018 04:43:58 -0700 (PDT)
Received: from [212.121.145.5] ([212.121.145.5]) by
	3c-app-webde-bap43.server.lan (via HTTP);
	Tue, 22 May 2018 13:38:54 +0200
MIME-Version: 1.0
Message-ID: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
From: "Nicolai Weis" <nicolai.weis@web.de>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 May 2018 13:38:54 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:3cVO6JidFvfUSKlAKijC4BtmkljvEUCk8aRHDGFplRt
	jYwNY9HrYepdMiVfFhAis/FAlRZsvypgFuaFXAXFBlLZSvKI/V
	ng82BZmhvDEoQ+A4cSpniUKN6PqhJhz+vjCHZdp9xIpVE8F2b3
	GtbTErkByGXscTniPdVtD3NUFWWjTfo6wxY0B2HltZka31NWTx
	ZOCi8PN3VZTEijMJM/CwgMvU2rdE2KMVf9/MPzz3pKBAFEYLYI
	SUFCWVms5qWPC/9WL7merfVLhgAL+WV58/6A5wAkNXZJ5YTP6h FvxgLQ=
X-UI-Out-Filterresults: notjunk:1;V01:K0:yCsJomxP/00=:WXJ+rlWuYVfyRDy4X4VDVG
	C+b8YSPCT4Mmpj+LVYLHzp67M0tgflmm2u4B4Es55IjXfeANtaArOIDMTRo8tDXz4TOo2G2bt
	VlGryyco5ee1GuG4XfX30WpoG9SzYVDUJoA2/PfApFvDgBUl/EbagZNLG2yjASCMBgOH5UPzk
	G5MsjoDvlG7QjnHHkdbeEPCrfKPFt9oFLqQ3x6iDLX7IX4kUUU142F6dwhLjX2xrjKGC1cjuU
	VJ/hcnFPef92nmJZuVInvRMuV781qOe/XpuBOwlAKYq+FA/2y0Mv+wegp8MBU1+QTg9yGqSiW
	QoUX74YLssNuk5Jbj76/lklRighkEMchS5luLdHEN7h7SxV5BuN0wRjMXTUho6LIq0Huj2tK9
	/5eTyIoLmqBp/86bTykyBMxvIAEt19cmqudMPlCXRY+Ncs2ZUbX4JoL+fxnpqkeu+lNw6JQl9
	eNom3KFY5tohsPJk9X0u95yYyyjR6MSCQgz1kFyKGZ0/FrCu9CM0
Subject: Question Integration of LXC
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
X-List-Received-Date: Tue, 22 May 2018 11:44:00 -0000
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div>Hi all,<br/>
&nbsp;</div>

<div>In a project I want to integrate lxc-containers into the core-image-minimal for the minnowboard turbot. Therefore I&#39;m using the krogoth branch (have to use this branch) for the meta-layers.</div>

<div>As described in the README-file I add meta-virtualization, meta-oe, meta-networking, meta-filesystems and meta-python to the bblayers.conf. In the local.conf</div>

<div>I added at the end of the file BBFILE_PRIORITY_openembedded-l<wbr/>ayer = &quot;4&quot; and IMAGE_INSTALL_append = &quot; lxc&quot; (<a data-saferedirecturl="https://www.google.com/url?hl=de&amp;q=http://lxc_2.0.0.bb&amp;source=gmail&amp;ust=1527073581640000&amp;usg=AFQjCNGxhTm7ZDyNf5HOjSqtUDdjQKPRYw" href="http://lxc_2.0.0.bb" target="_blank">lxc_2.0.0.bb</a>).<br/>
&nbsp;</div>

<div>After the sucessful build I start the image and created with the busybox-template - should I use a different template? - a lxc-busybox container. I tried to start the container, but the error</div>

<div>&quot;1079 failed initializing cgroup support&quot; appeared. lxc-checkconfig showed cgroup-namespaces: required. I tried to solve this with adding cgroup-lite to IMAGE_INSTALL_append, but it</div>
didn&#39;t change anything (only let cgroup-namespaces disappear and showed Cgroup clone_children flag: enabled). I&#39;m using sysvinit instead of systemd.<br/>
<br/>
Do I have to change some configurations in the lxc-recipe? I would be very grateful if you can give me some information about it.<br/>
<br/>
Thanks<br/>
Nicolai</div></div></body></html>

