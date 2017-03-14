Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 622F8E00901; Tue, 14 Mar 2017 05:07:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFDCBE0050B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 05:07:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2EC7KZW013993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 05:07:20 -0700 (PDT)
Received: from server.local (128.224.23.12) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 05:07:19 -0700
To: Fathi Boudra <fathi.boudra@linaro.org>
References: <20170209072501.19696-1-fathi.boudra@linaro.org>
	<CAGNsrLDDmdv9tgxN5MAtmNQ32t=_rt92_sQprTPU3QCJzeC9uw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <a5610e3e-2ae4-8610-ee31-859aae9dfd3e@windriver.com>
Date: Tue, 14 Mar 2017 08:07:18 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAGNsrLDDmdv9tgxN5MAtmNQ32t=_rt92_sQprTPU3QCJzeC9uw@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: downgrade lxc/docker-registry/rt-tests to suggests
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
X-List-Received-Date: Tue, 14 Mar 2017 12:07:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-14 3:17 AM, Fathi Boudra wrote:
> Bruce, can you cherry-pick this patch in Morty branch?
> or do you prefer I send a patch for the branch?

No need for a patch, this is definitely good enough!

They cherry pick and push is now done for morty.

Cheers,

Bruce

>
> On 9 February 2017 at 09:25, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> Regular users don't need lxc, docker-registry and rt-tests on the target.
>> These tools aren't even needed or provide additional features when running
>> docker at runtime. They also increase the size of the image uneccessarily.
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  recipes-containers/docker/docker_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>> index c208a02..81fd4d4 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -61,8 +61,8 @@ RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
>>                    ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
>>                   "
>>  RDEPENDS_${PN} += "containerd runc"
>> -RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
>> -RRECOMMENDS_${PN} += " kernel-module-dm-thin-pool kernel-module-nf-nat"
>> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
>> +RSUGGESTS_${PN} = "lxc docker-registry rt-tests"
>>  DOCKER_PKG="github.com/docker/docker"
>>
>>  do_configure[noexec] = "1"
>> --
>> 2.11.0
>>
>
> Cheers,
> Fathi
>


