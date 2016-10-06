Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AEE3E00831; Thu,  6 Oct 2016 13:43:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B4F6E0077E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Oct 2016 13:43:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u96KhJns005890
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 6 Oct 2016 13:43:20 -0700 (PDT)
Received: from [172.25.59.210] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 13:43:18 -0700
To: <meta-virtualization@yoctoproject.org>
References: <1475786077-10185-1-git-send-email-jason.wessel@windriver.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <a2c4f077-1588-6d0d-c2be-b97276a71726@windriver.com>
Date: Thu, 6 Oct 2016 15:43:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475786077-10185-1-git-send-email-jason.wessel@windriver.com>
Subject: Re: [v2 PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Thu, 06 Oct 2016 20:43:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2016 03:34 PM, Jason Wessel wrote:
> The go-cross package is explicitly for compiling target libraries on
> the host system.  When the target architecture matches the host
> architecture it will actually use the host's linker and compiler
> however which can result in the generation of the cgo.a library having
> linker symbols which might not work properly when compiling other
> packages.
>
> A typical error looks like this when building consul-migrate:
>
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/x86_64-linux/go/pkg/tool/linux_amd64/link: running x86_64-yocto-linux-gcc failed: exit status 1
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: /opt/build-intel-x86/tmp/work/core2-64-yocto-linux/consul-migrate/git-r0/build-tmp/go-link-956548052/000002.o: unrecognized relocation (0x2a) in section `.text'
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: final link failed: Bad value
> collect2: error: ld returned 1 exit status
>
> The fix is to use the make.bash --target-only option to properly build
> the libraries with the target toolchain.  The "go" binaries are thrown
> away but the cross compilation libraries are preserved.  The sysroot
> strip also has to be disabled because it will run the host strip on
> the target binaries.

The v2 patch was further tested against additional failure cases that were revealed by the v1 patch.   The v1 patch had the problem that the target binary was later run on the host and it could fail to load its shared libraries.   This time around the binaries are separated from the cross compilation libraries.

It is worth noting that when using a x86_64 host and a ARM target architecture a new build will fail due to sysroot contamination checks because go-cross is actually properly populating the sysroot now.  A clean build is the right answer if you hit the error or manually fixing each error instance by removing the offending files.

Cheers,
Jason.

