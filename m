Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1048BE00DB1; Tue,  3 Sep 2019 19:03:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87813E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 19:03:41 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x84234Yc008320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 19:03:14 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 3 Sep 2019 19:02:53 -0700
To: akuster808 <akuster808@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <1567497660-75506-1-git-send-email-hongxu.jia@windriver.com>
	<CADkTA4OWtpRXJV0bJAbt9xO4oCte0DVyiO55-GGh=fqPucU2nQ@mail.gmail.com>
	<47fbd63a-708b-cafa-b4c8-e73924be3156@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <2d93272d-08a1-f6fa-d24d-cfc20e63d862@windriver.com>
Date: Wed, 4 Sep 2019 10:02:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <47fbd63a-708b-cafa-b4c8-e73924be3156@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: Fix CVE-2019-14271 loading of nsswitch based config inside chroot under Glibc
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
X-List-Received-Date: Wed, 04 Sep 2019 02:03:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 9/4/19 2:28 AM, akuster808 wrote:
>
> On 9/3/19 10:40 AM, Bruce Ashfield wrote:
>> On Tue, Sep 3, 2019 at 4:02 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>> Backport a patch from upstream to fix CVE-2019-14271
>> Given the docker version bumps that Stefan posted earlier, is this
>> still required ?
In Stefan upgraded patch earlier, it switched from moby:master to 
engine:19.03,

I found the upgraded version contains the patch

commit fa8dd90ceb7bcb9d554d27e0b9087ab83e54bd2b
Author: Justin Cormack <justin.cormack@docker.com>
Date:   Thu Jul 25 15:24:39 2019 +0100

     Initialize nss libraries in Glibc so that the dynamic libraries are 
loaded in the host
     environment not in the chroot from untrusted files.

     See also OpenVZ 
https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234

     Signed-off-by: Justin Cormack <justin.cormack@docker.com>
     (cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
     Signed-off-by: Tibor Vass <tibor@docker.com>

$ git branch -r --contains fa8dd90ceb7bcb9d554d27e0b9087ab83e54bd2b
   origin/19.03

If Stefan's patch is accepted, please ignore this one

//Hongxu

> What about stable branches? can this be reused for any of them?

I am afraid it exists on master branch only

jia@pek-lpg-core1-vm2:/buildarea1/hjia/community/moby$ git branch -r 
--contains a316b10dab79d9298b02c7930958ed52e0ccf4e4
   origin/HEAD -> origin/master
   origin/master




> - armin
>> Bruce
>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   recipes-containers/docker/docker_git.bb            |  1 +
>>>   ...nss-libraries-in-Glibc-so-that-the-dynami.patch | 50 ++++++++++++++++++++++
>>>   2 files changed, 51 insertions(+)
>>>   create mode 100644 recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>>>
>>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>>> index e45f87e..e993017 100644
>>> --- a/recipes-containers/docker/docker_git.bb
>>> +++ b/recipes-containers/docker/docker_git.bb
>>> @@ -45,6 +45,7 @@ SRC_URI = "\
>>>          file://docker.init \
>>>          file://0001-libnetwork-use-GO-instead-of-go.patch \
>>>          file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
>>> +       file://0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch \
>>>          "
>>>
>>>   require docker.inc
>>> diff --git a/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>>> new file mode 100644
>>> index 0000000..67ddd49
>>> --- /dev/null
>>> +++ b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>>> @@ -0,0 +1,50 @@
>>> +From b688546c8e35ce48d02dd5adf156399b37590b26 Mon Sep 17 00:00:00 2001
>>> +From: Justin Cormack <justin.cormack@docker.com>
>>> +Date: Thu, 25 Jul 2019 15:24:39 +0100
>>> +Subject: [PATCH] Initialize nss libraries in Glibc so that the dynamic
>>> + libraries are loaded in the host environment not in the chroot from untrusted
>>> + files.
>>> +
>>> +See also OpenVZ https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234
>>> +
>>> +Signed-off-by: Justin Cormack <justin.cormack@docker.com>
>>> +(cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
>>> +Signed-off-by: Tibor Vass <tibor@docker.com>
>>> +
>>> +CVE: CVE-2019-14271
>>> +Upstream-Status: Backport [a316b10dab79d9298b02c7930958ed52e0ccf4e4]
>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> +---
>>> + src/import/pkg/chrootarchive/archive.go | 9 +++++++++
>>> + 1 file changed, 9 insertions(+)
>>> +
>>> +diff --git a/src/import/pkg/chrootarchive/archive.go b/src/import/pkg/chrootarchive/archive.go
>>> +index 6ff61e6..83ed0c6 100644
>>> +--- a/src/import/pkg/chrootarchive/archive.go
>>> ++++ b/src/import/pkg/chrootarchive/archive.go
>>> +@@ -4,13 +4,22 @@ import (
>>> +       "fmt"
>>> +       "io"
>>> +       "io/ioutil"
>>> ++      "net"
>>> +       "os"
>>> ++      "os/user"
>>> +       "path/filepath"
>>> +
>>> +       "github.com/docker/docker/pkg/archive"
>>> +       "github.com/docker/docker/pkg/idtools"
>>> + )
>>> +
>>> ++func init() {
>>> ++      // initialize nss libraries in Glibc so that the dynamic libraries are loaded in the host
>>> ++      // environment not in the chroot from untrusted files.
>>> ++      _, _ = user.Lookup("docker")
>>> ++      _, _ = net.LookupHost("localhost")
>>> ++}
>>> ++
>>> + // NewArchiver returns a new Archiver which uses chrootarchive.Untar
>>> + func NewArchiver(idMapping *idtools.IdentityMapping) *archive.Archiver {
>>> +       if idMapping == nil {
>>> +--
>>> +2.8.1
>>> +
>>> --
>>> 2.8.1
>>>
>


