Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B604E00B6C; Tue,  9 Oct 2018 19:08:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B057E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 19:08:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A26nV1012064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2018 19:07:35 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 9 Oct 2018 19:06:52 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<1538277461-163634-2-git-send-email-changqing.li@windriver.com>
	<CADkTA4PWSA+Pf79s0CzxNaWpLo04CFkGBZEoPuqKFD3RSwxARQ@mail.gmail.com>
	<21b404b8-1d6d-3ca0-86de-5f9db5c67f56@windriver.com>
	<d6098170-b819-dda7-2303-b1054dfc5569@windriver.com>
	<CADkTA4NJU-B8a1hSLk=SQv9j1oGpJBTsikQAiM2C0M7qS4Y=yQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <3484066a-42f8-3f34-8aad-0215ca5374da@windriver.com>
Date: Wed, 10 Oct 2018 10:06:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NJU-B8a1hSLk=SQv9j1oGpJBTsikQAiM2C0M7qS4Y=yQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: fix do package qa warning [textrel]
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
X-List-Received-Date: Wed, 10 Oct 2018 02:08:03 -0000
Content-Type: multipart/alternative;
	boundary="------------2359E872E246F48F43D6E7B7"
Content-Language: en-US

--------------2359E872E246F48F43D6E7B7
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 10/09/2018 08:41 PM, Bruce Ashfield wrote:
>
>
> On Tue, Oct 9, 2018 at 5:20 AM Changqing Li 
> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote:
>
>
>
>     On 10/09/2018 11:14 AM, Changqing Li wrote:
>>
>>
>>
>>     On 10/01/2018 09:22 AM, Bruce Ashfield wrote:
>>>     On Sat, Sep 29, 2018 at 11:18 PM<changqing.li@windriver.com> <mailto:changqing.li@windriver.com>  wrote:
>>>>     From: Changqing Li<changqing.li@windriver.com> <mailto:changqing.li@windriver.com>
>>>>
>>>>     fix below warning:
>>>>
>>>>     do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
>>>>     has relocations in .text [textrel]
>>>>
>>>>     Add GOBUILDFLAGS which have -buildmode=pie to fix it
>>>     This is not universally true, so your configuration needs more
>>>     explanation. We haven't needed these flags before, and I've never seen
>>>     the warnings.
>>>
>>>     I just build docker and dumped the environment, my GOBUILDFLAGS do not
>>>     have buildmode=pie
>>>
>>>     So clearly, your config is different.
>>>
>>>     I'm not against adding the extra variable, but we are taking a the
>>>     risk of injecting build configurations that we haven't needed before,
>>>     and may not want.
>>>
>>>     So I need to understand what configuration you are building that is
>>>     making them required, and then figure out what else is being injected
>>>     that wasn't being injected before.
>>>
>>>     Same comment applies for all the QA fixes.
>>>
>>>     Bruce
>>
>>     Hi,  Bruce
>>
>>     I do some research, package QA check  is enabled by default in
>>     insane.bbclass.
>>     variable WARN_QA contains the checked items. and textrel is
>>     checked by default.
>>
>>     But,  this warning  is arch related(Besides arch,  no other
>>     special config).
>>     Here is my test result of which archs  the warnings can see.
>>
>>     docker                                      arm64  arm x86  x86-64
>>     docker-distribution                   arm64
>>     containerd-opencontainers     arm64  arm  x86  x86-64
>>     oci-image-tools                        arm64
>>     oci-runtime-tools                     arm64
>>     runc-docker                             arm64  arm  x86 x86-64
>>
>>
>>     About GOBUILDFLAGS,  buildmode=pie is added to oe-core recently,
>>     so maybe you need
>>     to check lastest code, here is the patch.
>>
>>
>>
>>     Do you think we need add the fix patch only for special arch? like
>>     SRC_URI_append_aarch64="file://0001-fix-do_package_qa-error.patch"
>>
>>     //Sandy
>
>     PS: Refer this commit,
>     http://cgit.openembedded.org/openembedded-core/commit/?id=b689c72ad2dc84b8bb55ecbf72d95701707b9bb3
>     seems problem only met on aarch64,  but not only skip aarch64.
>
>
> My trees are completely up to date. I always track master and 
> master-next for these builds.
>
> And yet, I can't trigger any build issues from the QA check. I'd have 
> expected that other docker
> users would also be hitting this and would have either reported an 
> issue, or sent patches.
>
> But like the commit you are referencing, I'd prefer to just add a skip 
> to the QA versus take
> patches for issues that I'm not able to reproduce.
>
> Bruce

