Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D235E00DAC; Mon,  6 Jun 2016 00:00:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41C19E00D8C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jun 2016 00:00:31 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5670RP2028013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Jun 2016 00:00:27 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 6 Jun 2016 00:00:26 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20160601083543.23700-1-kai.kang@windriver.com>
	<5754E2FF.4050308@windriver.com>
	<CADkTA4NwHRu-fHYh-mDLsHXuAXAS3LrPyO20NZP-kT3hX8GiAQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57551F88.9080102@windriver.com>
Date: Mon, 6 Jun 2016 15:00:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NwHRu-fHYh-mDLsHXuAXAS3LrPyO20NZP-kT3hX8GiAQ@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH] criu: fix build-deps qa warning
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
X-List-Received-Date: Mon, 06 Jun 2016 07:00:35 -0000
Content-Type: multipart/alternative;
	boundary="------------020208000205050704050900"

--------------020208000205050704050900
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年06月06日 14:46, Bruce Ashfield wrote:
>
>
> On Sun, Jun 5, 2016 at 10:42 PM, Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     On 2016年06月01日 16:35, kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com> wrote:
>
>         From: Kai Kang <kai.kang@windriver.com
>         <mailto:kai.kang@windriver.com>>
>
>         It shows warning when build crius if libselinux has been built
>         already:
>
>            WARNING: QA Issue: criu rdepends on libselinux, but it
>         isn't a build dependency? [build-deps]
>
>         Add a patch to disable selinux support when 'selinux' is not
>         in PACKAGECONF.
>
>         And update indentation at same time.
>
>
>     Hi Bruce,
>
>     Any comment on this commit, please?
>
>
>
> I just hadn't gotten to it yet.
>
> This looks fine to me, and is now merged to master.

Thanks.

--Kai

