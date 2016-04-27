Return-Path: <brian.mcgillion@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85B90E00D8E; Wed, 27 Apr 2016 05:32:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,WEIRD_QUOTING autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * 0.0 WEIRD_QUOTING BODY: Weird repeated double-quotation
	marks
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEA94E00D87
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Apr 2016 05:32:45 -0700 (PDT)
Received: by mail-oi0-f50.google.com with SMTP id k142so47026813oib.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Apr 2016 05:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to;
	bh=tC+3erCn3Xu6rQk0d6fZpnmLjf7fr/AtJqo/k3+YHe4=;
	b=u1hN4kR3J4t2pFFHI+Hi0serpfq6Y2dhr/+cho20IHnGuHYwOkmOz+nXKaFhg4BJ4C
	QJaj/1KrnWXc1iHqbPm40sH5rKxuIYRGUWjtNa2SP+LOJ6ckPJQKWTCkv5xTJRtvPexc
	LAFrpdCRTMpw1QltDyKVlZ0HfK76P+XVk6clw0OfXHYgWyJdzoAn2LpqSL08B2OYJX7A
	gL2TFvObfI48hZWEVeLhcaDzWUepchggdBcVLvGn+awA0IjAVSshl3TKShmpOnZdW+go
	rmFzqAtNOjNjGF/dyTotRsPQG5sw4vekHLyBbFpU6E60SaGOQN/cQx6081PiI7uq55v0
	nAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=tC+3erCn3Xu6rQk0d6fZpnmLjf7fr/AtJqo/k3+YHe4=;
	b=Z34pFV6nCA4l6ysx5qSDJxEeWZ0DLpuzJ2kJ5V0ZDxYeK8MOnYu6rb0tFDs5CqmdR1
	oROTXKHTqED+DBU/UJnpG9HCc2vY/PlPKvJPS1sVq8hckZoqa4nsU+Z9FhA7m726/t6k
	LB1yVjsD/EVkKOJklMbJZgwi0R61VSgDKa8Ywm4pqGJxmR65JcrU+ijTOcLj/DRPiDuj
	PMBWrV4e1SKtLqRdY2eSV1k/5sfbyfnsslGY3dcYSFfiOyscfmEpPGFeEzbSQqY9yRsU
	8d1/y26h6UT7fhsGjQlUXu7G1kshg105jAoHvuiPlR/RnJYvinWyXs8ypz83OCVP5noT
	46rg==
X-Gm-Message-State: AOPr4FXWPyFFhhiLepNjOToHvZYPOuXEqPZ9ZC/DjhTfObXo7xaYLSwvbrau6R4odIjGCjoDUc8ZRWdhdb7sypw+
MIME-Version: 1.0
X-Received: by 10.202.75.136 with SMTP id y130mr2978588oia.32.1461760364827;
	Wed, 27 Apr 2016 05:32:44 -0700 (PDT)
Received: by 10.157.55.133 with HTTP; Wed, 27 Apr 2016 05:32:44 -0700 (PDT)
Date: Wed, 27 Apr 2016 15:32:44 +0300
Message-ID: <CADqm_STregrFb_Tc3ecznTcAQSt36n8NoKv1CTC9VvzcR-STbw@mail.gmail.com>
From: "McGillion, Brian" <brian.mcgillion@intel.com>
To: meta-virtualization@yoctoproject.org
Subject: failure to build xen minimal
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
X-List-Received-Date: Wed, 27 Apr 2016 12:32:48 -0000
Content-Type: multipart/alternative; boundary=001a11c1857e4af29d0531769b9b

--001a11c1857e4af29d0531769b9b
Content-Type: text/plain; charset=UTF-8

Hi,

Using the master branch, I am getting the following errors when trying to
build the xen-image-minimal.

