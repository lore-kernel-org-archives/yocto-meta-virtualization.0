Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web10.5066.1606301033428995330
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 02:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=yxaQzK57;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: dingo@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 249a34d4
	for <meta-virtualization@lists.yoctoproject.org>;
	Wed, 25 Nov 2020 11:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=to
	:from:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; s=obsd; bh=xzbdW6p0rEh7JL6b6SY55OYmx
	6nWxVvrXy/Y8i+y9cA=; b=yxaQzK57Z0YQHUb2wXyfywIFIuSJ9xtK64S47LrkN
	r+ohp9KZ+feLD+EKq6AWOlTByl9JXhOUi9NGGplzK0a0lBV1pArmGbcc4z/0sE4D
	NCRdmtIeQ7bLflv0JXNRuU3rketaGc4Zx2x6pjSJawzdTiJiuO/oKLUCQKAkL1OP
	7Htm9q9ikZoetL0e9qTDvjn0/Sl7V/4DYklfTUUEG1cgdZhO7XLifFO2oFyHGLsd
	s+csBenZqGgFuKhSgof1zaZ1T6FWByL/6+0982QwCIS1lpLvP7ogvtFGPeHr0rzW
	CFYsyUOqSYIqW7t1gPblXdHKZbGuGcUwih6NcwodG/whQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=to:from
	:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; q=dns; s=obsd; b=V9URIQnQfDl+CITff0g
	jYFe0RP+T0ElzhO5IktViXdunnM1QLHqbuIleFE7h+TtA+2ISnKOhLQX3PyD1swS
	02h0QNddxjf1g3NuO33hB+KSEidB4+241wnemYBCVzqeXkto/m90u8ym1Wvcqkhp
	BFkYJwI/XipcAKR/vUdPh7mABu6NfyPQcdFBeQcx5IEa6BQhuwr9da9O0uF7JNqJ
	mrhGkuh6UIDd7ZiZLi/IMP6hWJAOARSqwovJPfA32czlMhxfx274eQEzoWpRQYky
	/19pamvCQPBvY6m0TuB80YNYwkoiqcUUqdnoOENgAj5SCX3mWVeChb3zN1qGzTSj
	1dw==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 94ce6c9f (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=support@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Wed, 25 Nov 2020 11:43:49 +0100 (CET)
To: meta-virtualization@lists.yoctoproject.org
From: "Dingo" <dingo@optimcloud.com>
Subject: go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
Message-ID: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
Date: Wed, 25 Nov 2020 17:43:43 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

NOTE: Executing Tasks
ERROR: 
kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0 
do_compile: Execution of 
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769' 
failed with exit code 2:
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
+++ [1125 10:38:01] Building go targets for linux/amd64:
     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
!!! [1125 10:38:02] Call tree:
!!! [1125 10:38:02]  1: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 
kube::golang::build_some_binaries(...)
!!! [1125 10:38:02]  2: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 
kube::golang::build_binaries_for_platform(...)
!!! [1125 10:38:02]  3: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
!!! [1125 10:38:02] Call tree:
!!! [1125 10:38:02]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
!!! [1125 10:38:02] Call tree:
!!! [1125 10:38:02]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
make[1]: *** [Makefile.generated_files:197: 
_output/bin/prerelease-lifecycle-gen] Error 1
make: *** [Makefile:545: generated_files] Error 2
WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769:179 
exit 2 from 'make generated_files GO="go" 
KUBE_BUILD_PLATFORMS="linux/amd64"'
WARNING: Backtrace (BB generated script):
     #1: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769, 
line 179
     #2: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769, 
line 198

Backtrace (metadata-relative locations):
     #1: do_compile, 
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, 
line 55
ERROR: Logfile of failure stored in: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.3481769