ok. I will resend the patch to skip the qa check.

//Sandy
>
>
>     //Sandy
>
>>
>>>>     Signed-off-by: Changqing Li<changqing.li@windriver.com> <mailto:changqing.li@windriver.com>
>>>>     ---
>>>>       .../docker-distribution/docker-distribution_git.bb <http://docker-distribution_git.bb>  |  1 +
>>>>       .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
>>>>       2 files changed, 33 insertions(+)
>>>>       create mode 100644 recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>>>>
>>>>     diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb <http://docker-distribution_git.bb>  b/recipes-containers/docker-distribution/docker-distribution_git.bb <http://docker-distribution_git.bb>
>>>>     index add5ce1..7c7bce2 100644
>>>>     --- a/recipes-containers/docker-distribution/docker-distribution_git.bb <http://docker-distribution_git.bb>
>>>>     +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb <http://docker-distribution_git.bb>
>>>>     @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM ="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>>>>       SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
>>>>       SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution
>>>>     <http://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution>  \
>>>>                  file://docker-registry.service  \
>>>>     +file://0001-fix-do_package_qa-error.patch  \
>>>>                 "
>>>>
>>>>       PACKAGES =+ "docker-registry"
>>>>     diff --git a/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>>>>     new file mode 100644
>>>>     index 0000000..269b0cd
>>>>     --- /dev/null
>>>>     +++ b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>>>>     @@ -0,0 +1,32 @@
>>>>     +From 4b9d701fabff8e7969db081406d00fa9fe46b3fd Mon Sep 17 00:00:00 2001
>>>>     +From: Changqing Li<changqing.li@windriver.com> <mailto:changqing.li@windriver.com>
>>>>     +Date: Thu, 27 Sep 2018 11:05:51 +0800
>>>>     +Subject: [PATCH] fix do_package_qa error
>>>>     +
>>>>     +fix below error:
>>>>     +do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
>>>>     +has relocations in .text [textrel]
>>>>     +
>>>>     +Upstream-Status: Inappropriate [oe-specific]
>>>>     +
>>>>     +Signed-off-by: Changqing Li<changqing.li@windriver.com> <mailto:changqing.li@windriver.com>
>>>>     +---
>>>>     + Makefile | 2 +-
>>>>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>     +
>>>>     +diff --git a/Makefile b/Makefile
>>>>     +index 47b8f1d..13b0f92 100644
>>>>     +--- a/Makefile
>>>>     ++++ b/Makefile
>>>>     +@@ -39,7 +39,7 @@ GODEP=$(shell which godep || echo '')
>>>>     +
>>>>     + ${PREFIX}/bin/registry: $(GOFILES)
>>>>     +       @echo "+ $@"
>>>>     +-      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS}  ${GO_GCFLAGS} ./cmd/registry
>>>>     ++      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS} ${GOBUILDFLAGS} ${GO_GCFLAGS} ./cmd/registry
>>>>     +
>>>>     + ${PREFIX}/bin/digest:  $(GOFILES)
>>>>     +       @echo "+ $@"
>>>>     +--
>>>>     +2.7.4
>>>>     +
>>>>     --
>>>>     2.7.4
>>>>
>>>>     --
>>>>     _______________________________________________
>>>>     meta-virtualization mailing list
>>>>     meta-virtualization@yoctoproject.org
>>>>     <mailto:meta-virtualization@yoctoproject.org>
>>>>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>     -- 
>>     BRs
>>
>>     Sandy(Li Changqing)
>>     Wind River Linux
>>
>>
>
>     -- 
>     BRs
>
>     Sandy(Li Changqing)
>     Wind River Linux
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


