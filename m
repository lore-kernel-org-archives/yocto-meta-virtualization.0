Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F4C1E0090A; Wed, 23 Aug 2017 21:48:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA6B3E00726
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 21:48:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O4mp88024706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 21:48:51 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 23 Aug 2017 21:48:50 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1503537222-1882-1-git-send-email-yi.zhao@windriver.com>
	<CADkTA4NCrLd2Nd5GijNHxMrDSYzQDyAYzEiQYOqoMPQXSoXLXQ@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <377ea591-6bee-2275-81e0-31e647a739a9@windriver.com>
Date: Thu, 24 Aug 2017 12:49:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4NCrLd2Nd5GijNHxMrDSYzQDyAYzEiQYOqoMPQXSoXLXQ@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH] docker-distribution: update to 2.6.2
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
X-List-Received-Date: Thu, 24 Aug 2017 04:48:56 -0000
Content-Type: multipart/alternative;
	boundary="------------277F09D32EA7C5D347304836"
Content-Language: en-US

--------------277F09D32EA7C5D347304836
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2017年08月24日 11:35, Bruce Ashfield 写道:
>
>
> On Wed, Aug 23, 2017 at 9:13 PM, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     CVE-2017-11468 is fixed in this release.
>
>     Reference:
>     https://nvd.nist.gov/vuln/detail/CVE-2017-11468
>     <https://nvd.nist.gov/vuln/detail/CVE-2017-11468>
>
>     Release note:
>     https://github.com/docker/distribution/releases/tag/v2.6.2
>     <https://github.com/docker/distribution/releases/tag/v2.6.2>
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com
>     <mailto:yi.zhao@windriver.com>>
>     ---
>      .../{docker-distribution_git.bb
>     <http://docker-distribution_git.bb> =>
>     docker-distribution_2.6.2.bb
>     <http://docker-distribution_2.6.2.bb>}    | 5 ++---
>      1 file changed, 2 insertions(+), 3 deletions(-)
>      rename
>     recipes-containers/docker-distribution/{docker-distribution_git.bb
>     <http://docker-distribution_git.bb> =>
>     docker-distribution_2.6.2.bb
>     <http://docker-distribution_2.6.2.bb>} (90%)
>
>     diff --git
>     a/recipes-containers/docker-distribution/docker-distribution_git.bb
>     <http://docker-distribution_git.bb>
>     b/recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
>     <http://docker-distribution_2.6.2.bb>
>     similarity index 90%
>     rename from
>     recipes-containers/docker-distribution/docker-distribution_git.bb
>     <http://docker-distribution_git.bb>
>     rename to
>     recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
>     <http://docker-distribution_2.6.2.bb>
>     index 08b6d70..b0a380b 100644
>     ---
>     a/recipes-containers/docker-distribution/docker-distribution_git.bb
>     <http://docker-distribution_git.bb>
>     +++
>     b/recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
>     <http://docker-distribution_2.6.2.bb>
>     @@ -3,14 +3,13 @@ SUMMARY = "The Docker toolset to pack, ship,
>     store, and deliver content"
>      LICENSE = "Apache-2.0"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>
>     -SRCREV_distribution="0810eba2adf048b77621472991211924d9ec31c5"
>     -SRC_URI =
>     "git://github.com/docker/distribution.git;branch=master;name=distribution;destsuffix=git/src/github.com/docker/distribution
>     <http://github.com/docker/distribution.git;branch=master;name=distribution;destsuffix=git/src/github.com/docker/distribution>
>     \
>     +SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
>     +SRC_URI =
>     "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution
>     <http://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution>
>     \
>                 file://docker-registry.service \
>                "
>
>      PACKAGES =+ "docker-registry"
>
>     -PV = "v2.6.0-rc+git${SRCPV}"
>
>
> This stays as a _git recipe. Please re-send it with _git and the PV 
> restored.

Thanks, I will send V2

Yi

>
> Bruce
>
>      S = "${WORKDIR}/git/src/github.com/docker/distribution
>     <http://github.com/docker/distribution>"
>
>      inherit goarch
>     --
>     2.7.4
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------277F09D32EA7C5D347304836
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
    <div class="moz-cite-prefix">在 2017年08月24日 11:35, Bruce Ashfield 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NCrLd2Nd5GijNHxMrDSYzQDyAYzEiQYOqoMPQXSoXLXQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Wed, Aug 23, 2017 at 9:13 PM, Yi
            Zhao <span dir="ltr">&lt;<a
                href="mailto:yi.zhao@windriver.com" target="_blank"
                moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">CVE-2017-11468
              is fixed in this release.<br>
              <br>
              Reference:<br>
              <a href="https://nvd.nist.gov/vuln/detail/CVE-2017-11468"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://nvd.nist.gov/vuln/<wbr>detail/CVE-2017-11468</a><br>
              <br>
              Release note:<br>
              <a
                href="https://github.com/docker/distribution/releases/tag/v2.6.2"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/docker/<wbr>distribution/releases/tag/v2.<wbr>6.2</a><br>
              <br>
              Signed-off-by: Yi Zhao &lt;<a
                href="mailto:yi.zhao@windriver.com"
                moz-do-not-send="true">yi.zhao@windriver.com</a>&gt;<br>
              ---<br>
               .../{<a href="http://docker-distribution_git.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-distribution_git.<wbr>bb</a>
              =&gt; <a href="http://docker-distribution_2.6.2.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-distribution_2.6.2.bb</a>} 
                 | 5 ++---<br>
               1 file changed, 2 insertions(+), 3 deletions(-)<br>
               rename recipes-containers/docker-<wbr>distribution/{<a
                href="http://docker-distribution_git.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_git.bb</a>
              =&gt; <a href="http://docker-distribution_2.6.2.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-distribution_2.6.2.bb</a>}
              (90%)<br>
              <br>
              diff --git a/recipes-containers/docker-<wbr>distribution/<a
                href="http://docker-distribution_git.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_git.bb</a>
              b/recipes-containers/docker-<wbr>distribution/<a
                href="http://docker-distribution_2.6.2.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_2.6.2.bb</a><br>
              similarity index 90%<br>
              rename from recipes-containers/docker-<wbr>distribution/<a
                href="http://docker-distribution_git.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_git.bb</a><br>
              rename to recipes-containers/docker-<wbr>distribution/<a
                href="http://docker-distribution_2.6.2.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_2.6.2.bb</a><br>
              index 08b6d70..b0a380b 100644<br>
              --- a/recipes-containers/docker-<wbr>distribution/<a
                href="http://docker-distribution_git.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_git.bb</a><br>
              +++ b/recipes-containers/docker-<wbr>distribution/<a
                href="http://docker-distribution_2.6.2.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">docker-<wbr>distribution_2.6.2.bb</a><br>
              @@ -3,14 +3,13 @@ SUMMARY = "The Docker toolset to pack,
              ship, store, and deliver content"<br>
               LICENSE = "Apache-2.0"<br>
               LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=">file://LICENSE;md5=</a><wbr>d2794c0df5b907fdace235a619d803<wbr>14"<br>
              <br>
              -SRCREV_distribution="<wbr>0810eba2adf048b776214729912119<wbr>24d9ec31c5"<br>
              -SRC_URI = "git://<a
href="http://github.com/docker/distribution.git;branch=master;name=distribution;destsuffix=git/src/github.com/docker/distribution"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/docker/<wbr>distribution.git;branch=<wbr>master;name=distribution;<wbr>destsuffix=git/src/github.com/<wbr>docker/distribution</a>
              \<br>
              +SRCREV_distribution="<wbr>48294d928ced5dd9b378f7fd7c6f5d<wbr>a3ff3f2c89"<br>
              +SRC_URI = "git://<a
href="http://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/docker/<wbr>distribution.git;branch=<wbr>release/2.6;name=distribution;<wbr>destsuffix=git/src/github.com/<wbr>docker/distribution</a>
              \<br>
                          <a class="moz-txt-link-freetext" href="file://docker-registry.service">file://docker-registry.service</a> \<br>
                         "<br>
              <br>
               PACKAGES =+ "docker-registry"<br>
              <br>
              -PV = "v2.6.0-rc+git${SRCPV}"<br>
            </blockquote>
            <div><br>
            </div>
            <div>This stays as a _git recipe. Please re-send it with
              _git and the PV restored.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks, I will send V2<br>
    <br>
    Yi<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4NCrLd2Nd5GijNHxMrDSYzQDyAYzEiQYOqoMPQXSoXLXQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
               S = "${WORKDIR}/git/src/<a
                href="http://github.com/docker/distribution"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.<wbr>com/docker/distribution</a>"<br>
              <br>
               inherit goarch<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  2.7.4<br>
                  <br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------277F09D32EA7C5D347304836--
