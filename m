Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 702EDE00D04; Mon, 18 Mar 2019 20:16:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,TRACKER_ID autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.3 TRACKER_ID BODY: Incorporates a tracking ID number
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D640AE00B58
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 20:16:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2J3FTYa004547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2019 20:15:59 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 18 Mar 2019 20:15:22 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	<meta-virtualization@yoctoproject.org>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <14216a2e-5d99-0a51-2f20-2deda907754d@windriver.com>
Date: Tue, 19 Mar 2019 11:15:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.188]
Subject: Help: consul do_compile failed after go upgrade to v1.12.
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
X-List-Received-Date: Tue, 19 Mar 2019 03:16:27 -0000
Content-Type: multipart/alternative;
	boundary="------------FD1A155CCBADFE297FC590F2"
Content-Language: en-US

--------------FD1A155CCBADFE297FC590F2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bruce,

There is a failure on do_compile of consul under meta-cloud-services.

This is introduced by go-1.12 which was upgraded several days ago.


But it can't be reproduced on my ubuntu-host, while only be reproduced 
on Yocto.

I try my best to fix it but has no result.

So, I will be great appreciate for anyone's help.


Thanks,

Hongzhi


There are some info about the failure:


Error info:

[

    # github.com/hashicorp/consul/connect/certgen
    type..eUfRrckI: missing section for relocation target type..FEeY9FdU
    type..eUfRrckI: reloc 8 (R_CALL) to non-elf symbol type..FEeY9FdU
    (outer=type..FEeY9FdU) 49 (SABIALIAS)
    # github.com/hashicorp/consul
    type..eUfRrckI: missing section for relocation target type..FEeY9FdU
    type..K6Uq9NPs: missing section for relocation target type..tBBUxeDj

]

    The above info come from go/src/cmd/link/internal/ld/data.go


Commit ID from go upstream:

    685aca45dc8435df7b7e8059a42a8a98efdaf22c

    cmd/compile, cmd/link: separate stable and internal ABIs


Script: consul: run.do_compile

    The following command failed with -linkshared. It will pass if
    remove -linkshared.

    x86_64-poky-linux-go install *-linkshared* -p 128 -v -ldflags="-r
    /usr/lib/go/pkg/linux_amd64_dynlink  -extldflags ' -m64 -march=core2
    -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong 
    -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
    -Werror=format-security
    --sysroot=/ala-lpggp22/hsong/poky/build/tmp/work/core2-64-poky-linux/consul/git-r0/recipe-sysroot
    -Wl,-rpath-link=/ala-lpggp22/hsong/poky/build/tmp/work/core2-64-poky-linux/consul/git-r0/recipe-sysroot/usr/lib/go/pkg/linux_amd64_dynlink
    -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
    -fstack-protector-strong -Wl,-z,relro,-z,now'" -buildmode=pie
    `go_list_packages`


[EOF]



--------------FD1A155CCBADFE297FC590F2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Bruce,</p>
    <p>There is a failure on do_compile of consul under
      meta-cloud-services.</p>
    <p>This is introduced by go-1.12 which was upgraded several days
      ago.</p>
    <p><br>
    </p>
    <p>But it can't be reproduced on my ubuntu-host, while only be
      reproduced on Yocto.</p>
    <p>I try my best to fix it but has no result.<br>
    </p>
    <p>So, I will be great appreciate for anyone's help.<br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Hongzhi</p>
    <p><br>
    </p>
    <p>There are some info about the failure:</p>
    <p><br>
    </p>
    <p>Error info: <br>
    </p>
    <p>[</p>
    <blockquote>
      <p># github.com/hashicorp/consul/connect/certgen<br>
        type..eUfRrckI: missing section for relocation target
        type..FEeY9FdU<br>
        type..eUfRrckI: reloc 8 (R_CALL) to non-elf symbol
        type..FEeY9FdU (outer=type..FEeY9FdU) 49 (SABIALIAS)<br>
        # github.com/hashicorp/consul<br>
        type..eUfRrckI: missing section for relocation target
        type..FEeY9FdU<br>
        type..K6Uq9NPs: missing section for relocation target
        type..tBBUxeDj<br>
      </p>
    </blockquote>
    <p>]</p>
    <blockquote>
      <p>The above info come from go/src/cmd/link/internal/ld/data.go<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Commit ID from go upstream: <br>
    </p>
    <blockquote>
      <p>685aca45dc8435df7b7e8059a42a8a98efdaf22c<br>
      </p>
      cmd/compile, cmd/link: separate stable and internal ABIs<br>
    </blockquote>
    <p><br>
    </p>
    <p>Script: consul: run.do_compile</p>
    <blockquote>
      <p>The following command failed with -linkshared. It will pass if
        remove -linkshared.<br>
      </p>
    </blockquote>
    <blockquote>x86_64-poky-linux-go install <b>-linkshared</b> -p 128
      -v -ldflags="-r /usr/lib/go/pkg/linux_amd64_dynlink  -extldflags '
      -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
      -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
      -Wformat-security -Werror=format-security
--sysroot=/ala-lpggp22/hsong/poky/build/tmp/work/core2-64-poky-linux/consul/git-r0/recipe-sysroot
-Wl,-rpath-link=/ala-lpggp22/hsong/poky/build/tmp/work/core2-64-poky-linux/consul/git-r0/recipe-sysroot/usr/lib/go/pkg/linux_amd64_dynlink
      -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
      -fstack-protector-strong -Wl,-z,relro,-z,now'" -buildmode=pie
      `go_list_packages`<br>
    </blockquote>
    <p><br>
    </p>
    <p>[EOF]<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------FD1A155CCBADFE297FC590F2--
