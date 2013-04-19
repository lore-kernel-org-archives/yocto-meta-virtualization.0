Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20097E014DF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Apr 2013 05:38:36 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id er20so3521882lab.28
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Apr 2013 05:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=7Ts5R0y4IOVIUGVw+lNpqmr66ukHPQAZFtArqVEJmgY=;
	b=YFWRmxORUiX2XGT35TGmNPOHebyf0D0Bn06GoJ1GqQi9p/iAzLsXehBH5XJbBz3V65
	SOvUgPzqcScyANuW8WWNEk4uDfxv/JkOAbzwfYl24PvmrmcN7WdlgZOLxX31I+BYIqdN
	yu21pwLrcT/7svDMqx2m6FKTbdISETy5OuPdrZKCoMdZTh13ZqPUEY+1mmm/+jnAYcbt
	S8gWUQbzrLG0NE8t5uPC3YmPOlZL2/ZmPVNWepzUsiMXOon/f3SxQcgOCjOh2Qf12vxb
	4cb2xQkMyrtwJEvHWcMatAbHO8sULZWvP76xU+YZ1vUZTo7C+Ben36KrqoJeayaHclCx
	gh0g==
MIME-Version: 1.0
X-Received: by 10.112.147.170 with SMTP id tl10mr7860142lbb.100.1366375115371; 
	Fri, 19 Apr 2013 05:38:35 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Fri, 19 Apr 2013 05:38:35 -0700 (PDT)
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF985E61@IRSMSX101.ger.corp.intel.com>
References: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
	<1366297842-10846-2-git-send-email-mihai.prica@intel.com>
	<CADkTA4N87FqdCv2SS9va3xw-n4eEyxB0PqmWKhGQuLo_qs0m_Q@mail.gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF985E61@IRSMSX101.ger.corp.intel.com>
Date: Fri, 19 Apr 2013 08:38:35 -0400
Message-ID: <CADkTA4M+vCiCu+j18pxE1y11g1ORESBP-fYjX+VPJr6gTDvfxg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] libvirt: Changed python bindings install location
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
X-List-Received-Date: Fri, 19 Apr 2013 12:38:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 19, 2013 at 5:36 AM, Prica, Mihai <mihai.prica@intel.com> wrote:
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Thursday, April 18, 2013 6:47 PM
>> To: Prica, Mihai
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH 2/2] libvirt: Changed python bindings
>> install location
>>
>> On Thu, Apr 18, 2013 at 11:10 AM, Mihai Prica <mihai.prica@intel.com> wrote:
>> > The libvirt-python files were installed to dist-packages and this is
>> > not part of sys.path in yocto so they were not detected. Changed this
>> > to site-packages.
>>
>> By detected, you mean python couldn't import and use them at runtime on the
>> target ?
>
> Yes. I got an error when trying to load the module. From what I saw, In yocto all
> python packages are installed In site-packages.

thanks for the clarification. I tweaked the commit message and pushed this late
last night (for me) since I was pushing some other changes as well!

Cheers,

Bruce

>
> Mihai
>
>>
>> Bruce
>>
>> >
>> > Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> > ---
>> >  recipes-extended/libvirt/libvirt-python.inc        |    4 ++--
>> >  .../libvirt/libvirt/python_incdir.patch            |   15 +++++++++------
>> >  2 files changed, 11 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/recipes-extended/libvirt/libvirt-python.inc
>> > b/recipes-extended/libvirt/libvirt-python.inc
>> > index 49d15fb..297e90c 100644
>> > --- a/recipes-extended/libvirt/libvirt-python.inc
>> > +++ b/recipes-extended/libvirt/libvirt-python.inc
>> > @@ -10,5 +10,5 @@ RDEPENDS_${PN}-python += "python"
>> >  PACKAGECONFIG_${PN}-python[xen] = ",,,xen-python"
>> >
>> >  PACKAGES += "${PN}-python-dbg ${PN}-python"
>> > -FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/.debug/"
>> > -FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/dist-packages"
>> > +FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/site-
>> packages/.debug/"
>> > +FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/site-packages"
>> > diff --git a/recipes-extended/libvirt/libvirt/python_incdir.patch
>> > b/recipes-extended/libvirt/libvirt/python_incdir.patch
>> > index 6c77b09..5b78c13 100644
>> > --- a/recipes-extended/libvirt/libvirt/python_incdir.patch
>> > +++ b/recipes-extended/libvirt/libvirt/python_incdir.patch
>> > @@ -1,8 +1,8 @@
>> > -Index: libvirt-0.10.2/configure.ac
>> > +Index: libvirt-1.0.3/configure.ac
>> >
>> ==============================================================
>> =====
>> > ---- libvirt-0.10.2.orig/configure.ac   2012-10-29 11:59:27.091615491 +0200
>> > -+++ libvirt-0.10.2/configure.ac        2012-10-29 12:09:50.067603647 +0200
>> > -@@ -2397,6 +2397,11 @@
>> > +--- libvirt-1.0.3.orig/configure.ac
>> > ++++ libvirt-1.0.3/configure.ac
>> > +@@ -1878,6 +1878,11 @@ fi
>> >
>> >   PYTHON_VERSION=
>> >   PYTHON_INCLUDES=
>> > @@ -14,9 +14,12 @@ Index: libvirt-0.10.2/configure.ac
>> >   if test "$with_python" != "no" ; then
>> >       if test -x "$with_python/bin/python"
>> >       then
>> > -@@ -2422,29 +2427,30 @@
>> > -         AM_PATH_PYTHON(,, [:])
>> > +@@ -1901,31 +1906,32 @@ if test "$with_python" != "no" ; then
>> >
>> > +     if test "$with_python" = "yes" ; then
>> > +         AM_PATH_PYTHON(,, [:])
>> > +-
>> > ++        pyexecdir=$prefix/lib/python$PYTHON_VERSION/site-packages
>> >           if test "$PYTHON" != : ; then
>> >  -            PYTHON_CONFIG="$PYTHON-config"
>> >  -
>> > --
>> > 1.7.9.5
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
>> end"



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