--------------2359E872E246F48F43D6E7B7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/09/2018 08:41 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NJU-B8a1hSLk=SQv9j1oGpJBTsikQAiM2C0M7qS4Y=yQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_default" style="font-size:small"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Tue, Oct 9, 2018 at 5:20 AM Changqing Li
            &lt;<a href="mailto:changqing.li@windriver.com"
              moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF">
              <p><br>
              </p>
              <br>
              <div class="m_-5885381248464412662moz-cite-prefix">On
                10/09/2018 11:14 AM, Changqing Li wrote:<br>
              </div>
              <blockquote type="cite">
                <p><br>
                </p>
                <br>
                <div class="m_-5885381248464412662moz-cite-prefix">On
                  10/01/2018 09:22 AM, Bruce Ashfield wrote:<br>
                </div>
                <blockquote type="cite">
                  <pre>On Sat, Sep 29, 2018 at 11:18 PM <a class="m_-5885381248464412662moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
                  <blockquote type="cite">
                    <pre>From: Changqing Li <a class="m_-5885381248464412662moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

fix below warning:

do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
has relocations in .text [textrel]

Add GOBUILDFLAGS which have -buildmode=pie to fix it
</pre>
                  </blockquote>
                  <pre>This is not universally true, so your configuration needs more
explanation. We haven't needed these flags before, and I've never seen
the warnings.

I just build docker and dumped the environment, my GOBUILDFLAGS do not
have buildmode=pie

So clearly, your config is different.

I'm not against adding the extra variable, but we are taking a the
risk of injecting build configurations that we haven't needed before,
and may not want.

So I need to understand what configuration you are building that is
making them required, and then figure out what else is being injected
that wasn't being injected before.

Same comment applies for all the QA fixes.

Bruce</pre>
                </blockquote>
                <br>
                Hi,  Bruce<br>
                <br>
                I do some research, package QA check  is enabled by
                default in insane.bbclass. <br>
                variable WARN_QA contains the checked items. and textrel
                is checked by default.<br>
                <span
style="color:rgb(51,51,51);font-family:Verdana,Sans,sans-serif;font-size:medium;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;display:inline!important;float:none"><span></span></span><br>
                But,  this warning  is arch related(Besides arch,  no
                other special config).<br>
                Here is my test result of which archs  the warnings can
                see.<br>
                <br>
                docker                                      arm64  arm 
                x86  x86-64<br>
                docker-distribution                   arm64           <br>
                containerd-opencontainers     arm64  arm  x86  x86-64<br>
                oci-image-tools                        arm64<br>
                oci-runtime-tools                     arm64<br>
                runc-docker                             arm64  arm  x86 
                x86-64<br>
                <br>
                <br>
                About GOBUILDFLAGS,  buildmode=pie is added to oe-core
                recently, so maybe you need<br>
                to check lastest code, here is the patch.<br>
                <img src="cid:part3.4307EFE5.FA174322@windriver.com"
                  alt="" moz-do-not-send="true"><br>
                <br>
                <br>
                Do you think we need add the fix patch only for special
                arch? like<br>
                SRC_URI_append_aarch64=<a
                  class="m_-5885381248464412662moz-txt-link-rfc2396E"
                  moz-do-not-send="true">"file://0001-fix-do_package_qa-error.patch"</a><br>
                <br>
                //Sandy<br>
              </blockquote>
              <br>
              PS: Refer this commit,
              <a class="m_-5885381248464412662moz-txt-link-freetext"
href="http://cgit.openembedded.org/openembedded-core/commit/?id=b689c72ad2dc84b8bb55ecbf72d95701707b9bb3"
                target="_blank" moz-do-not-send="true">http://cgit.openembedded.org/openembedded-core/commit/?id=b689c72ad2dc84b8bb55ecbf72d95701707b9bb3</a><br>
              seems problem only met on aarch64,  but not only skip
              aarch64. <br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">My trees
              are completely up to date. I always track master and
              master-next for these builds.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">And yet,
              I can't trigger any build issues from the QA check. I'd
              have expected that other docker</div>
            <div class="gmail_default" style="font-size:small">users
              would also be hitting this and would have either reported
              an issue, or sent patches.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">But like
              the commit you are referencing, I'd prefer to just add a
              skip to the QA versus take</div>
            <div class="gmail_default" style="font-size:small">patches
              for issues that I'm not able to reproduce.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    ok. I will resend the patch to skip the qa check.<br>
    <br>
    //Sandy<br>
    <blockquote type="cite"
