Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C03E9E00CBD; Wed, 30 May 2018 00:31:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D54A7E00C88
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 May 2018 00:31:27 -0700 (PDT)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w4U7VPL5006703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 30 May 2018 09:31:25 +0200
Received: from [139.22.39.171] ([139.22.39.171])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w4U7VPX9029793;
	Wed, 30 May 2018 09:31:25 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	akuster808 <akuster808@gmail.com>
References: <20180525135820.9279-1-pascal.bach@siemens.com>
	<CADkTA4POi2ym7_hXqNuwMT-4dCMnMBVWMkEsuvuhqVGNnym3EQ@mail.gmail.com>
	<765b8896-ad3b-4e58-18e0-78ab15e31d9e@gmail.com>
	<CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <fe8a2439-b1c2-0f2a-7b84-9df6fe14bdf2@siemens.com>
Date: Wed, 30 May 2018 09:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M9Rz8FerSQxVYLC4Xnb8=TJo3WsD4BcQqgX89ZAyTRew@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] runc: allow enabling seccomp
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
X-List-Received-Date: Wed, 30 May 2018 07:31:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 29.05.2018 16:45, Bruce Ashfield wrote:
>
>
> On Tue, May 29, 2018 at 10:33 AM, akuster808 <akuster808@gmail.com <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 05/29/2018 07:25 AM, Bruce Ashfield wrote:
>>     merged.
>>
>>     Bruce
>>
>>     On Fri, May 25, 2018 at 9:58 AM, Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>> wrote:
>>
>>         This requires libseccomp from meta-security so it is not enabled by default.
>>
>
>     will there be a patch to add this dependency to the layer.conf ?
>
>
>
> We just tweaked it, but yes it will need another patch.
>
> But that dependency is conditional, do we have examples of how to make the layer.conf dependency conditional ? We may need a distro or other feature, I suppose.
>
> Bruce
I did not enable it by default exactly for the reason that I didn't want to include another dependency. We currently add meta-security to our distro layer and just have a bbappnd there that enables seccomp for docker.
But if you would be OK with addind meta-security as a dependency that would be fine with me too ;)

Pascal
>  
>
>
>     - armin
>
>>
>>         Signed-off-by: Pascal Bach <pascal.bach@siemens.com <mailto:pascal.bach@siemens.com>>
>>         ---
>>          recipes-containers/runc/runc.inc | 6 +++++-
>>          1 file changed, 5 insertions(+), 1 deletion(-)
>>
>>         diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
>>         index 9199cef..6d11a6e 100644
>>         --- a/recipes-containers/runc/runc.inc
>>         +++ b/recipes-containers/runc/runc.inc
>>         @@ -12,6 +12,10 @@ PV = "${RUNC_VERSION}+git${SRCPV}"
>>
>>          inherit go
>>          inherit goarch
>>         +inherit pkgconfig
>>         +
>>         +PACKAGECONFIG ??= ""
>>         +PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>>
>>          RRECOMMENDS_${PN} = "lxc docker"
>>          PROVIDES += "virtual/runc"
>>         @@ -22,7 +26,7 @@ GO_IMPORT = "import"
>>          LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer <http://github.com/opencontainers/runc/libcontainer>"
>>
>>          do_configure[noexec] = "1"
>>         -EXTRA_OEMAKE="BUILDTAGS='' GO=${GO}"
>>         +EXTRA_OEMAKE="BUILDTAGS='${PACKAGECONFIG_CONFARGS}' GO=${GO}"
>>
>>          do_compile() {
>>                 # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>         -- 
>>         2.11.0
>>
>>         -- 
>>         _______________________________________________
>>         meta-virtualization mailing list
>>         meta-virtualization@yoctoproject.org <mailto:meta-virtualization@yoctoproject.org>
>>         https://lists.yoctoproject.org/listinfo/meta-virtualization <https://lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>>
>>
>>
>>     -- 
>>     "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
>>
>>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"


