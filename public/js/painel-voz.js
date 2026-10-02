(function () {
    'use strict';

    console.log('painel-voz.js carregado');

    let vozes = [];

    function carregarVozes() {
        vozes = window.speechSynthesis.getVoices();

        console.log(
            '[painel-voz] Vozes disponíveis:',
            vozes.map(v => `${v.name} (${v.lang})`)
        );
    }

    carregarVozes();

    window.speechSynthesis.onvoiceschanged = carregarVozes;

    window.PainelVoz = {

        falarChamada(chamada) {
            if (!chamada) {
                return;
            }

            const senha = chamada.senha || '';

            if (!senha) {
                return;
            }

            const local = chamada.local || '';
            const numeroLocal = chamada.numeroLocal || '';

            console.log('[painel-voz] Falando:', {
                senha: senha,
                local: local,
                numeroLocal: numeroLocal,
            });

            const texto = `Senha ${senha}, dirigir-se ao ${local} ${numeroLocal}`;

            const utterance = new SpeechSynthesisUtterance(texto);

            utterance.lang = 'pt-BR';
            utterance.rate = 0.72;
            utterance.pitch = 1;
            utterance.volume = 1;

            // Procura uma voz feminina em português do Brasil
            const vozFeminina = vozes.find(voz =>
                voz.lang === 'pt-BR' &&
                (
                    voz.name.toLowerCase().includes('maria') ||
                    voz.name.toLowerCase().includes('francisca') ||
                    voz.name.toLowerCase().includes('female') ||
                    voz.name.toLowerCase().includes('feminina')
                )
            );

            if (vozFeminina) {
                utterance.voice = vozFeminina;
                console.log('[painel-voz] Voz selecionada:', vozFeminina.name);
            } else {
                console.warn('[painel-voz] Nenhuma voz feminina encontrada.');
            }

            window.speechSynthesis.cancel();
            window.speechSynthesis.speak(utterance);
        },
    };
})();