>
> Bruce
>
>
>
>     Regards,
>     Kai
>
>
>
>         Signed-off-by: Kai Kang <kai.kang@windriver.com
>         <mailto:kai.kang@windriver.com>>
>         ---
>           recipes-containers/criu/criu_git.bb <http://criu_git.bb>   
>                     | 12 ++++++----
>           .../criu/files/disable-selinux.patch  | 26
>         ++++++++++++++++++++++
>           2 files changed, 34 insertions(+), 4 deletions(-)
>           create mode 100644
>         recipes-containers/criu/files/disable-selinux.patch
>
>         diff --git a/recipes-containers/criu/criu_git.bb
>         <http://criu_git.bb> b/recipes-containers/criu/criu_git.bb
>         <http://criu_git.bb>
>         index 816c806..c8be78f 100644
>         --- a/recipes-containers/criu/criu_git.bb <http://criu_git.bb>
>         +++ b/recipes-containers/criu/criu_git.bb <http://criu_git.bb>
>         @@ -18,10 +18,11 @@ PR = "r0"
>           PV = "1.6+git${SRCPV}"
>             SRC_URI = "git://github.com/xemul/criu.git;protocol=git
>         <http://github.com/xemul/criu.git;protocol=git> \
>         - file://0001-criu-Fix-toolchain-hardcode.patch \
>         - file://0002-criu-Skip-documentation-install.patch \
>         -  file://0001-criu-Change-libraries-install-directory.patch \
>         -         "
>         +  file://0001-criu-Fix-toolchain-hardcode.patch \
>         +  file://0002-criu-Skip-documentation-install.patch \
>         +  file://0001-criu-Change-libraries-install-directory.patch \
>         +           ${@bb.utils.contains('PACKAGECONFIG', 'selinux',
>         '', 'file://disable-selinux.patch', d)} \
>         +          "
>             COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>           @@ -51,6 +52,9 @@ export HOST_SYS
>             inherit setuptools
>           +PACKAGECONFIG ??= ""
>         +PACKAGECONFIG[selinux] = ",,libselinux"
>         +
>           do_compile_prepend() {
>               rm -rf ${S}/protobuf/google/protobuf/descriptor.proto
>               ln -s
>         ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto
>         ${S}/protobuf/google/protobuf/descriptor.proto
>         diff --git
>         a/recipes-containers/criu/files/disable-selinux.patch
>         b/recipes-containers/criu/files/disable-selinux.patch
>         new file mode 100644
>         index 0000000..da881dd
>         --- /dev/null
>         +++ b/recipes-containers/criu/files/disable-selinux.patch
>         @@ -0,0 +1,26 @@
>         +Upstream-Status: Inappropriate [disable feature]
>         +
>         +It shows warning when build crius if libselinux has been
>         built already:
>         +
>         +  WARNING: QA Issue: criu rdepends on libselinux, but it
>         isn't a build dependency? [build-deps]
>         +
>         +Apply this patch to disable selinux support when 'selinux' is
>         not in PACKAGECONF.
>         +
>         +Signed-off-by: Kai Kang <kai.kang@windriver.com
>         <mailto:kai.kang@windriver.com>>
>         +
>         +diff --git a/Makefile.config b/Makefile.config
>         +index ce4b8d8..3ac2780 100644
>         +--- a/Makefile.config
>         ++++ b/Makefile.config
>         +@@ -8,11 +8,6 @@ ifeq ($(call try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)
>         +       DEFINES += -DCONFIG_HAS_LIBBSD
>         + endif
>         +
>         +-ifeq ($(call pkg-config-check,libselinux),y)
>         +-      LIBS := -lselinux $(LIBS)
>         +-      DEFINES += -DCONFIG_HAS_SELINUX
>         +-endif
>         +-
>         + $(CONFIG): scripts/utilities.mak scripts/feature-tests.mak
>         include/config-base.h
>         +       $(E) "  GEN     " $@
>         +       $(Q) @echo '#ifndef __CR_CONFIG_H__' > $@
>
>
>
>     -- 
>     Regards,
>     Neil | Kai Kang
>
>
>     -- 
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


-- 
Regards,
Neil | Kai Kang


--------------020208000205050704050900
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年06月06日 14:46, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4NwHRu-fHYh-mDLsHXuAXAS3LrPyO20NZP-kT3hX8GiAQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Sun, Jun 5, 2016 at 10:42 PM, Kang
            Kai <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Kai.Kang@windriver.com" target="_blank">Kai.Kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">On 2016年06月01日 16:35, <a
                  moz-do-not-send="true"
                  href="mailto:kai.kang@windriver.com" target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a></a>
                wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  From: Kai Kang &lt;<a moz-do-not-send="true"
                    href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;<br>
                  <br>
                  It shows warning when build crius if libselinux has
                  been built already:<br>
                  <br>
                     WARNING: QA Issue: criu rdepends on libselinux, but
                  it isn't a build dependency? [build-deps]<br>
                  <br>
                  Add a patch to disable selinux support when 'selinux'
                  is not in PACKAGECONF.<br>
                  <br>
                  And update indentation at same time.<br>
                </blockquote>
                <br>
              </span>
              Hi Bruce,<br>
              <br>
              Any comment on this commit, please?<br>
            </blockquote>
            <div><br>
              <br>
            </div>
            <div>I just hadn't gotten to it yet.<br>
              <br>
            </div>
            <div>This looks fine to me, and is now merged to master.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks.<br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CADkTA4NwHRu-fHYh-mDLsHXuAXAS3LrPyO20NZP-kT3hX8GiAQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Bruce<br>
            </div>
            <div> <br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              <br>
              Regards,<br>
              Kai
              <div>
                <div class="h5"><br>
                  <br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <br>
                    Signed-off-by: Kai Kang &lt;<a
                      moz-do-not-send="true"
                      href="mailto:kai.kang@windriver.com"
                      target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a></a>&gt;<br>
                    ---<br>
                      recipes-containers/criu/<a moz-do-not-send="true"
                      href="http://criu_git.bb" rel="noreferrer"
                      target="_blank">criu_git.bb</a>                |
                    12 ++++++----<br>
                      .../criu/files/disable-selinux.patch             
                     | 26 ++++++++++++++++++++++<br>
                      2 files changed, 34 insertions(+), 4 deletions(-)<br>
                      create mode 100644
                    recipes-containers/criu/files/disable-selinux.patch<br>
                    <br>
                    diff --git a/recipes-containers/criu/<a
                      moz-do-not-send="true" href="http://criu_git.bb"
                      rel="noreferrer" target="_blank">criu_git.bb</a>
                    b/recipes-containers/criu/<a moz-do-not-send="true"
                      href="http://criu_git.bb" rel="noreferrer"
                      target="_blank">criu_git.bb</a><br>
                    index 816c806..c8be78f 100644<br>
                    --- a/recipes-containers/criu/<a
                      moz-do-not-send="true" href="http://criu_git.bb"
                      rel="noreferrer" target="_blank">criu_git.bb</a><br>
                    +++ b/recipes-containers/criu/<a
                      moz-do-not-send="true" href="http://criu_git.bb"
                      rel="noreferrer" target="_blank">criu_git.bb</a><br>
                    @@ -18,10 +18,11 @@ PR = "r0"<br>
                      PV = "1.6+git${SRCPV}"<br>
                        SRC_URI = "git://<a moz-do-not-send="true"
                      href="http://github.com/xemul/criu.git;protocol=git"
                      rel="noreferrer" target="_blank">github.com/xemul/criu.git;protocol=git</a>
                    \<br>
                    -         
                    <a class="moz-txt-link-freetext" href="file://0001-criu-Fix-toolchain-hardcode.patch">file://0001-criu-Fix-toolchain-hardcode.patch</a> \<br>
                    -         
                    <a class="moz-txt-link-freetext" href="file://0002-criu-Skip-documentation-install.patch">file://0002-criu-Skip-documentation-install.patch</a> \<br>
                    -     
                     <a class="moz-txt-link-freetext" href="file://0001-criu-Change-libraries-install-directory.patch">file://0001-criu-Change-libraries-install-directory.patch</a>
                    \<br>
                    -         "<br>
                    +         
                     <a class="moz-txt-link-freetext" href="file://0001-criu-Fix-toolchain-hardcode.patch">file://0001-criu-Fix-toolchain-hardcode.patch</a> \<br>
                    +         
                     <a class="moz-txt-link-freetext" href="file://0002-criu-Skip-documentation-install.patch">file://0002-criu-Skip-documentation-install.patch</a> \<br>
                    +         
                     <a class="moz-txt-link-freetext" href="file://0001-criu-Change-libraries-install-directory.patch">file://0001-criu-Change-libraries-install-directory.patch</a>
                    \<br>
                    +           ${@bb.utils.contains('PACKAGECONFIG',
                    'selinux', '', '<a class="moz-txt-link-freetext" href="file://disable-selinux.patch">file://disable-selinux.patch</a>', d)} \<br>
                    +          "<br>
                        COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"<br>
                      @@ -51,6 +52,9 @@ export HOST_SYS<br>
                        inherit setuptools<br>
                      +PACKAGECONFIG ??= ""<br>
                    +PACKAGECONFIG[selinux] = ",,libselinux"<br>
                    +<br>
                      do_compile_prepend() {<br>
                          rm -rf
                    ${S}/protobuf/google/protobuf/descriptor.proto<br>
                          ln -s 
                    ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto
                    ${S}/protobuf/google/protobuf/descriptor.proto<br>
                    diff --git
                    a/recipes-containers/criu/files/disable-selinux.patch
b/recipes-containers/criu/files/disable-selinux.patch<br>
                    new file mode 100644<br>
                    index 0000000..da881dd<br>
                    --- /dev/null<br>
                    +++
                    b/recipes-containers/criu/files/disable-selinux.patch<br>
                    @@ -0,0 +1,26 @@<br>
                    +Upstream-Status: Inappropriate [disable feature]<br>
                    +<br>
                    +It shows warning when build crius if libselinux has
                    been built already:<br>
                    +<br>
                    +  WARNING: QA Issue: criu rdepends on libselinux,
                    but it isn't a build dependency? [build-deps]<br>
                    +<br>
                    +Apply this patch to disable selinux support when
                    'selinux' is not in PACKAGECONF.<br>
                    +<br>
                    +Signed-off-by: Kai Kang &lt;<a
                      moz-do-not-send="true"
                      href="mailto:kai.kang@windriver.com"
                      target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a></a>&gt;<br>
                    +<br>
                    +diff --git a/Makefile.config b/Makefile.config<br>
                    +index ce4b8d8..3ac2780 100644<br>
                    +--- a/Makefile.config<br>
                    ++++ b/Makefile.config<br>
                    +@@ -8,11 +8,6 @@ ifeq ($(call
                    try-cc,$(LIBBSD_DEV_TEST),-lbsd),y)<br>
                    +       DEFINES += -DCONFIG_HAS_LIBBSD<br>
                    + endif<br>
                    +<br>
                    +-ifeq ($(call pkg-config-check,libselinux),y)<br>
                    +-      LIBS := -lselinux $(LIBS)<br>
                    +-      DEFINES += -DCONFIG_HAS_SELINUX<br>
                    +-endif<br>
                    +-<br>
                    + $(CONFIG): scripts/utilities.mak
                    scripts/feature-tests.mak include/config-base.h<br>
                    +       $(E) "  GEN     " $@<br>
                    +       $(Q) @echo '#ifndef __CR_CONFIG_H__' &gt; $@<br>
                  </blockquote>
                  <br>
                  <br>
                  -- <br>
                </div>
              </div>
              Regards,<br>
              Neil | Kai Kang
              <div class="HOEnZb">
                <div class="h5"><br>
                  <br>
                  -- <br>
                  _______________________________________________<br>
                  meta-virtualization mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:meta-virtualization@yoctoproject.org"
                    target="_blank">meta-virtualization@yoctoproject.org</a><br>
                  <a moz-do-not-send="true"
                    href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                    rel="noreferrer" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <br>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------020208000205050704050900--
