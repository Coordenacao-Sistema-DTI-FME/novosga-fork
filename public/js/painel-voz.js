(function () {
    'use strict';

    console.log('painel-voz.js carregado');

    let vozes = [];

    function carregarVozes() {
        vozes = window.speechSynthesis.getVoices();

        console.log(
            '[painel-voz] Vozes disponíveis:',
            vozes.map(v => `${v.name} | ${v.lang}`)
        );
    }

    // As vozes podem carregar de forma assíncrona
    carregarVozes();

    if ('onvoiceschanged' in window.speechSynthesis) {
        window.speechSynthesis.onvoiceschanged = carregarVozes;
    }

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

            // Procura uma voz brasileira
            const vozPtBr = vozes.find(voz =>
                voz.lang.toLowerCase() === 'pt-br'
            );

            if (vozPtBr) {
                utterance.voice = vozPtBr;

                console.log(
                    '[painel-voz] Voz selecionada:',
                    vozPtBr.name
                );
            }

            window.speechSynthesis.cancel();
            window.speechSynthesis.speak(utterance);
        },
    };
})();