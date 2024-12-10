Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631FBE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 03:42:16 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.2250.1733802135088497300
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 19:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQZ850aM;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so40620326d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 19:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733802134; x=1734406934; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BW9qk/aeZJcx6emG6tYtytPMJMg6amUgJc1E9gp3V1M=;
        b=LQZ850aMPqmHA/mG1c93qVFhuZ97CpYRp5fidJhpVsB+1LVFPnlon3F9DoF8msg3lM
         UOH9M8FdYXvYo4/oCL/33YW7B0cqZU+jqY/KAQzQ5OmBVbFjWh/D4jTP4hlinYeRrOpx
         yA0YHhL82ML4nDbce3YjW1dMRHE4RSdOMsiw9WMSg8HxYLcCGh7Czm7MJnPDNmt1n7Ti
         TW4ITicodi045nwN72+kCT+4lAOuvBJoBy4Hl9X+aPqou1SY7KdmnzaRwMiUau7F/p8g
         GYCohF07USD7k3JoJelFH8LiFegJL/0MaLIoqbYCOY0m5/d5VNDGELfglVlacpYnsqbM
         7J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733802134; x=1734406934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW9qk/aeZJcx6emG6tYtytPMJMg6amUgJc1E9gp3V1M=;
        b=of+8Mh/Cr+ylpi6Qo3/Pd0HyLHVQjnG2SZq0hY1X5fe9ljzNkQInNWOyqNMxHx23In
         isKHZuoWSCOw6+lfmL6M28RBiJErZhJWxwbx9gn57ghZ8MMNTqC8ZDM21QOQ+hL7Ri4g
         hYl4LHiFwwfWGk0By3UzXEakT5EwYauZGwVNx6g8JbW8CQxVbgN+59BUN4PrsEAvkxlG
         GMBSjuA/JlM1G4H1mGGg0DlVFkQ4IlCe3hdre0ZebAjRT4q3/NtfpzMCMWlVcxaqPOtJ
         G7NJHSTSoGFSnQcVqPB9uHenzmgNdoVwhqQ6/UWo0j2NuiZJrEj4CkR8eO5h4pr0KIDV
         M8vg==
X-Gm-Message-State: AOJu0Ywr0IeXL7GzL4FyfljASrWk6ZZYZhHiK7VcM+hxl6dN424QjQfX
	ABIRKx8olIuYJXMdL1uXAYKbvRJ3hWR1WO5gwjKLietw53H2aL4i
X-Gm-Gg: ASbGnctDTNSv8KuIaABugZr2hAp1xn/T/GHuyGfEW2IAOlyzSXX6qBvHQDpHSnH0cpg
	8uuMGUETAuhSkLjL41nYaqa3hTr4j/jeJmbhcdg8rnz76pVWA4dimFsWbKBP8nHv7rT1s9ZvbdI
	0y5vSLi228Dv0TCDmJ9X+M4xW4ft+F0DCOXFV/OMMmLdu4X32o0lA6wOLJ/M4AKaFJeBqwE8bp1
	Fa2eFu2vZkWzMimZohHnAsjLKdeiEN12ZRdAGI+3t1mjBOEZxm3oUe18vMDsXF+T1bYR/8npGJE
	+mjUXKzCeXiV18Z4p0wvHUXHsnso1oZ5
X-Google-Smtp-Source: AGHT+IHRXI6GegiFfogulTu8AKGavpHf6BGqEPDOEZshCxW3uVxO9jlhJ/d89LZhdbUoL9rxKTvJyA==
X-Received: by 2002:ad4:5f0e:0:b0:6d8:a80e:229 with SMTP id 6a1803df08f44-6d91e44a90amr50942636d6.47.1733802133822;
        Mon, 09 Dec 2024 19:42:13 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fe9e1sm55652126d6.82.2024.12.09.19.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 19:42:12 -0800 (PST)
Date: Tue, 10 Dec 2024 03:42:10 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peng.zhang1.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] cri-o: enable ptest
Message-ID: <Z1e4koyFabCYA/Xl@gmail.com>
References: <20241128152439.937326-1-peng.zhang1.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128152439.937326-1-peng.zhang1.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 03:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9050

v2 looks good!

merged.

Bruce

