Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF1C2E01431
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 21:16:52 -0700 (PDT)
Received: by mail-ee0-f50.google.com with SMTP id d51so2782489eek.23
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 21:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=6dHtY6q5CMitC/p0Yyq8fu8JA4RISF/+hy4Gqtg7fP0=;
	b=OTlEZyoWd7mKk1FaJMreHskJ+iEhePYeoV/L7zCtDI8rQZ1Ea5yiSW+Pc3YUW2mA21
	fNSrPgTDQYuEeOSuDzMSzpHoSMfKWDT5hnyiXzvtSwWMPjJescha1kPLIxViNb+id6t1
	nVf4WFDx+4TygsL2WL5lPpj36m4YO3i5XvDnWIcKSKwnhmsxXtzd0ZZqg07xmF1ftwYn
	nbP3dYOa21zk/MmzQboVFpIY8cM5jqm4h9pC2HXKRIbA0RCZtrDLzUYjf/8oexUaXClU
	hFppJJDSo1EJmEwGP5YZPEZYgZheiDVUgfL7ewLIXQgPjxCKdCfokqUlAOySPQO4PUgd
	W9qQ==
X-Received: by 10.15.98.203 with SMTP id bj51mr19847931eeb.22.1376194611257;
	Sat, 10 Aug 2013 21:16:51 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id f49sm38830324eec.7.2013.08.10.21.16.49
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 10 Aug 2013 21:16:50 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Sun, 11 Aug 2013 00:16:56 -0400
Message-Id: <1376194618-25627-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] libvirt: uprev and PACKAGECONFIG fixups
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
X-List-Received-Date: Sun, 11 Aug 2013 04:16:57 -0000

These patches update libvirt to the July 1.1.1 release, as well as fix
some build issues I found along the way.

As for the release update, standard libvirt/libvirtd tests were run, 
and the ability to launch, query and control a guest were confirmed.

Along with the 1.1.1 update, I've included a patch that fixes the 
virNetTLSInit unresolved symbol error that has been reported several
times in the past. As the patch states, this fix isn't perfect, since
there must be some libtool magic that could be used to make the 
link change I'm showing be automatically applied .. but I couldn't make
it work, and instead have a blunter approach. If anyone wants to tackle
a better fix, patches are welcome.

I'm keeping 1.0.3 around for a short while, just to ensure that 1.1.1
is fully functional.

As it turns out the virNetTLSInit link error is triggered by a bad
combination of PACKAGECONFIG values (where everything but python is
disabled for libvirt). It just so happens that this is the default
since the libvirt-python.inc file sets PACKAGECONFIG, which inhibits
the defaults you see in the libvirt recipe from ever triggering. 
Everyone must be building with their own options, in their own layers
if this is working for people.

By pulling the python PACKAGECONFIG back into the main recipe and 
ensuring that PACKAGECONFIG_${PN} is used in the python.inc, we get
the default options building again.

I've confirmed that things build here, but YMMV and error reports
and patches are welcomed.

If no one objects, I'll push these patches on Monday.

Cheers,

Bruce


