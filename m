Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B17ABE00B3D; Thu, 18 May 2017 01:09:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.49 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.49 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1ACFE00B3D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 May 2017 01:08:57 -0700 (PDT)
Received: by mail-oi0-f49.google.com with SMTP id w10so44889457oif.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 May 2017 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=g7qUAl9pdm5iZgnTzkBWq+oxOMbyYQhcc6CoXyclBv8=;
	b=SCNQiEvHgtWkcpO7biz+ANAEu37PwtLTten8yydh+y1sYlVTtY3DDuAzyUq9LJw+YO
	k40s7ZHzdr0IZOXcIEjm0/dbPzlnbxnMm1fDPFUR85XvBLKLEYMB0Nt3HPe9x3KVylH5
	EeSa3CxU/GtVdJaEMRkcoqLBF4D33qoJM6sO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=g7qUAl9pdm5iZgnTzkBWq+oxOMbyYQhcc6CoXyclBv8=;
	b=W0ZkTy3grV9CVwb59HDzaJr/MkVn954XhixxUefvEGd23yShopxnd3wWCqrx75mGVv
	jkoU1HHw/qrvlwjByCyjH+g9+gXTsPTs8YunAf8o6Hp7Fts2oDDPkbofRrQmwyp9NegX
	GvMopyQeydBaKiPUIf03rFElBxvxDrmXp+PVGZp+ta2ccTjqiy3DKxP9osTP4uVT75IY
	S/D7sCm4ESYaBm/YfOB81inxgcMg/zGfXgwUMzOb8tXoHCto64DqC5uivEpBzFYalzvF
	DmVMELMapSjw3NMEVp2rbW1VYVxgUmnmbxvWcGoTXebB+mT6G4/l5YDTLE2E8ePrBTQC
	Iaxg==
X-Gm-Message-State: AODbwcB/DpuLqes/NPEhKvqY/zarhOBNx6ThiBtfr+AcRYttVzHDC6AB
	Iccz6qTuoK8VWm1k1+XawUkYL1ptu5fk
X-Received: by 10.157.35.125 with SMTP id k58mr1625328otd.214.1495094936932;
	Thu, 18 May 2017 01:08:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Thu, 18 May 2017 01:08:56 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Thu, 18 May 2017 10:08:56 +0200
Message-ID: <CAFL6qn5QCWsUHag+2jWCg_imLQHE+FQVKC09iuP1=vY3DJQqcA@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-virtualization@yoctoproject.org, 
	meta-xilinx-request@yoctoproject.org, yocto@yoctoproject.org
Subject: Trying to build a xen-image-minimal with petalinux v2016.4
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
X-List-Received-Date: Thu, 18 May 2017 08:09:01 -0000
Content-Type: multipart/alternative; boundary="001a113dbeee9f1ea8054fc7ea8d"

--001a113dbeee9f1ea8054fc7ea8d
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to build a xen-image-minimal using petalinux v2016.4 following
the steps that are given in the ug1144 documentation. Anyway, when it
starts to execute the bitbake, it shows the next errors making the building
impossible:

