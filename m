Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4814E00B5E; Mon,  8 Oct 2018 21:47:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67354E00A86
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Oct 2018 21:47:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w994lLmv022792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Oct 2018 21:47:22 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 8 Oct 2018 21:47:21 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<1538277461-163634-2-git-send-email-changqing.li@windriver.com>
	<CADkTA4PWSA+Pf79s0CzxNaWpLo04CFkGBZEoPuqKFD3RSwxARQ@mail.gmail.com>
	<caff70ef-6fa8-1b0e-2a20-b6639a349923@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <d3460080-a1ad-6a42-d589-5ddef0ecb465@windriver.com>
Date: Tue, 9 Oct 2018 12:47:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <caff70ef-6fa8-1b0e-2a20-b6639a349923@windriver.com>
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
X-List-Received-Date: Tue, 09 Oct 2018 04:47:24 -0000
X-Groupsio-MsgNum: 3795
Content-Type: multipart/alternative;
	boundary="------------8B8D2E4FF25E644D08FC25E3"
Content-Language: en-US

--------------8B8D2E4FF25E644D08FC25E3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this mail,  this mail is same as next one,  just send two 
times by mistake.


On 10/09/2018 11:13 AM, Changqing Li wrote:
>
>
>
> On 10/01/2018 09:22 AM, Bruce Ashfield wrote:
>> On Sat, Sep 29, 2018 at 11:18 PM<changqing.li@windriver.com>  wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> fix below warning:
>>>
>>> do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
>>> has relocations in .text [textrel]
>>>
>>> Add GOBUILDFLAGS which have -buildmode=pie to fix it
>> This is not universally true, so your configuration needs more
>> explanation. We haven't needed these flags before, and I've never seen
>> the warnings.
>>
>> I just build docker and dumped the environment, my GOBUILDFLAGS do not
>> have buildmode=pie
>>
>> So clearly, your config is different.
>>
>> I'm not against adding the extra variable, but we are taking a the
>> risk of injecting build configurations that we haven't needed before,
>> and may not want.
>>
>> So I need to understand what configuration you are building that is
>> making them required, and then figure out what else is being injected
>> that wasn't being injected before.
>>
>> Same comment applies for all the QA fixes.
>>
>> Bruce
>
> Hi,  Bruce
>
> I do some research, package QA check  is enabled by default in 
> insane.bbclass.
> variable WARN_QA contains the checked items. and textrel is checked by 
> default.
>
> But,  this warning  is arch related(Besides arch,  no other special 
> config).
> Here is my test result of which archs  the warnings can see.
>
> docker                                      arm64  arm  x86 x86-64
> docker-distribution                   arm64
> containerd-opencontainers     arm64  arm  x86  x86-64
> oci-image-tools                        arm64
> oci-runtime-tools                     arm64
> runc-docker                             arm64  arm  x86  x86-64
>
>
> About GOBUILDFLAGS,  buildmode=pie is added to oe-core recently, so 
> maybe you need
> to check lastest code, here is the patch.
>
>
>
> Do you think we need add the fix patch only for special arch? like
> SRC_URI_append_aarch64="file://0001-fix-do_package_qa-error.patch"
>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>>   .../docker-distribution/docker-distribution_git.bb |  1 +
>>>   .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
>>>   2 files changed, 33 insertions(+)
>>>   create mode 100644 recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>>>
>>> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
>>> index add5ce1..7c7bce2 100644
>>> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
>>> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
>>> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM ="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>>>   SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
>>>   SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
>>>              file://docker-registry.service  \
>>> +file://0001-fix-do_package_qa-error.patch  \
>>>             "
>>>
>>>   PACKAGES =+ "docker-registry"
>>> diff --git a/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>>> new file mode 100644
>>> index 0000000..269b0cd
>>> --- /dev/null
>>> +++ b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
>>> @@ -0,0 +1,32 @@
>>> +From 4b9d701fabff8e7969db081406d00fa9fe46b3fd Mon Sep 17 00:00:00 2001
>>> +From: Changqing Li<changqing.li@windriver.com>
>>> +Date: Thu, 27 Sep 2018 11:05:51 +0800
>>> +Subject: [PATCH] fix do_package_qa error
>>> +
>>> +fix below error:
>>> +do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
>>> +has relocations in .text [textrel]
>>> +
>>> +Upstream-Status: Inappropriate [oe-specific]
>>> +
>>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> +---
>>> + Makefile | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Makefile b/Makefile
>>> +index 47b8f1d..13b0f92 100644
>>> +--- a/Makefile
>>> ++++ b/Makefile
>>> +@@ -39,7 +39,7 @@ GODEP=$(shell which godep || echo '')
>>> +
>>> + ${PREFIX}/bin/registry: $(GOFILES)
>>> +       @echo "+ $@"
>>> +-      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS}  ${GO_GCFLAGS} ./cmd/registry
>>> ++      @go build -tags "${DOCKER_BUILDTAGS}" -o $@ ${GO_LDFLAGS} ${GOBUILDFLAGS} ${GO_GCFLAGS} ./cmd/registry
>>> +
>>> + ${PREFIX}/bin/digest:  $(GOFILES)
>>> +       @echo "+ $@"
>>> +--
>>> +2.7.4
>>> +
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
> -- 
> BRs
>
> Sandy(Li Changqing)
> Wind River Linux
>
>

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


