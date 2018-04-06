Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DDA2E008EE; Fri,  6 Apr 2018 04:48:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 667FEE005A9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 04:48:35 -0700 (PDT)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w36BmXfC020895
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 6 Apr 2018 13:48:33 +0200
Received: from [139.16.79.111] (MD1FZU9C.ad001.siemens.net [139.16.79.111])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w36BmX4N011897;
	Fri, 6 Apr 2018 13:48:33 +0200
To: meta-virtualization@yoctoproject.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <d08821dd-51e6-f69c-c2c4-27798bcb7794@siemens.com>
Date: Fri, 6 Apr 2018 13:48:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
Cc: Raymond Danks <ray.danks@se-eng.com>
Subject: docker-proxy links against host libraries
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
X-List-Received-Date: Fri, 06 Apr 2018 11:48:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello

I observed some strange linking problem with the "docker-proxy" when building for qemux86-64.

It seems that the binary is linked against the host version of

```
$ file image/usr/bin/docker-proxy
image/usr/bin/docker-proxy: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, not stripped
                                                                                                                 ^^^^^^
```

I only noticed the issue on my build as it is a multi lib Debian where the libraries are under /lib64 and /lib32.
However on the target there there is only /lib to the binary did not work there.

Only the docker-proxy binary is affected by this, the other binaries (docker, dockerd) are fine.

```
$ file image/usr/bin/docker
image/usr/bin/docker: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=c118d2393c7932172ca3e183bb304fe1cff73ce5, not stripped
```

I tried to fix the recipe by replacing the build command for docker-proxy [1] with the following line:

```
${GO} build ${GOBUILDFLAGS} -o ${S}/src/import/docker-proxy github.com/docker/libnetwork/cmd/proxy
```

But without success the linked loader is still wrong.

It is also worth mentioning that this only happens with x86_64 builds (tried: qemux86-64, genericx64-64) but not with other architectures like armv7.
I was also able to reproduce this on poky master today (commit: 9ed34e315a8d2db58e212b0770dfa8f4ad00f637).


The only solution I found so far is to put the docker-proxy into a separate recipe and add it as a RDEPENDS to docker.
I will submit a patch for this and you can decide if this would be an acceptable solution.

Regards
Pascal

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker_git.bb#n119


