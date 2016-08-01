Return-Path: <ml@embed.me.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40C28E00E23; Mon,  1 Aug 2016 04:15:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 381 seconds by postgrey-1.32 at yocto-www;
	Mon, 01 Aug 2016 04:15:09 PDT
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34D6AE00E23
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Aug 2016 04:15:09 -0700 (PDT)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 44771DC85E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Aug 2016 11:08:47 +0000 (UTC)
To: meta-virtualization@yoctoproject.org
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <477920ec-9e1b-1e2b-9368-92be651280bc@embed.me.uk>
Date: Mon, 1 Aug 2016 12:08:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: go-distribution-digest failing
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
X-List-Received-Date: Mon, 01 Aug 2016 11:15:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Seems like its (weird) unpack method it uses is failing somehow. I have 
no understanding of why it's done like this and not just a normal git 
repo but this is the error I'm getting.

DEBUG: Executing shell function do_install
cp: cannot stat 
'/home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/git/*': 
No such file or directory
WARNING: 
/home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/temp/run.do_install.3442:1 
exit 1 from 'cp -r 
/home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/git/* 
/home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/image/usr/local/go/src/github.com/docker/distribution/'
ERROR: Function failed: do_install (log file is located at 
/home/jack/work/vispp/docker-oe/build/tmp-glibc/work/aarch64-oe-linux/go-distribution-digest/git-r0/temp/log.do_install.3442)

Anyone with insight into the unpack method any idea why it's failing?

Regards,
Jack.