In message: [meta-virtualization][PATCH v2] cri-o: enable ptest
on 28/11/2024 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> 
> The ptest build for cri-o was previously disabled due to issues
> introduced with Go 1.11, which borken the build process. With the
> current Go version, these issues no longer occur, and the ptest build is
> now functional.
> This commit enables ptest support and resolves the "TMPDIR
> [buildpaths]" issue encountered during the ptest build process.
> 
> A total of 382 test cases were executed, with the following results:
> PASS: 317
> FAIL: 33
> SKIP: 32
> 
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  recipes-containers/cri-o/README.md            | 452 ++++++++++++++++++
>  recipes-containers/cri-o/cri-o_git.bb         |  33 +-
>  .../0001-Add-trimpath-to-build-nri.test.patch |  31 ++
>  recipes-containers/cri-o/files/run-ptest      |  11 +
>  4 files changed, 525 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-containers/cri-o/README.md
>  create mode 100644 recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
>  create mode 100644 recipes-containers/cri-o/files/run-ptest
> 
> diff --git a/recipes-containers/cri-o/README.md b/recipes-containers/cri-o/README.md
> new file mode 100644
> index 00000000..e3dac040
> --- /dev/null
> +++ b/recipes-containers/cri-o/README.md
> @@ -0,0 +1,452 @@
> +# CRI-O Ptest Guide
> +
> +The CRI-O ptest suite is a comprehensive and complex testing framework. This document provides key information and tips for its usage.
> +
> +
> +## 1. Vendor Directory
> +
> +By default, the `vendor` directory is not installed for ptest. However, the `ctr_seccomp.bats` test relies on a JSON file located at:  
> +`vendor/github.com/containers/common/pkg/seccomp/seccomp.json`.
> +As a result, the ctr_seccomp.bats test will fail unless this file is manually added. 
> +
> +### Steps to add seccomp.json:
> +- Manually create/copy the required JSON file.
> +- Set the `CONTAINER_SECCOMP_PROFILE` environment variable to point to the file's location.
> +
> +## 2. Runtime Dependencies (RDEPENDS)
> +
> +The ptest suite requires several dependencies. As of the initial implementation, the runtime dependencies are defined as follows:
> +
> +```bash
> +RDEPENDS:${PN}-ptest += " \
> +    bash \
> +    bats \
> +    cni \
> +    crictl \
> +    coreutils \
> +    dbus-daemon-proxy \
> +    iproute2 \
> +    util-linux-unshare \
> +    jq \
> +    slirp4netns \
> +    parallel \
> +    podman \
> +"
> +```
> +### Explanation of Dependencies:
> +- **bash / bats**: The ptest suite is written using BATS and requires support from Bash.
> +- **cni / crictl / podman**: Tools for testing container creation, runtime, and networking, directly invoked by the tests.
> +- **jq**: Used in test scripts to create or manipulate JSON files.
> +- **iproute2  / slirp4netns**: Networking utilities required for validating network-related functionalities.
> +- **coreutils / dbus-daemon-proxy / util-linux-unshare**: Additional utilities supporting various test cases.
> +- **paralle**: bats using "parallel" to execute test in serial.
> +
> +## 3. Testing Log (Baseline Reference)
> +
> +A summary of the test results is provided below for baseline reference:
> +
> +- **PASS**: 317 tests  
> +- **FAIL**: 33 tests  
> +- **SKIP**: 32 tests  
> +
> +#### Full Log Example:
> +Below is an excerpt from a typical ptest log:
> +```bash
> +root@intel-x86-64:~# ptest-runner cri-o -t 1000
> +START: ptest-runner
> +2024-11-23T14:50
> +BEGIN: /usr/lib64/cri-o/ptest
> +SKIP: 1 apparmor tests (in sequence) # skip apparmor not enabled
> +PASS: 2 no CDI errors, create ctr without CDI devices
> +PASS: 3 no CDI errors, create ctr with CDI devices
> +PASS: 4 no CDI errors, create ctr with annotated CDI devices
> +PASS: 5 no CDI errors, create ctr with duplicate annotated CDI devices
> +PASS: 6 no CDI errors, fail to create ctr with unresolvable CDI devices
> +PASS: 7 no CDI errors, fail to create ctr with unresolvable annotated CDI devices
> +PASS: 8 CDI registry refresh
> +PASS: 9 CDI registry refresh, annotated CDI devices
> +PASS: 10 reload CRI-O CDI parameters
> +PASS: 11 reload CRI-O CDI parameters, with annotated CDI devices
> +PASS: 12 CDI with errors, create ctr without CDI devices
> +PASS: 13 CDI with errors, create ctr with (unaffected) CDI devices
> +PASS: 14 CDI with errors, create ctr with (unaffected) annotated CDI devices
> +PASS: 15 pids limit
> +PASS: 16 conmon pod cgroup
> +PASS: 17 conmon custom cgroup
> +PASS: 18 conmon custom cgroup with no infra container
> +SKIP: 19 conmonrs custom cgroup with no infra container # skip not supported for conmon
> +SKIP: 20 ctr with swap should be configured # skip swap not enabled
> +SKIP: 21 ctr with swap should fail when swap is lower # skip swap not enabled
> +PASS: 22 ctr swap only configured if enabled
> +SKIP: 23 ctr with swap should succeed when swap is unlimited # skip swap not enabled
> +PASS: 24 cgroupv2 unified support
> +SKIP: 25 cpu-quota.crio.io can disable quota # skip node must be configured with cgroupv1 for this test
> +SKIP: 26 checkpoint and restore one container into a new pod (drop infra:true) # skip CRIU check failed
> +SKIP: 27 checkpoint and restore one container into a new pod (drop infra:false) # skip CRIU check failed
> +SKIP: 28 checkpoint and restore one container into a new pod using --export to OCI image # skip CRIU check failed
> +SKIP: 29 checkpoint and restore one container into a new pod using --export to OCI image using repoDigest # skip CRIU check failed
> +SKIP: 30 checkpoint and restore one container into a new pod with a new name # skip CRIU check failed
> +PASS: 31 crio commands
> +PASS: 32 invalid ulimits
> +PASS: 33 invalid devices
> +PASS: 34 invalid metrics port
> +PASS: 35 invalid log max
> +PASS: 36 log max boundary testing
> +PASS: 37 default config should be empty
> +PASS: 38 config dir should succeed
> +PASS: 39 config dir should fail with invalid option
> +PASS: 40 config dir should fail with invalid evented_pleg option
> +PASS: 41 choose different default runtime should succeed
> +PASS: 42 runc not existing when default_runtime changed should succeed
> +PASS: 43 retain default runtime should succeed
> +PASS: 44 monitor fields should be translated
> +PASS: 45 handle nil workloads
> +PASS: 46 config dir should fail with invalid disable_hostport_mapping option
> +SKIP: 47 conmonrs is used # skip not using conmonrs
> +SKIP: 48 test cpu load balancing # skip not yet supported on cgroup2
> +SKIP: 49 test cpu load balance disabled on manual stop # skip not yet supported on cgroup2
> +SKIP: 50 test cpu load balance disabled on container exit # skip not yet supported on cgroup2
> +PASS: 51 container memory metrics
> +SKIP: 52 container memory cgroupv1-specific metrics # skip
> +PASS: 53 storage directory check should find no issues
> +PASS: 54 storage directory check should find errors
> +PASS: 55 storage directory check should repair errors
> +PASS: 56 storage directory check should wipe everything on repair errors
> +PASS: 57 remove containers and images when remove both
> +PASS: 58 remove containers when remove temporary
> +PASS: 59 clear neither when remove persist
> +PASS: 60 don't clear podman containers
> +PASS: 61 clear everything when shutdown file not found
> +PASS: 62 clear podman containers when shutdown file not found
> +PASS: 63 fail to clear podman containers when shutdown file not found but container still running
> +PASS: 64 don't clear containers on a forced restart of crio
> +PASS: 65 don't clear containers if clean shutdown supported file not present
> +PASS: 66 internal_wipe remove containers and images when remove both
> +PASS: 67 internal_wipe remove containers when remove temporary and node reboots
> +PASS: 68 internal_wipe remove containers when remove temporary
> +PASS: 69 internal_wipe clear both when remove persist
> +PASS: 70 internal_wipe don't clear podman containers
> +PASS: 71 internal_wipe don't clear containers on a forced restart of crio
> +PASS: 72 internal_wipe eventually cleans network on forced restart of crio if network is slow to come up
> +PASS: 73 clean up image if corrupted on server restore
> +PASS: 74 recover from badly corrupted storage directory
> +SKIP: 75 run the critest suite # skip critest because RUN_CRITEST is not set
> +PASS: 76 ctr not found correct error message
> +PASS: 77 ctr termination reason Completed
> +PASS: 78 ctr termination reason Error
> +PASS: 79 ulimits
> +PASS: 80 ctr remove
> +PASS: 81 ctr lifecycle
> +PASS: 82 ctr pod lifecycle with evented pleg enabled
> +FAIL: 83 ctr logging
> +PASS: 84 ctr log cleaned up if container create failed
> +PASS: 85 ctr journald logging
> +PASS: 86 ctr logging [tty=true]
> +FAIL: 87 ctr log max
> +FAIL: 88 ctr log max with default value
> +FAIL: 89 ctr log max with minimum value
> +FAIL: 90 ctr partial line logging
> +PASS: 91 ctrs status for a pod
> +PASS: 92 ctr list filtering
> +PASS: 93 ctr list label filtering
> +PASS: 94 ctr metadata in list & status
> +PASS: 95 ctr execsync conflicting with conmon flags parsing
> +PASS: 96 ctr execsync
> +PASS: 97 ctr execsync should not overwrite initial spec args
> +PASS: 98 ctr execsync should succeed if container has a terminal
> +PASS: 99 ctr execsync should cap output
> +PASS: 100 ctr exec{,sync} should be cancelled when container is stopped
> +PASS: 101 ctr device add
> +PASS: 102 privileged ctr device add
> +PASS: 103 privileged ctr add duplicate device as host
> +PASS: 104 ctr hostname env
> +PASS: 105 ctr execsync failure
> +PASS: 106 ctr execsync exit code
> +PASS: 107 ctr execsync std{out,err}
> +PASS: 108 ctr stop idempotent
> +PASS: 109 ctr caps drop
> +PASS: 110 ctr with default list of capabilities from crio.conf
> +PASS: 111 ctr with list of capabilities given by user in crio.conf
> +PASS: 112 ctr with add_inheritable_capabilities has inheritable capabilities
> +PASS: 113 ctr /etc/resolv.conf rw/ro mode
> +PASS: 114 ctr create with non-existent command
> +PASS: 115 ctr create with non-existent command [tty]
> +PASS: 116 ctr update resources
> +PASS: 117 ctr correctly setup working directory
> +PASS: 118 ctr execsync conflicting with conmon env
> +PASS: 119 ctr resources
> +PASS: 120 ctr with non-root user has no effective capabilities
> +PASS: 121 ctr has gid in supplemental groups
> +PASS: 122 ctr has gid in supplemental groups with Merge policy
> +PASS: 123 ctr has only specified gid in supplemental groups with Strict policy
> +PASS: 124 ctr with low memory configured should not be created
> +PASS: 125 privileged ctr -- check for rw mounts
> +PASS: 126 annotations passed through
> +PASS: 127 ctr with default_env set in configuration
> +PASS: 128 ctr with absent mount that should be rejected
> +PASS: 129 ctr that mounts container storage as shared should keep shared
> +PASS: 130 ctr that mounts container storage as private should not be private
> +PASS: 131 ctr that mounts container storage as read-only option but not recursively
> +SKIP: 132 ctr that mounts container storage as recursively read-only # skip requires crictl version "1.30" or newer
> +SKIP: 133 ctr that fails to mount container storage as recursively read-only without readonly option # skip requires crictl version "1.30" or newer
> +SKIP: 134 ctr that fails to mount container storage as recursively read-only without private propagation # skip requires crictl version "1.30" or newer
> +PASS: 135 ctr has containerenv
> +PASS: 136 ctr stop timeouts should decrease
> +PASS: 137 ctr with node level pid namespace should not leak children
> +PASS: 138 ctr HOME env newline invalid
> +PASS: 139 ctr log linking
> +PASS: 140 ctr stop loop kill retry attempts
> +PASS: 141 ctr multiple stop calls
> +PASS: 142 pause/unpause ctr with right ctr id
> +PASS: 143 pause ctr with invalid ctr id
> +PASS: 144 pause ctr with already paused ctr
> +PASS: 145 unpause ctr with right ctr id with running ctr
> +PASS: 146 unpause ctr with invalid ctr id
> +PASS: 147 remove paused ctr
> +FAIL: 148 ctr seccomp profiles unconfined
> +FAIL: 149 ctr seccomp profiles runtime/default
> +FAIL: 150 ctr seccomp profiles wrong profile name
> +FAIL: 151 ctr seccomp profiles localhost profile name
> +FAIL: 152 ctr seccomp overrides unconfined profile with runtime/default when overridden
> +FAIL: 153 ctr seccomp profiles runtime/default block unshare
> +SKIP: 154 ctr_userns run container # skip userns testing not enabled
> +PASS: 155 bind secrets mounts to container
> +PASS: 156 default mounts correctly sorted with other mounts
> +PASS: 157 additional devices support
> +PASS: 158 additional devices permissions
> +PASS: 159 annotation devices support
> +PASS: 160 annotation should not be processed if not allowed
> +PASS: 161 annotation should override configured additional_devices
> +PASS: 162 annotation should not be processed if not allowed in allowed_devices
> +PASS: 163 annotation should configure multiple devices
> +PASS: 164 annotation should fail if one device is invalid
> +PASS: 165 test infra ctr dropped
> +PASS: 166 test infra ctr not dropped
> +PASS: 167 test infra ctr dropped status
> +PASS: 168 pod test hooks
> +PASS: 169 run container in pod with image ID
> +PASS: 170 container status when created by image ID
> +PASS: 171 container status when created by image tagged reference
> +PASS: 172 container status when created by image canonical reference
> +PASS: 173 container status when created by image list canonical reference
> +PASS: 174 image pull and list
> +PASS: 175 image pull and list using imagestore
> +SKIP: 176 image pull with signature # skip registry has some issues
> +PASS: 177 image pull and list by tag and ID
> +PASS: 178 image pull and list by digest and ID
> +PASS: 179 image pull and list by manifest list digest
> +PASS: 180 image pull and list by manifest list tag
> +PASS: 181 image pull and list by manifest list and individual digest
> +PASS: 182 image pull and list by individual and manifest list digest
> +PASS: 183 image list with filter
> +PASS: 184 image list/remove
> +PASS: 185 image status/remove
> +SKIP: 186 run container in pod with crun-wasm enabled # skip crun-wasm not installed or runtime type is VM
> +PASS: 187 check if image is pinned appropriately
> +PASS: 188 run container in pod with timezone configured
> +PASS: 189 run container in pod with local timezone
> +PASS: 190 run container with memory_limit_in_bytes -1
> +PASS: 191 run container with memory_limit_in_bytes 12.5MiB
> +PASS: 192 run container with container_min_memory 17.5MiB
> +PASS: 193 run container with container_min_memory 5.5MiB
> +PASS: 194 run container with empty container_min_memory
> +PASS: 195 image remove with multiple names, by name
> +PASS: 196 image remove with multiple names, by ID
> +PASS: 197 image volume ignore
> +PASS: 198 image volume bind
> +PASS: 199 image volume user mkdir
> +PASS: 200 image fs info with default settings should return matching container_filesystem and image_filesystem
> +PASS: 201 image fs info with imagestore set should return different filesystems
> +PASS: 202 test infra ctr cpuset
> +PASS: 203 info inspect
> +PASS: 204 ctr inspect
> +PASS: 205 pod inspect when dropping infra
> +PASS: 206 ctr inspect not found
> +PASS: 207 inspect image should succeed contain all necessary information
> +SKIP: 208 irqbalance tests (in sequence) # skip irqbalance not found.
> +SKIP: 209 container run with kata should have containerd-shim-kata-v2 process running # skip Not
> +PASS: 210 metrics with default host and port
> +FAIL: 211 metrics with custom host using localhost and random port
> +FAIL: 212 secure metrics with random port
> +FAIL: 213 secure metrics with random port and missing cert/key
> +PASS: 214 pid namespace mode pod test
> +PASS: 215 pid namespace mode target test
> +PASS: 216 KUBENSMNT mount namespace
> +PASS: 217 ensure correct hostname
> +PASS: 218 ensure correct hostname for hostnetwork:true
> +PASS: 219 Check for valid pod netns CIDR
> +PASS: 220 Ensure correct CNI plugin namespace/name/container-id arguments
> +SKIP: 221 Connect to pod hostport from the host # skip node configured with cgroupv2 flakes this test sometimes
> +PASS: 222 Clean up network if pod sandbox fails
> +PASS: 223 Clean up network if pod sandbox fails after plugin success
> +PASS: 224 Clean up network if pod sandbox gets killed
> +PASS: 225 Ping pod from the host / another pod
> +PASS: 226 run NRI PluginRegistration test
> +PASS: 227 run NRI PluginSynchronization test
> +PASS: 228 run NRI PodEvents test
> +PASS: 229 run NRI ContainerEvents test
> +PASS: 230 run NRI MountInjection test
> +PASS: 231 run NRI EnvironmentInjection test
> +PASS: 232 run NRI AnnotationInjection test
> +PASS: 233 run NRI DeviceInjection test
> +PASS: 234 run NRI CpusetAdjustment test
> +PASS: 235 run NRI MemsetAdjustment test
> +PASS: 236 run NRI CpusetAdjustmentUpdate test
> +PASS: 237 run NRI MemsetAdjustmentUpdate test
> +SKIP: 238 OCI image volume mount lifecycle # skip requires crictl version "1.31" or newer
> +PASS: 239 pod release name on remove
> +PASS: 240 pod remove
> +PASS: 241 pod stop ignores not found sandboxes
> +PASS: 242 pod list filtering
> +PASS: 243 pod metadata in list & status
> +PASS: 244 pass pod sysctls to runtime
> +PASS: 245 pass pod sysctls to runtime when in userns
> +SKIP: 246 disable crypto.fips_enabled when FIPS_DISABLE is set # skip The directory /proc/sys/crypto does not exist on this host.
> +PASS: 247 fail to pass pod sysctls to runtime if invalid spaces
> +PASS: 248 fail to pass pod sysctl to runtime if invalid value
> +PASS: 249 skip pod sysctls to runtime if host
> +PASS: 250 pod stop idempotent
> +PASS: 251 pod remove idempotent
> +PASS: 252 pod stop idempotent with ctrs already stopped
> +PASS: 253 restart crio and still get pod status
> +PASS: 254 invalid systemd cgroup_parent fail
> +PASS: 255 systemd cgroup_parent correctly set
> +PASS: 256 kubernetes pod terminationGracePeriod passthru
> +PASS: 257 pod pause image matches configured image in crio.conf
> +PASS: 258 pod stop cleans up all namespaces
> +PASS: 259 pod with the correct etc folder ownership
> +PASS: 260 verify RunAsGroup in container
> +PASS: 261 single cni plugin with pod annotations capability enabled
> +PASS: 262 single cni plugin with pod annotations capability disabled
> +PASS: 263 pod annotations capability for chained cni plugins
> +PASS: 264 accept unsigned image with default policy
> +PASS: 265 deny unsigned image with restrictive policy
> +PASS: 266 accept signed image with default policy
> +FAIL: 267 accept signed image with restrictive policy
> +PASS: 268 accept unsigned image with not existing namespace policy
> +PASS: 269 accept unsigned image with higher priority namespace policy
> +PASS: 270 deny unsigned image with higher priority namespace policy
> +FAIL: 271 accept signed image with higher priority namespace policy
> +PASS: 272 pprof
> +PASS: 273 pprof over unix socket
> +PASS: 274 reload config should succeed
> +PASS: 275 reload config should succeed with 'log_level'
> +PASS: 276 reload config should fail with 'log_level' if invalid
> +PASS: 277 reload config should fail with if config is malformed
> +PASS: 278 reload config should succeed with 'pause_image'
> +PASS: 279 reload config should succeed with 'pause_command'
> +PASS: 280 reload config should succeed with 'pause_image_auth_file'
> +PASS: 281 reload config should fail with non existing 'pause_image_auth_file'
> +PASS: 282 reload config should succeed with 'log_filter'
> +PASS: 283 reload config should fail with invalid 'log_filter'
> +PASS: 284 reload config should succeed with 'decryption_keys_path'
> +PASS: 285 reload config should succeed with 'seccomp_profile'
> +FAIL: 286 reload config should not fail with invalid 'seccomp_profile'
> +SKIP: 287 reload config should succeed with 'apparmor_profile' # skip apparmor not enabled
> +SKIP: 288 reload config should fail with invalid 'apparmor_profile' # skip apparmor not enabled
> +PASS: 289 reload config should add new runtime
> +PASS: 290 reload config should update 'pinned_images'
> +PASS: 291 reload config should update 'pinned_images' and only 'pause_image' is pinned
> +PASS: 292 reload config should update 'pause_image' and it becomes 'pinned_images'
> +PASS: 293 reload config should remove pinned images when an empty list is provided
> +PASS: 294 reload system registries should succeed
> +PASS: 295 reload system registries should succeed with new registry
> +PASS: 296 reload system registries should fail on invalid syntax in file
> +PASS: 297 system registries should succeed with new registry without reload
> +PASS: 298 system registries should fail on invalid syntax in file without reload
> +PASS: 299 system handles burst of configuration changes without excessive reloads
> +PASS: 300 system handles duplicate events for the same file
> +PASS: 301 crio restore
> +PASS: 302 crio restore with pod stopped
> +PASS: 303 crio restore with bad state and pod stopped
> +PASS: 304 crio restore with bad state and ctr stopped
> +PASS: 305 crio restore with bad state and ctr removed
> +PASS: 306 crio restore with bad state and pod removed
> +PASS: 307 crio restore with bad state
> +PASS: 308 crio restore with missing config.json
> +PASS: 309 crio restore first not managing then managing
> +PASS: 310 crio restore first managing then not managing
> +PASS: 311 crio restore changing managing dir
> +PASS: 312 crio restore upon entering KUBENSMNT
> +PASS: 313 crio restore upon exiting KUBENSMNT
> +PASS: 314 crio restore volumes for containers
> +PASS: 315 crictl runtimeversion
> +PASS: 316 if fs.may_detach_mounts is set
> +FAIL: 317 seccomp notifier with runtime/default
> +FAIL: 318 seccomp notifier with runtime/default but not stop
> +FAIL: 319 seccomp notifier with custom profile
> +FAIL: 320 seccomp notifier should not work if annotation is not allowed
> +FAIL: 321 seccomp OCI artifact with image annotation without suffix
> +FAIL: 322 seccomp OCI artifact with image annotation for pod
> +FAIL: 323 seccomp OCI artifact with image annotation for container
> +PASS: 324 seccomp OCI artifact with image annotation but not allowed annotation on runtime config
> +FAIL: 325 seccomp OCI artifact with image annotation and profile set to unconfined
> +PASS: 326 seccomp OCI artifact with image annotation but set runtime default profile with higher priority
> +FAIL: 327 seccomp OCI artifact with image annotation but set localhost profile with higher priority
> +FAIL: 328 seccomp OCI artifact with pod annotation
> +FAIL: 329 seccomp OCI artifact with container annotation
> +PASS: 330 seccomp OCI artifact with bogus annotation
> +PASS: 331 seccomp OCI artifact with missing artifact
> +PASS: 332 selinux label level=s0 is sufficient
> +SKIP: 333 selinux skips relabeling if TrySkipVolumeSELinuxLabel annotation is present # skip not enforcing
> +SKIP: 334 selinux skips relabeling for super privileged container # skip not enforcing
> +PASS: 335 ctr check shared /dev/shm
> +PASS: 336 check /dev/shm is changed
> +PASS: 337 check /dev/shm fails with incorrect values
> +PASS: 338 stats
> +PASS: 339 container stats
> +PASS: 340 pod stats
> +PASS: 341 status not should fail if no subcommand is provided
> +PASS: 342 status should succeed to retrieve the config
> +PASS: 343 status should fail to retrieve the config with invalid socket
> +PASS: 344 status should succeed to retrieve the info
> +PASS: 345 status should fail to retrieve the info with invalid socket
> +PASS: 346 succeed to retrieve the container info
> +PASS: 347 should fail to retrieve the container info without ID
> +PASS: 348 should fail to retrieve the container with invalid socket
> +PASS: 349 should not clean up pod after timeout
> +FAIL: 350 emit metric when sandbox is re-requested
> +PASS: 351 should not clean up container after timeout
> +PASS: 352 should clean up pod after timeout if request changes
> +PASS: 353 should clean up container after timeout if request changes
> +PASS: 354 should clean up pod after timeout if not re-requested
> +PASS: 355 should not wait for actual duplicate pod request
> +PASS: 356 should clean up container after timeout if not re-requested
> +FAIL: 357 emit metric when container is re-requested
> +PASS: 358 should not be able to operate on a timed out pod
> +PASS: 359 should not be able to operate on a timed out container
> +PASS: 360 should not wait for actual duplicate container request
> +PASS: 361 check umask is changed
> +FAIL: 362 userns annotation auto should succeed
> +PASS: 363 userns annotation auto with keep-id and map-to-root should fail
> +FAIL: 364 userns annotation auto should map host run_as_user
> +FAIL: 365 version
> +PASS: 366 version -j
> +PASS: 367 test workload gets configured to defaults
> +PASS: 368 test workload can override defaults
> +PASS: 369 test workload should not be set if not defaulted or specified
> +PASS: 370 test workload should not be set if annotation not specified
> +PASS: 371 test workload pod gets configured to defaults
> +PASS: 372 test workload can override pod defaults
> +PASS: 373 test workload pod should not be set if not defaulted or specified
> +PASS: 374 test workload pod should not be set if annotation not specified
> +PASS: 375 test workload pod should override infra_ctr_cpuset option
> +PASS: 376 test workload allowed annotation should not work if not configured
> +PASS: 377 test workload allowed annotation appended with runtime
> +PASS: 378 test workload allowed annotation works for pod
> +PASS: 379 test resource cleanup on bad annotation contents
> +PASS: 380 test workload pod should not be set if annotation not specified even if prefix
> +PASS: 381 test special runtime annotations not allowed
> +PASS: 382 test special runtime annotations allowed
> +
> +real    9m12.847s
> +user    42m18.946s
> +sys     8m15.064s
> +DURATION: 553
> +END: /usr/lib64/cri-o/ptest
> +2024-11-23T14:59
> +STOP: ptest-runner
> +TOTAL: 1 FAIL: 0
> +root@intel-x86-64:~#
> +```
> +
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index efc86fbe..f04c4feb 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>  SRCREV_cri-o = "20c06a19cb395445620c31730c0f1a0a1922eaae"
>  SRC_URI = "\
>  	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.31;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
> +        file://0001-Add-trimpath-to-build-nri.test.patch \
>          file://crio.conf \
> +        file://run-ptest \
>  	"
>  
>  # Apache-2.0 for docker
> @@ -28,7 +30,7 @@ GO_IMPORT = "import"
>  
>  PV = "1.31.0+git${SRCREV_cri-o}"
>  
> -inherit features_check
> +inherit features_check ptest
>  REQUIRED_DISTRO_FEATURES ?= "seccomp"
>  
>  DEPENDS = " \
> @@ -69,6 +71,13 @@ do_compile() {
>  	oe_runmake binaries
>  }
>  
> +do_compile_ptest() {
> +    set +e
> +
> +    cd ${S}/src/import
> +
> +    oe_runmake test-binaries
> +}
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
>  SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','crio.service','',d)}"
>  SYSTEMD_AUTO_ENABLE:${PN} = "enable"
> @@ -100,6 +109,12 @@ do_install() {
>      install -d ${D}${localstatedir}/lib/crio
>  }
>  
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    install -d ${D}${PTEST_PATH}/bin
> +    cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
> +    cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
> +}
>  FILES:${PN}-config = "${sysconfdir}/crio/config/*"
>  FILES:${PN} += "${systemd_unitdir}/system/*"
>  FILES:${PN} += "/usr/local/bin/*"
> @@ -109,7 +124,21 @@ FILES:${PN} += "/usr/share/containers/oci/hooks.d"
>  ALLOW_EMPTY:${PN} = "1"
>  
>  INSANE_SKIP:${PN} += "ldflags already-stripped textrel"
> +INSANE_SKIP:${PN}-ptest += "textrel"
>  
> -deltask compile_ptest_base
> +RDEPENDS:${PN}-ptest += " \
> +    bash \
> +    bats \
> +    cni \
> +    crictl \
> +    coreutils \
> +    dbus-daemon-proxy \
> +    iproute2 \
> +    util-linux-unshare \
> +    jq \
> +    slirp4netns \
> +    parallel \
> +    podman \
> +"
>  
>  COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
> diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
> new file mode 100644
> index 00000000..c6be41f0
> --- /dev/null
> +++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
> @@ -0,0 +1,31 @@
> +From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001
> +From: Peng Zhang <peng.zhang1.cn@windriver.com>
> +Date: Fri, 25 Oct 2024 10:42:02 +0800
> +Subject: [PATCH] Add --trimpath to build nri.test
> +
> +when build test-binary, TMPDIR[buildpaths] error found in nri.test
> +to fix this error, add "--trimpath" option to build nri.test.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
> +===================================================================
> +--- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/Makefile
> ++++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
> +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
> + 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
> + 
> + test/nri/nri.test: $(wildcard test/nri/*.go)
> +-	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
> ++	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIMPATH}
> + 
> + bin/crio: $(GO_FILES)
> + 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/cri-o/files/run-ptest b/recipes-containers/cri-o/files/run-ptest
> new file mode 100644
> index 00000000..62abe959
> --- /dev/null
> +++ b/recipes-containers/cri-o/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +./test/test_runner.sh | while IFS= read -r line; do
> +	if [[ $line =~ ^not\ ok ]]; then
> +		echo "FAIL: ${line#not ok }"
> +	elif [[ $line =~ ^ok && ! $line =~ \#\ skip ]]; then
> +		echo "PASS: ${line#ok }"
> +	elif [[ $line =~ ^ok.*#\ skip ]]; then
> +		echo "SKIP: ${line#ok }"
> +	fi
> +done
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9017): https://lists.yoctoproject.org/g/meta-virtualization/message/9017
> Mute This Topic: https://lists.yoctoproject.org/mt/109823133/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