generalelectric@mlan11214m117linux:/opt/xen_test$ petalinux-build -c
xen-image-minimal
[INFO] building xen-image-minimal
[INFO] sourcing bitbake
INFO: bitbake xen-image-minimal
Loading cache: 100% |############################################| ETA:
00:00:00
Loaded 2940 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time:
00:00:04
Parsing of 2327 .bb files complete (2291 cached, 36 parsed). 2942 targets,
195 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing RunQueue
NOTE: Checking sstate mirror object availability (for 320 objects)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Failed to fetch URL
git://github.com/Xilinx/xen.git;protocol=https, attempting MIRRORS if
available
WARNING: libglu-2_9.0.0-0 do_fetch: Failed to fetch URL
ftp://ftp.freedesktop.org/pub/mesa/glu/glu-9.0.0.tar.bz2, attempting
MIRRORS if available
ERROR: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Fetcher failure: Unable
to find revision b49f2bffb7fb64eb8e9835161afeaca642ad0bac in branch master
even from upstream
ERROR: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Function failed:
Fetcher failure for URL: 'git://github.com/Xilinx/xen.git;protocol=https'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/opt/xen_test/build/tmp/work/aarch64-xilinx-linux/xen/4.7.0+gitAUTOINC+b49f2bffb7-r0/temp/log.do_fetch.6468
ERROR: Task 345
(/opt/petalinux_2016.4/components/yocto/source/aarch64/layers/meta-petalinux/recipes-extended/xen/
xen_4.7.0.bb, do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2437 tasks of which 2421 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:

/opt/petalinux_2016.4/components/yocto/source/aarch64/layers/meta-petalinux/recipes-extended/xen/
xen_4.7.0.bb, do_fetch
Summary: There were 2 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
ERROR: Failed to build xen-image-minimal
webtalk failed:PetaLinux statistics:extra lines detected:notsent_nofile!
webtalk failed:Failed to get PetaLinux usage statistics!
generalelectric@mlan11214m117linux:/opt/xen_test$

Can anybody tell me how can I solve the problem?

Any answer will be welcome,
Best regards,
Pello

--001a113dbeee9f1ea8054fc7ea8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><br></div>I&#39;m trying to build a xen-im=
age-minimal using petalinux v2016.4 following the steps that are given in t=
he ug1144 documentation. Anyway, when it starts to execute the bitbake, it =
shows the next errors making the building impossible:<br><div><div><br>gene=
ralelectric@mlan11214m117linux:/opt/xen_test$ petalinux-build -c xen-image-=
minimal<br>[INFO] building xen-image-minimal<br>[INFO] sourcing bitbake<br>=
INFO: bitbake xen-image-minimal<br>Loading cache: 100% |###################=
#########################| ETA:=C2=A0 00:00:00<br>Loaded 2940 entries from =
dependency cache.<br>Parsing recipes: 100% |###############################=
###########| Time: 00:00:04<br>Parsing of 2327 .bb files complete (2291 cac=
hed, 36 parsed). 2942 targets, 195 skipped, 0 masked, 0 errors.<br>NOTE: Re=
solving any missing task queue dependencies<br>NOTE: Preparing RunQueue<br>=
NOTE: Checking sstate mirror object availability (for 320 objects)<br>NOTE:=
 Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>WARNING: xen=
-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Failed to fetch URL git://<a href=
=3D"http://github.com/Xilinx/xen.git;protocol=3Dhttps">github.com/Xilinx/xe=
n.git;protocol=3Dhttps</a>, attempting MIRRORS if available<br>WARNING: lib=
glu-2_9.0.0-0 do_fetch: Failed to fetch URL <a href=3D"ftp://ftp.freedeskto=
p.org/pub/mesa/glu/glu-9.0.0.tar.bz2">ftp://ftp.freedesktop.org/pub/mesa/gl=
u/glu-9.0.0.tar.bz2</a>, attempting MIRRORS if available<br>ERROR: xen-4.7.=
0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Fetcher failure: Unable to find revisi=
on b49f2bffb7fb64eb8e9835161afeaca642ad0bac in branch master even from upst=
ream<br>ERROR: xen-4.7.0+gitAUTOINC+b49f2bffb7-r0 do_fetch: Function failed=
: Fetcher failure for URL: &#39;git://<a href=3D"http://github.com/Xilinx/x=
en.git;protocol=3Dhttps">github.com/Xilinx/xen.git;protocol=3Dhttps</a>&#39=
;. Unable to fetch URL from any source.<br>ERROR: Logfile of failure stored=
 in: /opt/xen_test/build/tmp/work/aarch64-xilinx-linux/xen/4.7.0+gitAUTOINC=
+b49f2bffb7-r0/temp/log.do_fetch.6468<br>ERROR: Task 345 (/opt/petalinux_20=
16.4/components/yocto/source/aarch64/layers/meta-petalinux/recipes-extended=
/xen/<a href=3D"http://xen_4.7.0.bb">xen_4.7.0.bb</a>, do_fetch) failed wit=
h exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 2437 tasks of whi=
ch 2421 didn&#39;t need to be rerun and 1 failed.<br>Waiting for 0 running =
tasks to finish:<br><br>Summary: 1 task failed:<br>=C2=A0 /opt/petalinux_20=
16.4/components/yocto/source/aarch64/layers/meta-petalinux/recipes-extended=
/xen/<a href=3D"http://xen_4.7.0.bb">xen_4.7.0.bb</a>, do_fetch<br>Summary:=
 There were 2 WARNING messages shown.<br>Summary: There were 2 ERROR messag=
es shown, returning a non-zero exit code.<br>ERROR: Failed to build xen-ima=
ge-minimal<br>webtalk failed:PetaLinux statistics:extra lines detected:nots=
ent_nofile!<br>webtalk failed:Failed to get PetaLinux usage statistics!<br>=
generalelectric@mlan11214m117linux:/opt/xen_test$ <br><br></div><div>Can an=
ybody tell me how can I solve the problem?<br><br></div><div>Any answer wil=
l be welcome,<br></div><div>Best regards, <br></div><div>Pello<br></div><di=
v><br></div></div></div>

--001a113dbeee9f1ea8054fc7ea8d--
