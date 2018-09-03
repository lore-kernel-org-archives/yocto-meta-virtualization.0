Return-Path: <sarayu@m5nv.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C049E0079D; Mon,  3 Sep 2018 11:06:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E33ABE00720
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Sep 2018 11:06:16 -0700 (PDT)
Received: by mail-oi0-f54.google.com with SMTP id l202-v6so2262588oig.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Sep 2018 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=m5nv-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=sEyXgjeCDhmiLNzcTIEW4EoyRGCRf43nmikZd+T/3mQ=;
	b=DMNAhGhFNAWs9ttWVEzhQs4642axtZYbC3vEQ9sDfNC4gcCP3fwY2yX9j5YxhEzz9N
	6ZdOePS66xja/uGcpTgK31AC/QaHJYZtpyo/fv86ZAE1uQOcXcxN0W6m7Nh5uw8sVKpc
	FiP655GMPIA6bSQzHGBb3TEz6w6fPhPIovHpWmGNCW1OgOgutPH7cZAzphhrRpLthrL0
	n4i2OR3f1SpjJOBVnPBWNbJXrAUdBYrlOFg+P9EvX0bZpaG2i0eISNs7hamEV5B29lua
	MSHCOezvwP+oRkm+L3qANwHA5dtYWTe1A9Ad7MW2nXERdT315R4M2I3hCkNjHBzu7c3Q
	+g8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sEyXgjeCDhmiLNzcTIEW4EoyRGCRf43nmikZd+T/3mQ=;
	b=smyU2lmM4zvnB8ItmyZJBo9jj3UWru8B8b/jvUT7jRF9bAwSh3CV2s719gJinMnozB
	HYnMJNfHyf3XkUAm8m9Gethr8+YofijHtwFh4ljuxJqwCwUqpdknOYOpon+nr0rW3IYw
	9jnIBzDKljSV1BaW9R1oALDfcz20e3tDuuHF5NcCaIz60RoqYVrGMZNG8hV8GmgMuajg
	RswwaHXk0XJMp5Ncwf4Zd0vTApGaorX6a21dKUmOUOIngLkQxKH1i52xUvZ6i/nxUdtk
	mn0Qh83i2/dE7O9jGALJ1sKSUo3ptbAIUGZhCmkvGKgkKk7mEJs7FvrjHj72oju4SGB2
	jtjw==
X-Gm-Message-State: APzg51DA8BkA9KVjqdbbHO+vknIl0srFUlML8MF3MehEnQHOeQnU8sA6
	smyOx/Cqsl/5MYDwAtt9fIyCrZ6RE8uy5PsqgCy5PkqC0cI=
X-Google-Smtp-Source: ANB0VdZ8gni4CZ1rLpH39QgEgbwtIXgGQ3RPEso+3LCnObTueHVRGO/rrCRHLyzjDRo/4Wgcf6Xj5qCp8aDdXKT4JMs=
X-Received: by 2002:aca:ac54:: with SMTP id
	v81-v6mr19943276oie.1.1535997975996; 
	Mon, 03 Sep 2018 11:06:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:6306:0:0:0:0:0 with HTTP;
	Mon, 3 Sep 2018 11:06:15 -0700 (PDT)
From: Sarayu Sivanandam <sarayu@m5nv.com>
Date: Mon, 3 Sep 2018 23:36:15 +0530
Message-ID: <CAG3Cyz98hmE_nhqd0+ZC93u9Ly87A-q_KQ97BRRpq7oom6vCMA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: LXC yocto - how to auto load and execute on QEMU
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
X-List-Received-Date: Mon, 03 Sep 2018 18:06:17 -0000
Content-Type: multipart/alternative; boundary="000000000000bc6c690574fb658e"

--000000000000bc6c690574fb658e
Content-Type: text/plain; charset="UTF-8"

Hi ,

I was able to see that the meta-virtualization layer has a recipe for LXC
and the same is included in my bblayers conf file and the lxc rpm is
generated . I was able to build the fsl-virt image and bring up my qemu as
well . But i want to now be able to test lxc on my qemu setup. I was able
to enable networking and transfer the rpm generated for lxc (
lxc-1.1.4-r0.aarch64.rpm ) to qemu and install the same . How ever when i
try to execute the lxc command it shows the below error .

lxc-config: error while loading shared libraries: libseccomp.so.0: cannot
open shared object file: No such file or directory

I understand that LXC needs certain libraries to execute but i would like
to know what is the default way to add it in my fsl-virt image instead of
having to manually copy all the dependencies.
I would like to bring up the qemu and then directly be able to install and
use the lxc.

Please let me know if this is feasible.

Thanks and Regards
Sarayu

--000000000000bc6c690574fb658e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 , <br></div><div><br></div><div>I was able to see that the meta-virtualiza=
tion layer has a recipe for LXC and the same is included in my bblayers con=
f file and the lxc rpm is generated . I was able to build the fsl-virt imag=
e and bring up my qemu as well . But i want to now be able to test lxc on m=
y qemu setup. I was able to enable networking and transfer the rpm generate=
d for lxc ( lxc-1.1.4-r0.aarch64.rpm ) to qemu and install the same . How e=
ver when i try to execute the lxc command it shows the below error . <br></=
div><div><br></div><div>lxc-config: error while loading shared libraries: l=
ibseccomp.so.0: cannot open shared object file: No such file or directory</=
div><div><br></div><div>I understand that LXC needs certain libraries to ex=
ecute but i would like to know what is the default way to add it in my fsl-=
virt image instead of having to manually copy all the dependencies.</div><d=
iv>I would like to bring up the qemu and then directly be able to install a=
nd use the lxc. <br></div><div><br></div><div>Please let me know if this is=
 feasible.</div><div><br></div><div>Thanks and Regards</div><div>Sarayu<br>=
</div></div></div></div></div>

--000000000000bc6c690574fb658e--