--------------8B8D2E4FF25E644D08FC25E3
Content-Type: multipart/related;
	boundary="------------CD866CEAB49138E5EA486488"

--------------CD866CEAB49138E5EA486488
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Please ignore this mail,  this mail is same as next one,  just
      send two times by mistake.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/09/2018 11:13 AM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:caff70ef-6fa8-1b0e-2a20-b6639a349923@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">On 10/01/2018 09:22 AM, Bruce
        Ashfield wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CADkTA4PWSA+Pf79s0CzxNaWpLo04CFkGBZEoPuqKFD3RSwxARQ@mail.gmail.com">
        <pre wrap="">On Sat, Sep 29, 2018 at 11:18 PM <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

fix below warning:

do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
has relocations in .text [textrel]

Add GOBUILDFLAGS which have -buildmode=pie to fix it
</pre>
        </blockquote>
        <pre wrap="">This is not universally true, so your configuration needs more
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
      I do some research, package QA check  is enabled by default in
      insane.bbclass. <br>
      variable WARN_QA contains the checked items. and textrel is
      checked by default.<br>
      <span style="color: rgb(51, 51, 51); font-family: Verdana, Sans,
        sans-serif; font-size: medium; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><span></span></span><br>
      But,  this warning  is arch related(Besides arch,  no other
      special config).<br>
      Here is my test result of which archs  the warnings can see.<br>
      <br>
      docker                                      arm64  arm  x86 
      x86-64<br>
      docker-distribution                   arm64           <br>
      containerd-opencontainers     arm64  arm  x86  x86-64<br>
      oci-image-tools                        arm64<br>
      oci-runtime-tools                     arm64<br>
      runc-docker                             arm64  arm  x86  x86-64<br>
      <br>
      <br>
      About GOBUILDFLAGS,  buildmode=pie is added to oe-core recently,
      so maybe you need<br>
      to check lastest code, here is the patch.<br>
      <img src="cid:part3.9CD4704C.28855D48@windriver.com" alt=""
        class=""><br>
      <br>
      <br>
      Do you think we need add the fix patch only for special arch? like<br>
      SRC_URI_append_aarch64=<a class="moz-txt-link-rfc2396E"
        href="file://0001-fix-do_package_qa-error.patch"
        moz-do-not-send="true">"file://0001-fix-do_package_qa-error.patch"</a><br>
      <br>
      <blockquote type="cite"
cite="mid:CADkTA4PWSA+Pf79s0CzxNaWpLo04CFkGBZEoPuqKFD3RSwxARQ@mail.gmail.com">
        <pre wrap="">
</pre>
        <blockquote type="cite">
          <pre wrap="">Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
 .../docker-distribution/docker-distribution_git.bb |  1 +
 .../files/0001-fix-do_package_qa-error.patch       | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index add5ce1..7c7bce2 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314" moz-do-not-send="true">"file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"</a>
 SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
 SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
            <a class="moz-txt-link-freetext" href="file://docker-registry.service" moz-do-not-send="true">file://docker-registry.service</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-fix-do_package_qa-error.patch" moz-do-not-send="true">file://0001-fix-do_package_qa-error.patch</a> \
           "

 PACKAGES =+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
new file mode 100644
index 0000000..269b0cd
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-fix-do_package_qa-error.patch
@@ -0,0 +1,32 @@
+From 4b9d701fabff8e7969db081406d00fa9fe46b3fd Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
+Date: Thu, 27 Sep 2018 11:05:51 +0800
+Subject: [PATCH] fix do_package_qa error
+
+fix below error:
+do_package_qa: QA Issue: ELF binary 'xxx/usr/sbin/registry'
+has relocations in .text [textrel]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
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
<a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org" moz-do-not-send="true">meta-virtualization@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-virtualization" moz-do-not-send="true">https://lists.yoctoproject.org/listinfo/meta-virtualization</a>
</pre>
        </blockquote>
        <pre wrap="">

</pre>
      </blockquote>
      <br>
      <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
      <!--'"--><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
  </body>
</html>

--------------CD866CEAB49138E5EA486488
Content-Type: image/png; name="nmeabbcbjjpodgbo.png"
Content-Transfer-Encoding: base64
Content-ID: <part3.9CD4704C.28855D48@windriver.com>
Content-Disposition: inline; filename="nmeabbcbjjpodgbo.png"

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

--------------CD866CEAB49138E5EA486488--

--------------8B8D2E4FF25E644D08FC25E3--