"""""""""""""""
ERROR: xen-image-minimal-1.0-r0 do_bootimg: Function failed:
build_syslinux_cfg (log file is located at
/storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_bootimg.13471)
ERROR: Logfile of failure stored in:
/storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_bootimg.13471
Log data follows:
| DEBUG: Executing python function do_bootimg
| DEBUG: Executing shell function build_syslinux_cfg
|
/storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/temp/run.build_syslinux_cfg.13471:
104:
/storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/temp/run.build_syslinux_cfg.13471:
cannot create : Directory nonexistent
| WARNING: exit code 2 from a shell command.
| DEBUG: Python function do_bootimg finished
| ERROR: Function failed: build_syslinux_cfg (log file is located at
/storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_bootimg.13471)
ERROR: Task 16
(/storage/yocto/poky/meta-virtualization/recipes-extended/images/
xen-image-minimal.bb, do_bootimg) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3455 tasks of which 3454 didn't need to be
rerun and 1 failed.
No currently running tasks (3160 of 3457)

Summary: 1 task failed:
  /storage/yocto/poky/meta-virtualization/recipes-extended/images/
xen-image-minimal.bb, do_bootimg
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
""""""""""""""""""""

This is related to:

build_syslinux_cfg() {
        echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
        echo "DEFAULT boot" >> ${SYSLINUXCFG}
        echo "TIMEOUT 10" >> ${SYSLINUXCFG}
        echo "PROMPT 1" >> ${SYSLINUXCFG}
        echo "LABEL boot" >> ${SYSLINUXCFG}
        echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
        echo "  APPEND /xen.gz loglvl=all guest_loglvl=all console=com1,vga
com1=115200,8n1 --- /vmlinuz ramdisk_size=32768 root=/dev/ram0 rw
console=hvc0 earlyprintk=xen console=tty0 panic=10 LABEL=boot debugshell=5
--- /initrd" >> ${SYSLINUXCFG}
}

How can I trace where SYSLINUXCFG is being set and does anyone know why
this might be failing?

Thanks,
Brian

--001a11c1857e4af29d0531769b9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Using the master branch, I am getti=
ng the following errors when trying to build the xen-image-minimal.</div><d=
iv><br></div><div>&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&qu=
ot;&quot;&quot;&quot;&quot;&quot;</div><div><div>ERROR: xen-image-minimal-1=
.0-r0 do_bootimg: Function failed: build_syslinux_cfg (log file is located =
at /storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-=
minimal/1.0-r0/temp/log.do_bootimg.13471)</div><div>ERROR: Logfile of failu=
re stored in: /storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux=
/xen-image-minimal/1.0-r0/temp/log.do_bootimg.13471</div><div>Log data foll=
ows:</div><div>| DEBUG: Executing python function do_bootimg</div><div>| DE=
BUG: Executing shell function build_syslinux_cfg</div><div>| /storage/yocto=
/poky/build/tmp/work/intel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/te=
mp/run.build_syslinux_cfg.13471: 104: /storage/yocto/poky/build/tmp/work/in=
tel_corei7_64-poky-linux/xen-image-minimal/1.0-r0/temp/run.build_syslinux_c=
fg.13471: cannot create : Directory nonexistent</div><div>| WARNING: exit c=
ode 2 from a shell command.</div><div>| DEBUG: Python function do_bootimg f=
inished</div><div>| ERROR: Function failed: build_syslinux_cfg (log file is=
 located at /storage/yocto/poky/build/tmp/work/intel_corei7_64-poky-linux/x=
en-image-minimal/1.0-r0/temp/log.do_bootimg.13471)</div><div>ERROR: Task 16=
 (/storage/yocto/poky/meta-virtualization/recipes-extended/images/<a href=
=3D"http://xen-image-minimal.bb">xen-image-minimal.bb</a>, do_bootimg) fail=
ed with exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempted 3455=
 tasks of which 3454 didn&#39;t need to be rerun and 1 failed.</div><div>No=
 currently running tasks (3160 of 3457)</div><div><br></div><div>Summary: 1=
 task failed:</div><div>=C2=A0 /storage/yocto/poky/meta-virtualization/reci=
pes-extended/images/<a href=3D"http://xen-image-minimal.bb">xen-image-minim=
al.bb</a>, do_bootimg</div><div>Summary: There was 1 ERROR message shown, r=
eturning a non-zero exit code.</div></div><div>&quot;&quot;&quot;&quot;&quo=
t;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&=
quot;&quot;&quot;</div><div><br></div><div>This is related to:</div><div><b=
r></div><div><div>build_syslinux_cfg() {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 echo &quot;ALLOWOPTIONS 1&quot; &gt; ${SYSLINUXCFG}</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 echo &quot;DEFAULT boot&quot; &gt;&gt; ${SYSLINUXCFG}<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;TIMEOUT 10&quot; &gt;&gt; =
${SYSLINUXCFG}</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PROMPT 1&qu=
ot; &gt;&gt; ${SYSLINUXCFG}</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quo=
t;LABEL boot&quot; &gt;&gt; ${SYSLINUXCFG}</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo &quot; =C2=A0KERNEL mboot.c32&quot; &gt;&gt; ${SYSLINUXCFG}</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; =C2=A0APPEND /xen.gz loglvl=
=3Dall guest_loglvl=3Dall console=3Dcom1,vga com1=3D115200,8n1 --- /vmlinuz=
 ramdisk_size=3D32768 root=3D/dev/ram0 rw console=3Dhvc0 earlyprintk=3Dxen =
console=3Dtty0 panic=3D10 LABEL=3Dboot debugshell=3D5 --- /initrd&quot; &gt=
;&gt; ${SYSLINUXCFG}</div><div>}</div></div><div><br></div><div>How can I t=
race where=C2=A0SYSLINUXCFG is being set and does anyone know why this migh=
t be failing?</div><div><br></div><div>Thanks,</div><div>Brian</div></div>

--001a11c1857e4af29d0531769b9b--