cite="mid:CADkTA4NJU-B8a1hSLk=SQv9j1oGpJBTsikQAiM2C0M7qS4Y=yQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div text="#000000" bgcolor="#FFFFFF"> <br>
              //Sandy<br>
              <br>
              <blockquote type="cite"> <br>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre>Signed-off-by: Changqing Li <a class="m_-5885381248464412662moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
 .../docker-distribution/<a href="http://docker-distribution_git.bb" target="_blank" moz-do-not-send="true">docker-distribution_git.bb</a> |  1 +
 .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch

diff --git a/recipes-containers/docker-distribution/<a href="http://docker-distribution_git.bb" target="_blank" moz-do-not-send="true">docker-distribution_git.bb</a> b/recipes-containers/docker-distribution/<a href="http://docker-distribution_git.bb" target="_blank" moz-do-not-send="true">docker-distribution_git.bb</a>
index add5ce1..7c7bce2 100644
--- a/recipes-containers/docker-distribution/<a href="http://docker-distribution_git.bb" target="_blank" moz-do-not-send="true">docker-distribution_git.bb</a>
+++ b/recipes-containers/docker-distribution/<a href="http://docker-distribution_git.bb" target="_blank" moz-do-not-send="true">docker-distribution_git.bb</a>
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = <a class="m_-5885381248464412662moz-txt-link-rfc2396E" moz-do-not-send="true">"file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"</a>
 SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
 SRC_URI = "git://<a href="http://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution" target="_blank" moz-do-not-send="true">github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution</a> \
            <a class="m_-5885381248464412662moz-txt-link-freetext" moz-do-not-send="true">file://docker-registry.service</a> \
+           <a class="m_-5885381248464412662moz-txt-link-freetext" moz-do-not-send="true">file://0001-fix-do_package_qa-error.patch</a> \
           "

 PACKAGES =+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
new file mode 100644
index 0000000..269b0cd
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
@@ -0,0 +1,32 @@
+From 4b9d701fabff8e7969db081406d00fa9fe46b3fd Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="m_-5885381248464412662moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
+Date: Thu, 27 Sep 2018 11:05:51 +0800
+Subject: [PATCH] fix do_package_qa error
+
+fix below error:
+do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
+has relocations in .text [textrel]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <a class="m_-5885381248464412662moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 47b8f1d..13b0f92 100644
+--- a/Makefile
++++ b/Makefile
+@@ -39,7 +39,7 @@ GODEP=$(shell which godep || echo '')
+
+ ${PREFIX}/bin/registry: $(GOFILES)
+       @echo "+ $@"
+-      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS}  ${GO_GCFLAGS} ./cmd/registry
++      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS} ${GOBUILDFLAGS} ${GO_GCFLAGS} ./cmd/registry
+
+ ${PREFIX}/bin/digest:  $(GOFILES)
+       @echo "+ $@"
+--
+2.7.4
+
--
2.7.4

--
_______________________________________________
meta-virtualization mailing list
<a class="m_-5885381248464412662moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org" target="_blank" moz-do-not-send="true">meta-virtualization@yoctoproject.org</a>
<a class="m_-5885381248464412662moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-virtualization" target="_blank" moz-do-not-send="true">https://lists.yoctoproject.org/listinfo/meta-virtualization</a>
</pre>
                  </blockquote>
                </blockquote>
                <br>
                <pre class="m_-5885381248464412662moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
                <br>
                <fieldset
                  class="m_-5885381248464412662mimeAttachmentHeader"></fieldset>
                <br>
              </blockquote>
              <br>
              <pre class="m_-5885381248464412662moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
            </div>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature"
          data-smartmail="gmail_signature">"Thou shalt not follow the
          NULL pointer, for chaos and madness await thee at its end"</div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
  </body>
</html>

--------------2359E872E246F48F43D6E7B7--
